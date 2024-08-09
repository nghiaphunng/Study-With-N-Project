package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

import BEAN.Like;

public class LikeDAO {
	public static List<Like> getLikesByPostId(Connection conn, int postId, int userId){
	    String sql = "select l.*, p.fullName, p.avatarURL, "
	    		+ "CASE "
	    		+ "	WHEN f1.followId IS NOT NULL AND f2.followId IS NOT NULL THEN 0 "
	    		+ "	WHEN f1.followId IS NOT NULL THEN 1 "
	    		+ "	WHEN f2.followId IS NOT NULL THEN 2 "
	    		+ "	ELSE 3 "
	    		+ "END AS relationshipUser "
	    		+ "from likepost l "
	    		+ "join profile p on p.profileId = l.userId "
	    		+ "LEFT JOIN follow f1 ON f1.follower = l.userId AND f1.following = ? "
	    		+ "LEFT JOIN follow f2 ON f2.follower = ? AND f2.following = l.userId "
	    		+ "where l.postId = ? "
	    		+ "order by l.createdAt asc";
	    List<Like> likePostList = new ArrayList<Like>();
	    PreparedStatement ptmt = null;
	    ResultSet rs = null;
	    
	    try {
			ptmt = conn.prepareStatement(sql);
			
			ptmt.setInt(1, userId);
			ptmt.setInt(2, userId);
			ptmt.setInt(3, postId);
			
			rs = ptmt.executeQuery();
			while(rs.next()) {
				Like like = new Like();
				like.setLikeId(rs.getInt("l.likeId"));
				like.setCreatedAt("l.createdAt");
				like.setFullNameUser(rs.getString("p.fullName"));
				like.setPostId(rs.getInt("l.postId"));
				like.setUserId(rs.getInt("l.userId"));
				like.setRelationshipUser(rs.getInt("relationshipUser"));
				like.setUrlAvaUser(rs.getString("p.avatarURL"));
				likePostList.add(like);
			}
		} catch (SQLException e) {
			ErrorDAO.insertError(conn, "messageErrorGetLikesByPostId", e.getMessage());
		} finally {
		    if (rs != null) {
		        try {
					rs.close();
				} catch (SQLException e) {
					ErrorDAO.insertError(conn, "Error closing ResultSet(getLikesByPostId)", e.getMessage());
				}
		    }
		    if (ptmt != null) {
		        try {
		            ptmt.close();
		        } catch (SQLException e) {
		        	ErrorDAO.insertError(conn, "Error closing PreparedStatement(getLikesByPostId)", e.getMessage());
		        }
		    }
		}
		return likePostList;
	}
	
	//thêm like bằng postId 
	public static void insertLikePost(Connection conn, int userId, int postId){
		PreparedStatement ptmt = null;
		
		String sql = "insert into likepost(postId,userId,createdAt) values (?,?,?)";
		try {
			ptmt = conn.prepareStatement(sql);
			// Lấy thời gian hiện tại và chuyển đổi thành Timestamp
	        Timestamp createAt = Timestamp.from(Instant.now());
			
			ptmt.setInt(1, postId);
			ptmt.setInt(2,  userId);
			ptmt.setTimestamp(3, createAt);
			
			ptmt.executeUpdate();
		}catch(SQLException e) {
			ErrorDAO.insertError(conn, "messageErrorInsertLikePost", e.getMessage());
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
	
	//xóa like bằng userId và postId 
	public static void DeleteLikePost(Connection conn, int userId, int postId) {
		PreparedStatement ptmt = null;
		String sql = "delete from likepost where postId = ? and userId = ?";
		try {
			ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, postId);
			ptmt.setInt(2, userId);
			ptmt.executeUpdate();
		} catch (SQLException e) {
			ErrorDAO.insertError(conn, "messageErrorDeleteLikePost", e.getMessage());
		} finally {
            if (ptmt != null) {
                try {
                    ptmt.close();
                } catch (SQLException e) {
                    ErrorDAO.insertError(conn, "Error closing PreparedStatement(DeleteLikePost)", e.getMessage());
                }
            }
		}
	}
	
	//trả về số lượt like từ postId
	public static List<Like> getLikeCountByPostId(Connection conn, int postId){
		PreparedStatement ptmt = null;
		ResultSet rs = null;
        String sql = "SELECT postId, userId FROM likepost WHERE postId = ?";
        List<Like> likePostList = new ArrayList<Like>();
        try {
        	ptmt = conn.prepareStatement(sql);
            ptmt.setInt(1, postId);
            rs = ptmt.executeQuery();
            while(rs.next()) {
            	Like like = new Like();
            	like.setUserId(rs.getInt("userId"));
            	like.setPostId(rs.getInt("postId"));
            	likePostList.add(like);
            }
        } catch(SQLException e) {
			ErrorDAO.insertError(conn, "messageErrorGetLikeCountByPostId", e.getMessage());
		} finally {
            if (ptmt != null) {
                try {
                    ptmt.close();
                } catch (SQLException e) {
                    ErrorDAO.insertError(conn, "Error closing PreparedStatement(getLikeCountByPostId)", e.getMessage());
                }
            }
        }       
        return likePostList;
    }
}
