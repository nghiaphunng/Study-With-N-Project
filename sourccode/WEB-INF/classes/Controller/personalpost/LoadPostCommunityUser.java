package Controller.personalpost;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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

@WebServlet("/LoadPostCommunityUser")
public class LoadPostCommunityUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoadPostCommunityUser() {
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
		int offset = Integer.parseInt(request.getParameter("offset"));
        int limit = 10;
        List<Post> listPost = PostDAO.DisplayPostCommunity(request, conn, user.getUserId(), limit, offset);
        //xóa trộn lại danh sách hiển thị
        Random random = new Random();
        Collections.shuffle(listPost, random);
        
        response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
	    PrintWriter out = response.getWriter();
	    
        for(Post post : listPost) {
        	out.println("<div class=\"post-container\" id=\"post-" + post.getPostId() + "\">\r\n"
        			+ "					<div class=\"info-post\">\r\n"
        			+ "						<img src=\"" + post.getUserAvatarURL() + "\" alt=\"User Avatar\" class=\"avatar\">\r\n"
        			+ "						<div class=\"info-general-post\">\r\n"
        			+ "							<a href=\"UserInforPageForward?userid=" + post.getUserId() + "\" class=\"name-user-post\" style=\"cursor: pointer;\">" + post.getUserName() + "</a>\r\n"
        			+ "							<div class=\"time-up-post\">" + post.getCreatedAt() + "\r\n");
        	
        	if(post.getVisibilityId() == 0) out.println("<i class=\"fa fa-globe\" aria-hidden=\"true\" title=\"Công khai\"></i>");
        	else if(post.getVisibilityId() == 1) out.println("<i class=\"fa fa-users\" aria-hidden=\"true\" title=\"Người theo dõi\"></i>");
        	else if(post.getVisibilityId() == 2) out.println("<i class=\"fa fa-lock\" aria-hidden=\"true\" title=\"Chỉ mình tôi\"></i>");

        	out.println("							</div>\r\n"
        			+ "						</div>\r\n"
        			+ "					</div>\r\n"
        			+ "				\r\n"
        			+ "					<!--hiển thị/chỉnh sửa title và content bài viết  -->\r\n"
        			+ "					<div class=\"content-post\" id=\"edit-post-content-" + post.getPostId() + "\">\r\n");
        	
        	if(post.getTitle() != null && post.getTitle().trim().length() > 0) out.println("<div id=\"title-post-" + post.getPostId() + "\" class=\"title-post\">" + post.getTitle() + "</div>");
        	if(post.getOldContent() != null & post.getOldContent().trim().length() > 0) out.println("<div id=\"describe-post-" + post.getPostId() + "\" class=\"describe-post\">" + post.getNewContent() + "</div>");

        	out.println("					</div>\r\n"
        			+ "					\r\n"
        			+ "					<!-- phần bình luận và like -->\r\n"
        			+ "					<div class=\"comment-post\" id=\"show-comment-post-" + post.getPostId() + "\">\r\n");
        	
        	if(post.getUserLiked() == 1) out.println("<button onclick=\"ProcessClickLikePost(" + post.getPostId() + ", " + post.getUserLiked() + ")\" class=\"show-like-post-btn\"><i class=\"fa fa-thumbs-up\" style=\"color: mediumslateblue;\"></i> Đã Thích (" + post.getLikeList().size() + " lượt thích)</button>");
        	else if(post.getUserLiked() == 0) out.println("<button onclick=\"ProcessClickLikePost(" + post.getPostId() + ", " + post.getUserLiked() + ")\" class=\"show-like-post-btn\"><i class=\"fa fa-thumbs-up\" style=\"color: mediumslateblue;\"></i> Thích (" + post.getLikeList().size() + " lượt thích)</button>");

        	out.println("						<button onclick=\"TogglePopupCommentPost(" + post.getPostId() + "); DisplayCommentPost(" + post.getPostId() + ");\" class=\"show-comment-post-btn\"><i class='fas fa-comment' style=\"color: mediumslateblue;\"></i> Bình luận</button>\r\n"
        			+ "					</div>\r\n"
        			+ "					\r\n"
        			+ "					<!-- Hiển thị cửa sổ bình luận -->\r\n"
        			+ "					<div id=\"popupCommentPost-" + post.getPostId() + "\" class=\"popup-container\">\r\n"
        			+ "						<div class=\"popup-box\" style=\"width: 60%;\">\r\n"
        			+ "							<!-- nội dung bài viết -->\r\n"
        			+ "							<div class=\"info-post\">\r\n"
        			+ "								<img src=\"" + user.getUserAvatarURL() + "\" alt=\"User Avatar\" class=\"avatar\">\r\n"
        			+ "								<div class=\"info-general-post\">\r\n"
        			+ "									<div class=\"name-user-post\">" + post.getUserName() + "</div>\r\n"
        			+ "									<div class=\"time-up-post\">" + post.getCreatedAt() + "\r\n");
        	
        	if(post.getVisibilityId() == 0) out.println("<i class=\"fa fa-globe\" aria-hidden=\"true\" title=\"Công khai\"></i>");
        	else if(post.getVisibilityId() == 1) out.println("<i class=\"fa fa-users\" aria-hidden=\"true\" title=\"Người theo dõi\"></i>");
        	else if(post.getVisibilityId() == 2) out.println("<i class=\"fa fa-lock\" aria-hidden=\"true\" title=\"Chỉ mình tôi\"></i>");

        	out.println("		</div>\r\n"
        			+ "								</div>\r\n"
        			+ "							</div>\r\n"
        			+ "			\r\n"
        			+ "							<!--hiển thị/chỉnh sửa title và content bài viết  -->\r\n"
        			+ "							<div class=\"content-post\" id=\"edit-post-content-" + post.getPostId() + "\">\r\n");
        	
        	if(post.getTitle() != null & post.getTitle().trim().length() >0) out.println("<div id=\"title-post-" + post.getPostId() + "\" class=\"title-post\">" + post.getTitle() + "</div>");
        	if(post.getOldContent() != null && post.getOldContent().trim().length() > 0) out.println("<div id=\"describe-post-" + post.getPostId() + "\" class=\"describe-post\">" + post.getNewContent() + "</div>");
        	
        	out.println("							</div>\r\n"
        			+ "							\r\n"
        			+ "							<!-- hiển thị phần comment -->\r\n"
        			+ "							<h3 style=\"font-size: 20px; color: blue; margin-bottom: 5px;\">Bình luận</h3>\r\n"
        			+ "							<div id=\"show-comment-post-popup-" + post.getPostId() + "\">\r\n"
        			+ "								<!-- hiển thị các comment đã có -->\r\n"
        			+ "							</div>\r\n"
        			+ "							\r\n"
        			+ "							<!-- Nhập comment -->\r\n"
        			+ "							<div class=\"comment-container\">\r\n"
        			+ "								<img src=\"" + user.getUserAvatarURL() + "\" alt=\"User Avatar\" class=\"avatar\">\r\n"
        			+ "								<form id=\"form-comment-" + post.getPostId() + "\">\r\n"
        			+ "								  <textarea class=\"comment-textarea\" placeholder=\"Viết bình luận tại đây...\" name=\"comment-content-post\" required=\"required\" style=\"padding: 10px; margin: 0px 5px 0px 0px; resize: vertical;border-radius: 5px;box-sizing: content-box;max-height: 100px;height: 23px\"></textarea>\r\n"
        			+ "								  <button type=\"button\" class=\"submit-button\" onclick=\"SendCommentPost(" + post.getPostId() + ")\" style=\"margin: auto 0px; padding: 0px 20px;\">Bình luận</button>\r\n"
        			+ "								</form>\r\n"
        			+ "							</div>\r\n"
        			+ "							\r\n"
        			+ "							<!-- đóng cửa sổ -->\r\n"
        			+ "							<button data-postid=\"" + post.getPostId() + "\" class=\"btn-close-popup\" onclick=\"TogglePopupCommentPost(" + post.getPostId() + ")\"><i style=\"font-size:30px;color:red;margin-top: 2px;margin-right: -7px;\" class=\"fa fa-close\"></i></button>\r\n"
        			+ "							<br>\r\n"
        			+ "						</div>\r\n"
        			+ "					</div>\r\n"
        			+ "				</div>");
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
