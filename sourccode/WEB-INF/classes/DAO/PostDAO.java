package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

import BEAN.Like;
import BEAN.Post;
import javax.servlet.http.HttpServletRequest;

public class PostDAO {
	public static void UpPostUserId(HttpServletRequest request, Connection conn, int userId, int visibilityId, String title, String newContent, String oldContent){
		PreparedStatement ptmt = null;
		String sql = "insert into post(userId,visibilityId,title,newContent,oldContent,createdAt) value (?,?,?,?,?,?)";
		try {
			ptmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			// Lấy thời gian hiện tại và chuyển đổi thành Timestamp
	        Timestamp createAt = Timestamp.from(Instant.now());

			ptmt.setInt(1,  userId);
			ptmt.setInt(2, visibilityId);
			ptmt.setString(3, title);
			ptmt.setString(4, newContent);
			ptmt.setString(5, oldContent);
			ptmt.setTimestamp(6, createAt);	
			
			ptmt.executeUpdate();
		}catch(SQLException e) {
			ErrorDAO.insertError(conn, "messageErrorUpPostUserId", e.getMessage());
		}finally {
		    if (ptmt != null) {
		        try {
		            ptmt.close();
		        } catch (SQLException e) {
		        	ErrorDAO.insertError(conn, "Error closing PreparedStatement(UpPostUserId)", e.getMessage());
		        }
		    }
		}
	}
	
	public static void EditPostId(HttpServletRequest request, Connection conn, int postId, int visibilityId, String title, String newContent, String oldContent){
		PreparedStatement ptmt = null;
		String sql = "UPDATE post SET post.title = ?, post.newContent = ?, post.oldContent = ?, post.visibilityId = ?, post.createdAt = ? "
					+ "WHERE post.postId =  ?";
		try {
			ptmt = conn.prepareStatement(sql);
			// Lấy thời gian hiện tại và chuyển đổi thành Timestamp
	        Timestamp editAt = Timestamp.from(Instant.now());

			ptmt.setString(1,  title);
			ptmt.setString(2, newContent);
			ptmt.setString(3, oldContent);
			ptmt.setInt(4, visibilityId);
			ptmt.setTimestamp(5, editAt);
			ptmt.setInt(6, postId);	
			
			ptmt.executeUpdate();
		}catch(SQLException e) {
			ErrorDAO.insertError(conn, "messageErrorEditPostId", e.getMessage());
		}finally {
		    if (ptmt != null) {
		        try {
		            ptmt.close();
		        } catch (SQLException e) {
		        	ErrorDAO.insertError(conn, "Error closing PreparedStatement(EditPostId)", e.getMessage());
		        }
		    }
		}
	}
	
	public static void DeletePostId(HttpServletRequest request, Connection conn, int postId){
		PreparedStatement ptmt = null;
		String sql = "DELETE FROM post WHERE post.postId = ?";
		try {
			ptmt = conn.prepareStatement(sql);

			ptmt.setInt(1, postId);	
			
			ptmt.executeUpdate();
		}catch(SQLException e) {
			ErrorDAO.insertError(conn, "messageErrorDeletePostId", e.getMessage());
		}finally {
		    if (ptmt != null) {
		        try {
		            ptmt.close();
		        } catch (SQLException e) {
		        	ErrorDAO.insertError(conn, "Error closing PreparedStatement(DeletePostId)", e.getMessage());
		        }
		    }
		}
	}
	
	public static List<Post> DisplayPostUser(HttpServletRequest request, Connection conn, int userId, int limit, int offset){
		List<Post> listPost = new ArrayList<Post>();
		PreparedStatement ptmt1 = null;
		ResultSet rs1 = null;
		
		String sql = "SELECT p.postId, p.userId, p.visibilityId, u.fullName, u.avatarURL, p.title, p.newContent, p.oldContent, p.createdAt "
				+ "FROM post p "
				+ "INNER JOIN profile u ON p.userId = u.profileId "
				+ "LEFT JOIN likepost l ON p.postId = l.postId "
				+ "LEFT JOIN comment c ON p.postId = c.postId "
				+ "WHERE p.userId = ? "
				+ "GROUP BY p.postId "
				+ "ORDER BY p.createdAt DESC, p.postId DESC "
				+ "LIMIT ? OFFSET ?";
		
		try {
			ptmt1 = conn.prepareStatement(sql);
			ptmt1.setInt(1, userId);
			ptmt1.setInt(2,  limit);
			ptmt1.setInt(3, offset);
			
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
				post.setLikeList(LikeDAO.getLikesByPostId(conn, post.getPostId(), userId));
				for(Like like : post.getLikeList()) {
					if(like.getUserId() == userId) {
						post.setUserLiked(1);
						break;
					}
					else post.setUserLiked(0);
				}
				listPost.add(post);
			}
		} catch (SQLException e) {
			ErrorDAO.insertError(conn, "messageErrorDisplayPostUser", e.getMessage());
		} finally {
		    // Đóng PreparedStatement và ResultSet ở đây
		    if (rs1 != null) {
		        try {
					rs1.close();
				} catch (SQLException e) {
					ErrorDAO.insertError(conn, "Error closing ResultSet(DisplayPostUser)", e.getMessage());
				}
		    }
		    if (ptmt1 != null) {
		        try {
		            ptmt1.close();
		        } catch (SQLException e) {
		        	ErrorDAO.insertError(conn, "Error closing PreparedStatement(DisplayPostUser)", e.getMessage());
		        }
		    }
		}
		return listPost;
	}
	
	public static List<Post> DisplayPostUserByScope(HttpServletRequest request, Connection conn, int userId, int limit, int offset, int scope){
		List<Post> listPost = new ArrayList<Post>();
		PreparedStatement ptmt1 = null;
		ResultSet rs1 = null;
		
		String sql = "SELECT p.postId, p.userId, p.visibilityId, u.fullName, u.avatarURL, p.title, p.newContent, p.oldContent, p.createdAt "
					+ "FROM post p "
					+ "INNER JOIN profile u ON p.userId = u.profileId "
					+ "LEFT JOIN likepost l ON p.postId = l.postId "
					+ "LEFT JOIN comment c ON p.postId = c.postId "
					+ "WHERE p.userId = ? AND p.visibilityId = ? "
					+ "GROUP BY p.postId "
					+ "ORDER BY p.createdAt DESC, p.postId DESC "
					+ "LIMIT ? OFFSET ?";
		
		try {
			ptmt1 = conn.prepareStatement(sql);
			ptmt1.setInt(1, userId);
			ptmt1.setInt(2, scope);
			ptmt1.setInt(3, limit);
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
				post.setLikeList(LikeDAO.getLikesByPostId(conn, post.getPostId(), userId));
				for(Like like : post.getLikeList()) {
					if(like.getUserId() == userId) {
						post.setUserLiked(1);
						break;
					}
					else post.setUserLiked(0);
				}
				listPost.add(post);
			}
		} catch (SQLException e) {
			ErrorDAO.insertError(conn, "messageErrorDisplayPostUserByScope", e.getMessage());
		} finally {
		    // Đóng PreparedStatement và ResultSet ở đây
		    if (rs1 != null) {
		        try {
					rs1.close();
				} catch (SQLException e) {
					ErrorDAO.insertError(conn, "Error closing ResultSet(DisplayPostUserByScope)", e.getMessage());
				}
		    }
		    if (ptmt1 != null) {
		        try {
		            ptmt1.close();
		        } catch (SQLException e) {
		        	ErrorDAO.insertError(conn, "Error closing PreparedStatement(DisplayPostUserByScope)", e.getMessage());
		        }
		    }
		}
		return listPost;
	}
	
	public static List<Post> DisplayPostCommunity(HttpServletRequest request, Connection conn, int userId, int limit, int offset){
		List<Post> listPost = new ArrayList<Post>();
		PreparedStatement ptmt1 = null;
		ResultSet rs1 = null;
		
		String sql = "SELECT p.postId, p.userId, p.visibilityId, u.fullName, u.avatarURL, p.title, p.newContent, p.oldContent, p.createdAt FROM post p "
				+ "INNER JOIN profile u ON p.userId = u.profileId "
				+ "WHERE (p.visibilityId = 0 and p.userId != ?) "
				+ "OR (p.visibilityId = 1 AND p.userId IN (SELECT following FROM follow WHERE follower = ?)) "
				+ "ORDER BY p.createdAt DESC, p.postId DESC "
				+ "LIMIT ? OFFSET ?";
		
		try {
			ptmt1 = conn.prepareStatement(sql);
			ptmt1.setInt(1,  userId);
			ptmt1.setInt(2,  userId);
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
					if(like.getUserId() == userId) {
						post.setUserLiked(1);
						break;
					}
					else post.setUserLiked(0);
				}
				listPost.add(post);
			}
		} catch (SQLException e) {
			ErrorDAO.insertError(conn, "messageErrorDisplayPostCommunity", e.getMessage());
		} finally {
		    // Đóng PreparedStatement và ResultSet ở đây
		    if (rs1 != null) {
		        try {
					rs1.close();
				} catch (SQLException e) {
					ErrorDAO.insertError(conn, "Error closing ResultSet(DisplayPostCommunity)", e.getMessage());
				}
		    }
		    if (ptmt1 != null) {
		        try {
		            ptmt1.close();
		        } catch (SQLException e) {
		        	ErrorDAO.insertError(conn, "Error closing PreparedStatement(DisplayPostCommunity)", e.getMessage());
		        }
		    }
		}
		return listPost;
	}
	
	public static int FindPostPosition(HttpServletRequest request, Connection conn, int postid, int userId){
		PreparedStatement ptmt1 = null;
		ResultSet rs1 = null;
		int res = -1;
//		String sql = "SELECT p.postId, p.userId, p.visibilityId, u.fullName, u.avatarURL, p.title, p.newContent, p.oldContent, p.createdAt, "
//				+ "(SELECT COUNT(*) FROM post WHERE createdAt >= p.createdAt) AS position "
//				+ "FROM post p "
//				+ "INNER JOIN profile u ON p.userId = u.profileId "
//				+ "WHERE p.postId = ?";
		
		String sql = "SELECT COUNT(*) + 1 AS position "
	               + "FROM post p "
	               + "WHERE p.userId = ? "
	               + "AND (p.createdAt > (SELECT createdAt FROM post WHERE postId = ?) "
	               + "OR (p.createdAt = (SELECT createdAt FROM post WHERE postId = ?) AND p.postId > ?))";
		
		try {
			ptmt1 = conn.prepareStatement(sql);
			ptmt1.setInt(1, userId);
	        ptmt1.setInt(2, postid);
	        ptmt1.setInt(3, postid);
	        ptmt1.setInt(4, postid);
			
			rs1 = ptmt1.executeQuery();
			if (rs1.next()) {
	            res = rs1.getInt("position");
	        }
		} catch (SQLException e) {
			ErrorDAO.insertError(conn, "messageErrorFindPostPosition", e.getMessage());
		} finally {
		    // Đóng PreparedStatement và ResultSet ở đây
		    if (rs1 != null) {
		        try {
					rs1.close();
				} catch (SQLException e) {
					ErrorDAO.insertError(conn, "Error closing ResultSet(FindPostPosition)", e.getMessage());
				}
		    }
		    if (ptmt1 != null) {
		        try {
		            ptmt1.close();
		        } catch (SQLException e) {
		        	ErrorDAO.insertError(conn, "Error closing PreparedStatement(FindPostPosition)", e.getMessage());
		        }
		    }
		}
		return res;
	}
	
	public static int FindPostPositionOtherUser(HttpServletRequest request, Connection conn, int visitingUserId, int infoUserId, int postid) {
	    PreparedStatement ptmt1 = null;
	    ResultSet rs1 = null;
	    int res = -1;
	    String sql = "SELECT COUNT(*) + 1 AS position "
	               + "FROM post p "
	               + "WHERE p.userId = ? "
	               + "AND (p.visibilityId = 0 "
	               + "     OR (p.visibilityId = 1 AND p.userId IN (SELECT following FROM follow WHERE follower = ?))) "
	               + "AND (p.createdAt > (SELECT createdAt FROM post WHERE postId = ?) "
	               + "     OR (p.createdAt = (SELECT createdAt FROM post WHERE postId = ?) AND p.postId > ?))";

	    try {
	        ptmt1 = conn.prepareStatement(sql);
	        ptmt1.setInt(1, infoUserId);
	        ptmt1.setInt(2, visitingUserId);
	        ptmt1.setInt(3, postid);
	        ptmt1.setInt(4, postid);
	        ptmt1.setInt(5, postid);

	        rs1 = ptmt1.executeQuery();
	        if (rs1.next()) {
	            res = rs1.getInt("position");
	        }
	    } catch (SQLException e) {
	        ErrorDAO.insertError(conn, "messageErrorFindPostPositionOtherUser", e.getMessage());
	    } finally {
	        if (rs1 != null) {
	            try {
	                rs1.close();
	            } catch (SQLException e) {
	                ErrorDAO.insertError(conn, "Error closing ResultSet(FindPostPositionOtherUser)", e.getMessage());
	            }
	        }
	        if (ptmt1 != null) {
	            try {
	                ptmt1.close();
	            } catch (SQLException e) {
	                ErrorDAO.insertError(conn, "Error closing PreparedStatement(FindPostPositionOtherUser)", e.getMessage());
	            }
	        }
	    }
	    return res;
	}

}
