package Controller.personalpost.comment;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BEAN.Comment;
import BEAN.User;
import DAO.CommentDAO;
import DB.DBConnection;

@WebServlet("/DisplayCommentPost")
public class DisplayCommentPost extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DisplayCommentPost() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getCharacterEncoding() != null) {
			request.setCharacterEncoding("UTF-8");
		}
		try {
			HttpSession session = request.getSession(false);
			User user = (User) session.getAttribute("sessionUser");
			Connection conn = DBConnection.CreateConnection();
			int postId = Integer.parseInt(request.getParameter("postId"));
			//hiển thị bình luận
			List<Comment> listCmt = CommentDAO.DisplayCommentPost(request, conn, postId);
			
			response.setCharacterEncoding("UTF-8");
		    response.setContentType("text/html; charset=UTF-8");
		    PrintWriter out = response.getWriter();
		    
		    int countComment = CommentDAO.getCommentCountByPostId(conn, postId);
		    out.println("<h4 style=\"font-size: 20px; color: dodgerblue; margin-top: 0px\">" + countComment + " lượt bình luận</h4>");
		    for(Comment cmt : listCmt) {
		    	out.println("<div class=\"list-comment\">\r\n"
		    			+ "												<img src=\"" + cmt.getUserAvatarURL() + "\" alt=\"User Avatar\" class=\"avatar\">\r\n"
		    			+ "												<div class=\"comment-content\">\r\n"
		    			+ "													<div class=\"username\">");
		    	if(user.getUserId() == cmt.getUserId()) {
		    		out.println("<a href=\"ProfileForward\" class=\"name-user-post\" title=\"" + cmt.getNameLoginUser() + "\" style=\"font-weight: bold;\">" + cmt.getFullNameUser() + "</a>");
		    	}
		    	else if(user.getUserId() != cmt.getUserId()) {
		    		out.println("<a href=\"UserInforPageForward?userid=" + cmt.getUserId() + "\" class=\"name-user-post\" title=\"" + cmt.getNameLoginUser() + "\" style=\"font-weight: bold;\">" + cmt.getFullNameUser() + "</a>");
		    	}
		    	out.println("													</div>\r\n"
		    			+ "													<div class=\"comment-text\">" + cmt.getContent() + "</div>\r\n"
		    			+ "												</div>	\r\n"
		    			+ (user.getUserId() == cmt.getUserId() ? "<button type=\"button\" class=\"delete-comment-btn\" onclick=\"DeleteCommentPost(" + cmt.getCommentId() + ", " + cmt.getPostId() + ")\"><i style=\"font-size:30px;color:red;\" class=\"fa fa-close\"></i></button>" : "") 
		    			+ "											</div>");
		    }

			//đóng cổng kết nối với database
			conn.close();
		}catch(Exception e) {
			request.setAttribute("messageErrorDisplayCommentPost", e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
