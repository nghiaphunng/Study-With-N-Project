package Controller.otheruser;

import java.io.IOException;
import java.io.PrintWriter;
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

import BEAN.User;
import DAO.ErrorDAO;
import DAO.FollowDAO;
import DB.DBConnection;

@WebServlet("/GetFollowingListOfOtherUser")
public class GetFollowingListOfOtherUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public GetFollowingListOfOtherUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBConnection.CreateConnection();
		try {			
			HttpSession session = request.getSession(false);
			if(session == null) {
				RequestDispatcher rd = request.getRequestDispatcher("LoginForward");
				rd.forward(request, response);
			}
			User user = (User) session.getAttribute("sessionUser");       
			if (user == null) {
				RequestDispatcher rd = request.getRequestDispatcher("LoginForward");
				rd.forward(request, response);
	        }
			int userId = Integer.parseInt(request.getParameter("userId"));
	        List<User> followerList = FollowDAO.DisplayFollowingUserId(conn, userId);
	        
	        response.setCharacterEncoding("UTF-8");
	        response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        
	        out.println("<div class=\"followers-group\">");
	        for(User userFollwer : followerList) {
	        	out.println("<div class=\"follower-item\">\n"
	        			+ "			<img alt=\"error\" class=\"avatar\" src=\"" + userFollwer.getUserAvatarURL() + "\">\n"
	        			+ "			<div class=\"info-follower\">\r\n");
	        	if(userFollwer.getUserId() == user.getUserId()) out.println("<a href=\"ProfileForward\" class=\"fullname-follower\">" + userFollwer.getFullName() + "</strong></a>");
	        	else if(userFollwer.getUserId() != user.getUserId()) out.println("<a href=\"UserInforPageForward?userid=" + userFollwer.getUserId() + "\" class=\"fullname-follower\">" + userFollwer.getFullName() + "</strong></a>");

	        	out.println("				<div class=\"loginname-follower\">" + userFollwer.getUserName() + "</div>\n"
	        			+ "				<div class=\"birthday-follower\">" + userFollwer.getBirthday() + "</div>\n"
	        			+ "			</div>\n"
	        			+ "			<div class=\"social-stats\">\n"
	        			+ "				<br>\r\n"
	        			+ "				<div class=\"\">" + userFollwer.getNumberFollower() + " Follower</div>\n"
	        			+ "				<div class=\"\">" + userFollwer.getNumberFollowing() + " Đang Follow</div>\n"
	        			+ "			</div>\n"
	        			+ "		</div>");
	        }
	        out.println("</div>");
	        
		}catch(Exception e) {
			ErrorDAO.insertError(conn, "messageErrorGetFollowingListOfOtherUser", e.getMessage());
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
