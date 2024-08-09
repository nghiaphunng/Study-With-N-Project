package Controller;

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

import BEAN.Course;
import BEAN.Post;
import BEAN.User;
import DAO.SearchDAO;
import DB.DBConnection;

@WebServlet("/SearchController")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getCharacterEncoding() != null) {
			request.setCharacterEncoding("UTF-8");
		}
		
		try {
			Connection conn = DBConnection.CreateConnection();
			String key = request.getParameter("search");
			int scope = Integer.parseInt(request.getParameter("scope"));	
			HttpSession session = request.getSession(false);
			if(session == null) {
				if(scope == 0) {
					//tìm kiếm tên tất cả từ database
					List<Course> searchNameCourseList = SearchDAO.searchNameCourseList(request, conn, key);
					request.setAttribute("searchCourseList", searchNameCourseList);
					
					List<User> searchNameUserList = SearchDAO.searchNameUserList(request, conn, key);
					request.setAttribute("searchUserList", searchNameUserList);
					
					List<Post> searchNamePostList = SearchDAO.searchNamePostPublicList(request, conn, key);
					request.setAttribute("listPost", searchNamePostList);
				}
				else if(scope == 1) {
					//tìm kiếm môn học từ database
					List<Course> searchNameCourseList = SearchDAO.searchNameCourseList(request, conn, key);
					request.setAttribute("searchCourseList", searchNameCourseList);
				}
				else if(scope == 2) {
					//tìm kiếm người dùng từ database
					List<User> searchNameUserList = SearchDAO.searchNameUserList(request, conn, key);
					request.setAttribute("searchUserList", searchNameUserList);
				}
				else if(scope == 3) {
					//tìm kiếm post người dùng từ database
					List<Post> searchNamePostList = SearchDAO.searchNamePostPublicList(request, conn, key);
					request.setAttribute("listPost", searchNamePostList);		
				}
			}
			else {
				User user = (User) session.getAttribute("sessionUser");
				if(user == null) {
					if(scope == 0) {
						//tìm kiếm tên tất cả từ database
						List<Course> searchNameCourseList = SearchDAO.searchNameCourseList(request, conn, key);
						request.setAttribute("searchCourseList", searchNameCourseList);
						
						List<User> searchNameUserList = SearchDAO.searchNameUserList(request, conn, key);
						request.setAttribute("searchUserList", searchNameUserList);
						
						List<Post> searchNamePostList = SearchDAO.searchNamePostPublicList(request, conn, key);
						request.setAttribute("listPost", searchNamePostList);
					}
					else if(scope == 1) {
						//tìm kiếm môn học từ database
						List<Course> searchNameCourseList = SearchDAO.searchNameCourseList(request, conn, key);
						request.setAttribute("searchCourseList", searchNameCourseList);
					}
					else if(scope == 2) {
						//tìm kiếm người dùng từ database
						List<User> searchNameUserList = SearchDAO.searchNameUserList(request, conn, key);
						request.setAttribute("searchUserList", searchNameUserList);
					}
					else if(scope == 3) {
						//tìm kiếm post người dùng từ database
						List<Post> searchNamePostList = SearchDAO.searchNamePostPublicList(request, conn, key);
						request.setAttribute("listPost", searchNamePostList);		
					}
				}
				else {
					if(scope == 0) {
						//tìm kiếm tên tất cả từ database
						List<Course> searchNameCourseList = SearchDAO.searchNameCourseList(request, conn, key);
						request.setAttribute("searchCourseList", searchNameCourseList);
						
						List<User> searchNameUserList = SearchDAO.searchNameUserList(request, conn, key);
						request.setAttribute("searchUserList", searchNameUserList);
						
						List<Post> searchNamePostList = SearchDAO.searchNamePostUserList(request, conn, key, user.getUserId());
						request.setAttribute("listPost", searchNamePostList);
					}
					else if(scope == 1) {
						//tìm kiếm môn học từ database
						List<Course> searchNameCourseList = SearchDAO.searchNameCourseList(request, conn, key);
						request.setAttribute("searchCourseList", searchNameCourseList);
					}
					else if(scope == 2) {
						//tìm kiếm người dùng từ database
						List<User> searchNameUserList = SearchDAO.searchNameUserList(request, conn, key);
						request.setAttribute("searchUserList", searchNameUserList);
					}
					else if(scope == 3) {
						//tìm kiếm post người dùng từ database
						List<Post> searchNamePostList = SearchDAO.searchNamePostUserList(request, conn, key, user.getUserId());
						request.setAttribute("listPost", searchNamePostList);		
					}
				}
			}			
			 RequestDispatcher rd = request.getRequestDispatcher("View/Search/SearchResult.jsp");
			 rd.forward(request, response);
			
			//đóng cổng kết nối với database
			conn.close();
		}catch(Exception e) {
			request.setAttribute("messageErrorSearch", e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}
}
