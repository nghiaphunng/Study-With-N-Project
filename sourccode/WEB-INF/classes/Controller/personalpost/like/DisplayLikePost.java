package Controller.personalpost.like;

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

import BEAN.Like;
import BEAN.User;
import DAO.LikeDAO;
import DB.DBConnection;

@WebServlet("/DisplayLikePost")
public class DisplayLikePost extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DisplayLikePost() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession(false);
			User user = (User) session.getAttribute("sessionUser");
			Connection conn = DBConnection.CreateConnection();
			int postId = Integer.parseInt(request.getParameter("postId"));
			//hiển thị bình luận
			List<Like> listLike = LikeDAO.getLikesByPostId(conn, postId, user.getUserId());
			
			response.setCharacterEncoding("UTF-8");
		    response.setContentType("text/html; charset=UTF-8");
		    PrintWriter out = response.getWriter();
		    
		    for(Like like : listLike) {
		    	out.println("<div class=\"follower-item\">\n"
	        			+ "			<img alt=\"error\" class=\"avatar\" src=\"" + like.getUrlAvaUser() + "\">\n"
	        			+ "			<div class=\"info-follower\" style=\"margin: auto 0px;\">\r\n");
		    	
		    	if(user.getUserId() != like.getUserId()) out.println("<a href=\"UserInforPageForward?userid=" + like.getUserId() + "\" class=\"fullname-follower\"><strong>" + like.getFullNameUser() + "</strong></a>");
		    	else if(user.getUserId() == like.getUserId()) out.println("<a href=\"ProfileForward\" class=\"fullname-follower\"><strong>" + like.getFullNameUser() + "</strong></a>");
		    	
	        	if(like.getRelationshipUser() == 0)  out.println("<button class=\"\" style=\"display: block; font-weight: bold; background-color: darkgray; border: none; cursor: pointer;\">Bạn bè</button>\n");
	        	else if(like.getRelationshipUser() == 1)  out.println("<button class=\"\" style=\"display: block; font-weight: bold; background-color: darkgray; border: none; cursor: pointer;\" onclick=\"ClickFollow(" + like.getUserId() + ", " + postId + ")\">Theo dõi lại</button>\n");
	        	else if(like.getRelationshipUser() == 2)  out.println("<button class=\"\" style=\"display: block; font-weight: bold; background-color: darkgray; border: none; cursor: pointer;\">Đang theo dõi</button>\n");
	        	else if(like.getRelationshipUser() == 3 && user.getUserId() != like.getUserId()) out.println("<button class=\"\" style=\"display: block; font-weight: bold; background-color: darkgray; border: none; cursor: pointer;\" onclick=\"ClickFollow(" + like.getUserId() + ", " + postId + ")\">Theo dõi</button>\n");
	        	
	        	out.println("			</div>\n"
	        	+ "		</div>");
		    }
		    
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
