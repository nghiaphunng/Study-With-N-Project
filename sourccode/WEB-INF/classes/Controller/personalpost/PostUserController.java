package Controller.personalpost;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import BEAN.Post;
import BEAN.User;
import DAO.PostDAO;
import DB.DBConnection;

@WebServlet("/PostUserController")
@MultipartConfig
public class PostUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PostUserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getCharacterEncoding() == null) {
			request.setCharacterEncoding("UTF-8");
		}
		try {
			Connection conn = DBConnection.CreateConnection();
			HttpSession session = request.getSession(false);
			if(session == null) {
				RequestDispatcher rd = request.getRequestDispatcher("LoginForward");
				rd.forward(request, response);
			}
			User user = (User) session.getAttribute("sessionUser");       

			 int scope = Integer.parseInt(request.getParameter("scope")); 
			 int mode = Integer.parseInt(request.getParameter("mode")); //1:thêm bài viết   2:chỉnh sửa bài viết     3:xóa bài viết
			 String title = request.getParameter("title"); 
			 String newContent = request.getParameter("newcontent");
			 String oldContent = request.getParameter("oldcontent");
			
			//tùy chọn mode
			if(mode == 1) { //thêm bài viết 
				PostDAO.UpPostUserId(request, conn, user.getUserId(), scope, title, newContent, oldContent);  
			}
			else if(mode == 2) { //lưu chỉnh sửa bài viết
				int postId = Integer.parseInt(request.getParameter("postid")); 
				PostDAO.EditPostId(request, conn, postId, scope, title, newContent, oldContent); 
			}
			else if(mode == 3) { //xóa bài viết
				int postId = Integer.parseInt(request.getParameter("postid")); 
				PostDAO.DeletePostId(request, conn, postId);
			}
	        //trả về danh sách bài viết
	        int offset = 0;
	        int limit = 5;
	        List<Post> listPost = PostDAO.DisplayPostUser(request, conn, user.getUserId(), limit, offset);
	        request.setAttribute("listPost", listPost);
	        RequestDispatcher rd = request.getRequestDispatcher("View/User/DisplayPosts.jsp");
	        rd.forward(request, response);
	        
	        conn.close();
		}catch(Exception e) {
			request.setAttribute("messageErrorUpPost", e.getMessage());
		}		
	}
}
