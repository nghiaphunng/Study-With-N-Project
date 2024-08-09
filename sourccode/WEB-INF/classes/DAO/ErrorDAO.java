package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import BEAN.Error;

public class ErrorDAO {
	public static void insertError(Connection conn, String errorType, String errorDesc) {
		PreparedStatement ptmt = null;
		
		String sql = "insert into error(errorType,errorDesc,errorOccurrenceTime) values (?,?,?)";
		try {
			ptmt = conn.prepareStatement(sql);
			// Lấy thời gian hiện tại và chuyển đổi thành Timestamp
	        Timestamp errorOccurrenceTime = Timestamp.from(Instant.now());
			
			ptmt.setString(1, errorType);
			ptmt.setString(2,  errorDesc);
			ptmt.setTimestamp(3, errorOccurrenceTime);
			
			ptmt.executeUpdate();
		}catch(SQLException e) {
			System.err.println("Error inserting error record: " + e.getMessage());
		}finally {
            if (ptmt != null) {
                try {
                    ptmt.close();
                } catch (SQLException e) {
                    System.err.println("Error closing PreparedStatement: " + e.getMessage());
                }
            }
        }
	}
	
	public static List<Error> DisplayErrorList(HttpServletRequest request, Connection conn, int count){
		List<Error> listError = new ArrayList<Error>();
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM error ORDER BY errorOccurrenceTime DESC LIMIT ?";
		try {
			ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, count);
			rs = ptmt.executeQuery();
			while(rs.next()) {
				Error error = new Error();
				error.setErrorId(rs.getInt("errorId"));
				error.setErrorType(rs.getString("errorType"));
				error.setErrorDesc(rs.getString("errorDesc"));
				error.setErrorOccurrenceTime(rs.getString("errorOccurrenceTime"));
				
				listError.add(error);
			}
		} catch (SQLException e) {
			insertError(conn, "messageErrorDisplayErrorList", e.getMessage());
		} finally {
            if (ptmt != null) {
                try {
                    ptmt.close();
                } catch (SQLException e) {
                    insertError(conn, "Error closing PreparedStatement(DisplayErrorList)", e.getMessage());
                }
            }
            if (rs != null) {
                try {
                	rs.close();
                } catch (SQLException e) {
                    insertError(conn, "Error closing ResultSet(DisplayErrorList)", e.getMessage());
                }
            }
        }
		return listError;
	}
}
