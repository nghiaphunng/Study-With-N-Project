package Controller.personalpost;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

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

@WebServlet("/ProfileForward")
public class ProfileForward extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProfileForward() {
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
        int limit = 5;
        
        //tiếp nhận tìm kiếm bài viết để chỉnh sửa cho người dùng
        String limit_req = (String) session.getAttribute("limit");
        String postid_req = (String) session.getAttribute("postid");
        if(limit_req != null && !limit_req.isEmpty() && postid_req != null && !postid_req.isEmpty()){
        	int postId = Integer.parseInt(postid_req);
        	limit = Integer.parseInt(limit_req);
        	if(limit < 5) limit = 5;
        	request.setAttribute("posthighlight", postId);
        	session.removeAttribute("limit");
        	session.removeAttribute("postid");
        }
        List<Post> listPost = PostDAO.DisplayPostUser(request, conn, user.getUserId(), limit, offset);
        request.setAttribute("listPost", listPost);
        
        //tiếp nhận thông báo cập nhật ảnh đại diện nếu có
        String messageUpdateAvatarUser = (String) session.getAttribute("messageUpdateAvatarUser");
        if (messageUpdateAvatarUser != null && !messageUpdateAvatarUser.isEmpty()) {
            request.setAttribute("messageUpdateAvatarUser", messageUpdateAvatarUser);
            session.removeAttribute("messageUpdateAvatarUser");
        }
        
        try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("View/User/ProfileUser.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
