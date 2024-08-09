package Controller.personalpost;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BEAN.Post;
import BEAN.User;
import DAO.PostDAO;
import DB.DBConnection;

@WebServlet("/CommunityForward")
public class CommunityForward extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CommunityForward() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBConnection.CreateConnection();
        HttpSession session = request.getSession(false);
		if(session == null) {
			RequestDispatcher rd = request.getRequestDispatcher("LoginForward");
			rd.forward(request, response);
		}
		User user = (User) session.getAttribute("sessionUser");
		if(user == null) {
			RequestDispatcher rd = request.getRequestDispatcher("LoginForward");
			rd.forward(request, response);
		}
		int offset = 0;
        int limit = 10;
        List<Post> listPost = PostDAO.DisplayPostCommunity(request, conn, user.getUserId(), limit, offset);
        //xóa trộn lại danh sách hiển thị
        Random random = new Random();
        Collections.shuffle(listPost, random);
        
        request.setAttribute("listPost", listPost);
        try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("View/User/CommunityUser.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
