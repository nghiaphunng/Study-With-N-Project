package Controller.personalpost;

import java.io.IOException;
import java.sql.Connection;
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
import DAO.InfoUserDAO;
import DB.DBConnection;

@WebServlet("/UserInforPageForward")
public class UserInforPageForward extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UserInforPageForward() {
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
		
		//tải thông tin về :user, bài viết(công khai+follower), contact
		int infoUserId = Integer.parseInt(request.getParameter("userid"));
		User infoUser = InfoUserDAO.GetInfoUser(request, conn, infoUserId);
		
		//tải thông tin về bài post
		int limit = 5;
		int offset = 0;
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
		List<Post> listPostOfInfoOtherUser = InfoUserDAO.DisplayPostInfoOtherUser(request, conn, user.getUserId(), infoUserId, limit, offset);
		
		boolean checkIsFollowing = InfoUserDAO.isFollowing(request, conn, infoUserId, user.getUserId());
		boolean checkIsFollwer = InfoUserDAO.isFollower(request, conn, infoUserId, user.getUserId());
		
		request.setAttribute("infoUser", infoUser);
		request.setAttribute("listPostOfInfoOtherUser", listPostOfInfoOtherUser);
		request.setAttribute("checkIsFollowing", checkIsFollowing);
		request.setAttribute("checkIsFollwer", checkIsFollwer);
		RequestDispatcher rd = request.getRequestDispatcher("View/User/UserInforPage.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
