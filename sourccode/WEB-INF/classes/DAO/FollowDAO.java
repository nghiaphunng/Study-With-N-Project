package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BEAN.User;

public class FollowDAO {
	//trả về danh sách số người theo dõi của user có userId = ?
	public static List<User> DisplayFollowerUserId(Connection conn, int userId) {
		List<User> listUser = new ArrayList<User>();
		PreparedStatement ptmt = null;
		ResultSet rs = null;

		String sql ="SELECT p.profileId, u.userName, p.fullName, p.birthday, p.gender, p.avatarURL, "
				+ "(SELECT COUNT(*) FROM follow WHERE follow.follower = p.profileId) AS followingCount, "
				+ "(SELECT COUNT(*) FROM follow WHERE follow.following = p.profileId) AS followerCount "
				+ "FROM user u "
				+ "INNER JOIN profile p ON u.userId = p.profileId "
				+ "WHERE p.profileId IN (SELECT follower FROM follow WHERE following = ?) "
				+ "AND u.userCategoryId = 2";
		
		try { 
			ptmt = conn.prepareStatement(sql); 
			ptmt.setInt(1, userId);
			rs = ptmt.executeQuery(); 
			while(rs.next()) { 
				User user = new User();
				user.setUserId(rs.getInt("p.profileId"));
				user.setUserName(rs.getString("u.userName"));
				user.setFullName(rs.getString("p.fullName"));
				user.setBirthday(rs.getString("p.birthday"));
				user.setGender(rs.getInt("p.gender"));
				user.setUserAvatarURL(rs.getString("p.avatarURL"));
				user.setNumberFollowing(rs.getInt("followingCount"));
				user.setNumberFollower(rs.getInt("followerCount"));
				
				listUser.add(user); 
			} 
		} catch (SQLException e) {
			ErrorDAO.insertError(conn, "messageErrorDisplayFollowerUserId", e.getMessage());
		} finally {
            if (ptmt != null) {
                try {
                    ptmt.close();
                } catch (SQLException e) {
                    ErrorDAO.insertError(conn, "Error closing PreparedStatement(DisplayFollowerUserId)", e.getMessage());
                }
            }
            if (rs != null) {
                try {
                	rs.close();
                } catch (SQLException e) {
                    ErrorDAO.insertError(conn, "Error closing ResultSet(DisplayFollowerUserId)", e.getMessage());
                }
            }
        }
		return listUser;
	}
	
	//trả về danh sách số người đang theo dõi của user có userId = ?
	public static List<User> DisplayFollowingUserId(Connection conn, int userId) {
		List<User> listUser = new ArrayList<User>();
		PreparedStatement ptmt = null;
		ResultSet rs = null;

		String sql ="SELECT p.profileId, u.userName, p.fullName, p.birthday, p.gender, p.avatarURL, "
				+ "(SELECT COUNT(*) FROM follow WHERE follow.follower = p.profileId) AS followingCount, "
				+ "(SELECT COUNT(*) FROM follow WHERE follow.following = p.profileId) AS followerCount "
				+ "FROM user u "
				+ "INNER JOIN profile p ON u.userId = p.profileId "
				+ "WHERE p.profileId IN (SELECT following FROM follow WHERE follower = ?) "
				+ "AND u.userCategoryId = 2";
		
		try { 
			ptmt = conn.prepareStatement(sql); 
			ptmt.setInt(1, userId);
			rs = ptmt.executeQuery(); 
			while(rs.next()) { 
				User user = new User();
				user.setUserId(rs.getInt("p.profileId"));
				user.setUserName(rs.getString("u.userName"));
				user.setFullName(rs.getString("p.fullName"));
				user.setBirthday(rs.getString("p.birthday"));
				user.setGender(rs.getInt("p.gender"));
				user.setUserAvatarURL(rs.getString("p.avatarURL"));
				user.setNumberFollowing(rs.getInt("followingCount"));
				user.setNumberFollower(rs.getInt("followerCount"));
				
				listUser.add(user); 
			} 
		} catch (SQLException e) {
			ErrorDAO.insertError(conn, "messageErrorDisplayFollowingUserId", e.getMessage());
		} finally {
            if (ptmt != null) {
                try {
                    ptmt.close();
                } catch (SQLException e) {
                    ErrorDAO.insertError(conn, "Error closing PreparedStatement(DisplayFollowingUserId)", e.getMessage());
                }
            }
            if (rs != null) {
                try {
                	rs.close();
                } catch (SQLException e) {
                    ErrorDAO.insertError(conn, "Error closing ResultSet(DisplayFollowingUserId)", e.getMessage());
                }
            }
        }
		return listUser;
	}
	
	//thêm bản ghi follow
	public static void insertFollow(Connection conn, int userId1, int userId2){
		PreparedStatement ptmt = null;
		
		String sql = "insert into follow(follower,following) values (?,?)";
		try {
			ptmt = conn.prepareStatement(sql);
			
			ptmt.setInt(1, userId1);
			ptmt.setInt(2,  userId2);
			
			ptmt.executeUpdate();
		}catch(SQLException e) {
			ErrorDAO.insertError(conn, "messageErrorInsertFollow", e.getMessage());
		} finally {
            if (ptmt != null) {
                try {
                    ptmt.close();
                } catch (SQLException e) {
                    ErrorDAO.insertError(conn, "Error closing PreparedStatement(insertLikePost)", e.getMessage());
                }
            }
        }
	}
		
	//hủy follow
	public static void DeleteFollow(Connection conn, int userId1, int userId2) {
		PreparedStatement ptmt = null;
		String sql = "delete from follow where follower = ? and following = ?";
		try {
			ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, userId1);
			ptmt.setInt(2,  userId2);
			ptmt.executeUpdate();
		} catch (SQLException e) {
			ErrorDAO.insertError(conn, "messageErrorDeleteFollow", e.getMessage());
		} finally {
            if (ptmt != null) {
                try {
                    ptmt.close();
                } catch (SQLException e) {
                    ErrorDAO.insertError(conn, "Error closing PreparedStatement(DeleteFollow)", e.getMessage());
                }
            }
		}
	}
}
