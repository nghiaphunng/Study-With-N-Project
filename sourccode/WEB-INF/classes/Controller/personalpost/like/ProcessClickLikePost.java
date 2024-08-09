package Controller.personalpost.like;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BEAN.User;
import DAO.LikeDAO;
import DB.DBConnection;

@WebServlet("/ProcessClickLikePost")
public class ProcessClickLikePost extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProcessClickLikePost() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession(false);
			User user = (User) session.getAttribute("sessionUser");
			Connection conn = DBConnection.CreateConnection();
			int postId = Integer.parseInt(request.getParameter("postId"));
			int isUserLiked = Integer.parseInt(request.getParameter("isUserLiked"));
			
			response.setCharacterEncoding("UTF-8");
		    response.setContentType("text/html; charset=UTF-8");
		    PrintWriter out = response.getWriter();
		    
			if(isUserLiked == 0) { //chưa like -> đã like
				LikeDAO.insertLikePost(conn, user.getUserId(), postId);
				int getLikeCount= LikeDAO.getLikeCountByPostId(conn, postId).size();
				out.println("<button onclick=\"ProcessClickLikePost(" + postId + ", 1)\" class=\"show-like-post-btn\"><i class=\"fa fa-thumbs-up\" style=\"color: mediumslateblue;\"></i> Đã Thích (" + getLikeCount + " lượt thích)</button>");
			}
			else if(isUserLiked == 1) { //đã like-> chưa like
				LikeDAO.DeleteLikePost(conn, user.getUserId(), postId);
				int getLikeCount= LikeDAO.getLikeCountByPostId(conn, postId).size();
				out.println("<button onclick=\"ProcessClickLikePost(" + postId + ", 0)\" class=\"show-like-post-btn\"><i class=\"fa fa-thumbs-up\" style=\"color: mediumslateblue;\"></i> Thích (" + getLikeCount + " lượt thích)</button>");
			}		    
		    out.println("<button onclick=\"TogglePopupCommentPost(" + postId + "); DisplayCommentPost(" + postId + ");\" class=\"show-comment-post-btn\"><i class='fas fa-comment' style=\"color: mediumslateblue;\"></i> Bình luận</button>");
		    
		    //đóng cổng kết nối với database
			conn.close();
		}catch(Exception e) {
			request.setAttribute("messageErrorDisplayLikePost", e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
