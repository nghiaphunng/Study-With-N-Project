package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import BEAN.Like;
import BEAN.Post;
import BEAN.User;

public class InfoUserDAO {
	public static User GetInfoUser(HttpServletRequest request, Connection conn, int userId) {
		User infoUser = new User();
	    PreparedStatement ptmt = null;
	    ResultSet rs = null;
	    String sql = "SELECT p.profileId, p.fullName, u.userName, p.birthday, p.gender, p.avatarURL "
	    		+ "FROM user u "
	    		+ "INNER JOIN profile p ON u.userId = p.profileId "
	    		+ "WHERE u.userId = ?";
	    try {
	        ptmt = conn.prepareStatement(sql);
	        ptmt.setInt(1, userId);
	        rs = ptmt.executeQuery();
	        
	        if(rs.next()) {
	            infoUser.setUserId(rs.getInt("p.profileId"));
	            infoUser.setUserName(rs.getString("u.userName"));
	            infoUser.setFullName(rs.getString("p.fullName"));
	            infoUser.setBirthday(rs.getString("p.birthday"));
	            infoUser.setGender(rs.getInt("p.gender"));
	            infoUser.setUserAvatarURL(rs.getString("p.avatarURL"));

	            return infoUser;
	        }
	        
	        ptmt.close();
	        rs.close();
	    } catch (SQLException e) {
	        ErrorDAO.insertError(conn, "messageErrorGetInfoUser", e.getMessage());
	    } finally {
            if (ptmt != null) {
                try {
                    ptmt.close();
                } catch (SQLException e) {
                    ErrorDAO.insertError(conn, "Error closing PreparedStatement(GetInfoUser)", e.getMessage());
                }
            }
            if (rs != null) {
                try {
                	rs.close();
                } catch (SQLException e) {
                    ErrorDAO.insertError(conn, "Error closing ResultSet(GetInfoUser)", e.getMessage());
                }
            }
        }	    
	    return null;
	}
	
	public static List<Post> DisplayPostInfoOtherUser(HttpServletRequest request, Connection conn, int visitingUserId, int infoUserId, int limit, int offset){
		List<Post> listPost = new ArrayList<Post>();
		PreparedStatement ptmt1 = null;
		ResultSet rs1 = null;
		
		String sql = "SELECT p.postId, p.userId, p.visibilityId, u.fullName, u.avatarURL, p.title, p.newContent, p.oldContent, p.createdAt FROM post p "
	            + "INNER JOIN profile u ON p.userId = u.profileId "
	            + "WHERE p.userId = ? "
	            + "AND (p.visibilityId = 0 "
	            + "OR (p.visibilityId = 1 AND p.userId IN (SELECT following FROM follow WHERE follower = ?))) " // Bài viết chỉ cho người follow xem
	            + "ORDER BY p.createdAt DESC, p.postId DESC "
	            + "LIMIT ? OFFSET ?";

		
		try {
			ptmt1 = conn.prepareStatement(sql);
			ptmt1.setInt(1, infoUserId);
			ptmt1.setInt(2, visitingUserId);
			ptmt1.setInt(3,  limit);
			ptmt1.setInt(4, offset);
			
			rs1 = ptmt1.executeQuery();
			while(rs1.next()) {
				Post post = new Post();
				post.setPostId(rs1.getInt("p.postId"));
				post.setUserId(rs1.getInt("p.userId"));
				post.setVisibilityId(rs1.getInt("p.visibilityId"));
				post.setUserName(rs1.getString("u.fullName"));
				post.setUserAvatarURL(rs1.getString("u.avatarURL"));;
				post.setTitle(rs1.getString("p.title"));
				post.setNewContent(rs1.getString("p.newContent"));
				post.setOldContent(rs1.getString("p.oldContent"));
				post.setCreatedAt(rs1.getString("p.createdAt"));
				//lấy dánh sách commet
				post.setCommentList(CommentDAO.DisplayCommentPost(request, conn, post.getPostId()));
				//lấy dánh sách like
				post.setLikeList(LikeDAO.getLikeCountByPostId(conn, post.getPostId()));
				for(Like like : post.getLikeList()) {
					if(like.getUserId() == visitingUserId) {
						post.setUserLiked(1);
						break;
					}
					else post.setUserLiked(0);
				}
				listPost.add(post);
			}
		} catch (SQLException e) {
			ErrorDAO.insertError(conn, "messageErrorDisplayPostInfoOtherUser", e.getMessage());
		} finally {
		    // Đóng PreparedStatement và ResultSet ở đây
		    if (rs1 != null) {
		        try {
					rs1.close();
				} catch (SQLException e) {
					ErrorDAO.insertError(conn, "Error closing ResultSet(DisplayPostInfoOtherUser)", e.getMessage());
				}
		    }
		    if (ptmt1 != null) {
		        try {
		            ptmt1.close();
		        } catch (SQLException e) {
		        	ErrorDAO.insertError(conn, "Error closing PreparedStatement(DisplayPostInfoOtherUser)", e.getMessage());
		        }
		    }
		}
		return listPost;
	}
	
	public static boolean isFollowing(HttpServletRequest request, Connection conn, int visitingUserId, int infoUserId){
		PreparedStatement ptmt1 = null;
		ResultSet rs1 = null;
		
		String sql = "SELECT 1 FROM follow WHERE follower = ? AND following = ?";
		
		try {
			ptmt1 = conn.prepareStatement(sql);
			ptmt1.setInt(1, visitingUserId);
	        ptmt1.setInt(2, infoUserId);
	        
			rs1 = ptmt1.executeQuery();
			return rs1.next();
		} catch (SQLException e) {
			ErrorDAO.insertError(conn, "messageErrorCheckIsFollowing", e.getMessage());
			return false;
		} finally {
		    // Đóng PreparedStatement và ResultSet ở đây
		    if (rs1 != null) {
		        try {
					rs1.close();
				} catch (SQLException e) {
					ErrorDAO.insertError(conn, "Error closing ResultSet(isFollowing)", e.getMessage());
				}
		    }
		    if (ptmt1 != null) {
		        try {
		            ptmt1.close();
		        } catch (SQLException e) {
		        	ErrorDAO.insertError(conn, "Error closing PreparedStatement(isFollowing)", e.getMessage());
		        }
		    }
		}
	}
	
	public static boolean isFollower(HttpServletRequest request, Connection conn, int visitingUserId, int infoUserId){
		PreparedStatement ptmt1 = null;
		ResultSet rs1 = null;
		
		String sql = "SELECT 1 FROM follow WHERE follower = ? AND following = ?";
		
		try {
			ptmt1 = conn.prepareStatement(sql);
			ptmt1.setInt(2, visitingUserId);
	        ptmt1.setInt(1, infoUserId);
	        
			rs1 = ptmt1.executeQuery();
			return rs1.next();
		} catch (SQLException e) {
			ErrorDAO.insertError(conn, "messageErrorCheckIsFollower", e.getMessage());
			return false;
		} finally {
		    // Đóng PreparedStatement và ResultSet ở đây
		    if (rs1 != null) {
		        try {
					rs1.close();
				} catch (SQLException e) {
					ErrorDAO.insertError(conn, "Error closing ResultSet(isFollower)", e.getMessage());
				}
		    }
		    if (ptmt1 != null) {
		        try {
		            ptmt1.close();
		        } catch (SQLException e) {
		        	ErrorDAO.insertError(conn, "Error closing PreparedStatement(isFollower)", e.getMessage());
		        }
		    }
		}
	}
}
