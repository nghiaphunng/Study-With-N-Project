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

import BEAN.Comment;

public class CommentDAO {
	public static void insertCommentCourse(HttpServletRequest request, Connection conn, Comment cmt, int userId, int courseId){
		PreparedStatement ptmt = null;
		
		String sql = "insert into comment(courseId,userId,content,createdAt) values (?,?,?,?)";
		try {
			ptmt = conn.prepareStatement(sql);
			String content = cmt.getContent();
			// Lấy thời gian hiện tại và chuyển đổi thành Timestamp
	        Timestamp createAt = Timestamp.from(Instant.now());
			
			ptmt.setInt(1, courseId);
			ptmt.setInt(2,  userId);
			ptmt.setString(3, content);
			ptmt.setTimestamp(4, createAt);
			
			ptmt.executeUpdate();
		}catch(SQLException e) {
			ErrorDAO.insertError(conn, "messageErrorInsertCommentCourse", e.getMessage());
		} finally {
            if (ptmt != null) {
                try {
                    ptmt.close();
                } catch (SQLException e) {
                    ErrorDAO.insertError(conn, "Error closing PreparedStatement(insertCommentCourse)", e.getMessage());
                }
            }
        }
	}
	
	public static List<Comment> DisplayCommentCourse(HttpServletRequest request, Connection conn, int courseId){
		List<Comment> listCmt = new ArrayList<Comment>();
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		String sql = 	"select comment.commentId, comment.courseId, comment.userId, profile.fullName, profile.avatarURL, comment.content, comment.createdAt "
					+	"from comment "
					+	"inner join profile on comment.userId = profile.profileId "
					+	"where comment.courseId = ? and comment.postId is null "
					+ 	"order by comment.createdAt asc";
		try {
			ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, courseId);
			rs = ptmt.executeQuery();
			while(rs.next()) {
				Comment cmt = new Comment();
				cmt.setCommentId(rs.getInt("comment.commentId"));
				cmt.setPostId(rs.getInt("comment.courseId"));
				cmt.setFullNameUser(rs.getString("profile.fullName"));
				cmt.setUserAvatarURL(rs.getString("profile.avatarURL"));
				cmt.setContent(rs.getString("comment.content"));
				cmt.setCreatedAt(rs.getString("comment.createdAt"));
				cmt.setUserId(rs.getInt("comment.userId"));;
				listCmt.add(cmt);
			}
		} catch (SQLException e) {
			ErrorDAO.insertError(conn, "messageErrorDisplayCommentCourse", e.getMessage());
			
		} finally {
            if (ptmt != null) {
                try {
                    ptmt.close();
                } catch (SQLException e) {
                    ErrorDAO.insertError(conn, "Error closing PreparedStatement(DisplayCommentCourse)", e.getMessage());
                }
            }
            if (rs != null) {
                try {
                	rs.close();
                } catch (SQLException e) {
                	ErrorDAO.insertError(conn, "Error closing ResultSet(DisplayCommentCourse)", e.getMessage());
                }
            }
        }
		return listCmt;
	}
	
	public static void DeleteCommentCourse(HttpServletRequest request, Connection conn, int commentId) {
		PreparedStatement ptmt = null;
		String sql = "delete from comment where commentId = ?";
		try {
			ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, commentId);
			ptmt.executeUpdate();
		} catch (SQLException e) {
			ErrorDAO.insertError(conn, "messageErrorDeleteCommentCourse", e.getMessage());
		} finally {
            if (ptmt != null) {
                try {
                    ptmt.close();
                } catch (SQLException e) {
                    ErrorDAO.insertError(conn, "Error closing PreparedStatement(DeleteCommentCourse)", e.getMessage());
                }
            }
		}
	}
	
	
	//thêm comment vào postId 
	public static void insertCommentPost(HttpServletRequest request, Connection conn, Comment cmt, int userId, int postId){
		PreparedStatement ptmt = null;
		
		String sql = "insert into comment(postId,userId,content,createdAt) values (?,?,?,?)";
		try {
			ptmt = conn.prepareStatement(sql);
			String content = cmt.getContent();
			// Lấy thời gian hiện tại và chuyển đổi thành Timestamp
	        Timestamp createAt = Timestamp.from(Instant.now());
			
			ptmt.setInt(1, postId);
			ptmt.setInt(2,  userId);
			ptmt.setString(3, content);
			ptmt.setTimestamp(4, createAt);
			
			ptmt.executeUpdate();
		}catch(SQLException e) {
			ErrorDAO.insertError(conn, "messageErrorInsertCommentPost", e.getMessage());
		} finally {
            if (ptmt != null) {
                try {
                    ptmt.close();
                } catch (SQLException e) {
                    ErrorDAO.insertError(conn, "Error closing PreparedStatement(insertCommentPost)", e.getMessage());
                }
            }
        }
	}
	
	//danh sách comment của postId của chính chủ
	public static List<Comment> DisplayCommentPost(HttpServletRequest request, Connection conn, int postId){
		List<Comment> listCmt = new ArrayList<Comment>();
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		String sql = 	"select comment.commentId, comment.postId, comment.userId, profile.fullName, user.userName, profile.avatarURL, comment.content, comment.createdAt "
					+ "from comment "
					+ "inner join profile on comment.userId = profile.profileId "
					+ "inner join user on user.userId = profile.profileId "
					+ "where comment.postId = ? and comment.courseId is null "
					+ "order by comment.createdAt asc";
		try {
			ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, postId);
			rs = ptmt.executeQuery();
			while(rs.next()) {
				Comment cmt = new Comment();
				cmt.setCommentId(rs.getInt("comment.commentId"));
				cmt.setPostId(rs.getInt("comment.postId"));
				cmt.setFullNameUser(rs.getString("profile.fullName"));
				cmt.setNameLoginUser(rs.getString("user.userName"));
				cmt.setUserAvatarURL(rs.getString("profile.avatarURL"));
				cmt.setContent(rs.getString("comment.content"));
				cmt.setCreatedAt(rs.getString("comment.createdAt"));
				cmt.setUserId(rs.getInt("comment.userId"));;
				listCmt.add(cmt);
			}
		} catch (SQLException e) {
			ErrorDAO.insertError(conn, "messageErrorDisplayCommentPost", e.getMessage());
			
		} finally {
            if (ptmt != null) {
                try {
                    ptmt.close();
                } catch (SQLException e) {
                    ErrorDAO.insertError(conn, "Error closing PreparedStatement(DisplayCommentPost)", e.getMessage());
                }
            }
            if (rs != null) {
                try {
                	rs.close();
                } catch (SQLException e) {
                	ErrorDAO.insertError(conn, "Error closing ResultSet(DisplayCommentPost)", e.getMessage());
                }
            }
        }
		return listCmt;
	}
	
	//xòa bình luận của postId
	public static void deleteCommentPost(HttpServletRequest request, Connection conn, int commentId) {
		PreparedStatement ptmt = null;
		String sql = "delete from comment where commentId = ?";
		try {
			ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, commentId);
			ptmt.executeUpdate();
		} catch (SQLException e) {
			ErrorDAO.insertError(conn, "messageErrorDeleteCommentPost", e.getMessage());
		} finally {
            if (ptmt != null) {
                try {
                    ptmt.close();
                } catch (SQLException e) {
                    ErrorDAO.insertError(conn, "Error closing PreparedStatement(DeleteCommentPost)", e.getMessage());
                }
            }
		}
	}
	
	//trả về số lượt bình luận từ postId
		public static int getCommentCountByPostId(Connection conn, int postId){
			PreparedStatement ptmt = null;
			ResultSet rs = null;
	        String sql = "SELECT COUNT(*) AS commentCount FROM comment WHERE postId = ? and courseId is null";
	        try {
	        	ptmt = conn.prepareStatement(sql);
	            ptmt.setInt(1, postId);
	            rs = ptmt.executeQuery();
	            while(rs.next()) {
	            	return rs.getInt("commentCount");
	            }
	        } catch(SQLException e) {
				ErrorDAO.insertError(conn, "messageErrorGetCommentCountByPostId", e.getMessage());
			} finally {
	            if (ptmt != null) {
	                try {
	                    ptmt.close();
	                } catch (SQLException e) {
	                    ErrorDAO.insertError(conn, "Error closing PreparedStatement(getCommentCountByPostId)", e.getMessage());
	                }
	            }
	        }       
	        return 0;
	    }
}
