package Controller.personalpost.follow;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ErrorDAO;
import DAO.FollowDAO;
import DB.DBConnection;

@WebServlet("/InsertFollowController")
public class InsertFollowController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertFollowController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBConnection.CreateConnection();
		int visitingUserId = Integer.parseInt(request.getParameter("visitingUserId"));
		int infoUserId = Integer.parseInt(request.getParameter("infoUserId"));
		FollowDAO.insertFollow(conn, visitingUserId, infoUserId);
		
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			ErrorDAO.insertError(conn, "Error closing Connection(InsertFollowController)", e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
