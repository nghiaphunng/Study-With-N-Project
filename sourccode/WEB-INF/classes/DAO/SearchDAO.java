package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import BEAN.Course;
import BEAN.Post;
import BEAN.User;

public class SearchDAO {
	public static List<Course> searchNameCourseList(HttpServletRequest request, Connection conn, String key) {
		List<Course> courseList = new ArrayList<Course>();
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT course.courseId, course.courseName, course.courseURL,coursecategory.coursecategoryFolder, course.describe, course.createdAt "
					+"FROM course "
					+"inner join coursecategory on course.coursecategoryId = coursecategory.coursecategoryId "
					+"where course.courseName like ?";
		
		try {
			ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, "%" + key + "%");
			rs = ptmt.executeQuery();
			while(rs.next()) {
				Course course = new Course();
				course.setCourseId(rs.getInt("course.courseId"));
				course.setCourseName(rs.getString("course.courseName"));
				course.setCourseCategoryFolder(rs.getString("coursecategory.coursecategoryFolder"));
				course.setCourseURL(rs.getString("course.courseURL"));
				course.setDescribe(rs.getString("course.describe"));
				course.setCreatedAt(rs.getString("course.createdAt"));
				courseList.add(course);
			}
		} catch (SQLException e) {
			ErrorDAO.insertError(conn, "messageErrorSearchNameCourseList", e.getMessage());
		} finally {
            if (ptmt != null) {
                try {
                    ptmt.close();
                } catch (SQLException e) {
                    ErrorDAO.insertError(conn, "Error closing PreparedStatement(searchNameCourseList)", e.getMessage());
                }
            }
            if (rs != null) {
                try {
                	rs.close();
                } catch (SQLException e) {
                    ErrorDAO.insertError(conn, "Error closing ResultSet(searchNameCourseList)", e.getMessage());
                }
            }
        }
		return courseList;
	}
	
	//tìm kiếm bài viết khi không có phiên đăng nhập của người dùng
	public static List<Post> searchNamePostPublicList(HttpServletRequest request, Connection conn, String key) {
		List<Post> listPost = new ArrayList<Post>();
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		
		String sql ="SELECT p.postId, p.userId, p.visibilityId, u.fullName, u.avatarURL, p.title, p.newContent, p.oldContent, p.createdAt "
				+ "FROM post p "
				+ "INNER JOIN profile u ON p.userId = u.profileId "
				+ "WHERE (p.oldContent like ? or p.title like ? or u.fullName like ?) and p.visibilityId=0 "
				+ "ORDER BY p.createdAt DESC, p.postId DESC";

		 try { 
			 ptmt = conn.prepareStatement(sql); 
			 ptmt.setString(1, "%" + key + "%");
			 ptmt.setString(2, "%" + key + "%");
			 ptmt.setString(3, "%" + key + "%");
			 rs = ptmt.executeQuery(); 
			 while(rs.next()) { 
				Post post = new Post();
				post.setPostId(rs.getInt("p.postId"));
				post.setUserId(rs.getInt("p.userId"));
				post.setVisibilityId(rs.getInt("p.visibilityId"));
				post.setUserName(rs.getString("u.fullName"));
				post.setUserAvatarURL(rs.getString("u.avatarURL"));;
				post.setTitle(rs.getString("p.title"));
				post.setNewContent(rs.getString("p.newContent"));
				post.setOldContent(rs.getString("p.oldContent"));
				post.setCreatedAt(rs.getString("p.createdAt"));
				listPost.add(post); 
			}
		} catch (SQLException e) {
			ErrorDAO.insertError(conn, "messageErrorSearchNamePostPublicList", e.getMessage());
		} finally {
            if (ptmt != null) {
                try {
                    ptmt.close();
                } catch (SQLException e) {
                    ErrorDAO.insertError(conn, "Error closing PreparedStatement(searchNamePostPublicList)", e.getMessage());
                }
            }
            if (rs != null) {
                try {
                	rs.close();
                } catch (SQLException e) {
                    ErrorDAO.insertError(conn, "Error closing ResultSet(searchNamePostPublicList)", e.getMessage());
                }
            }
        }
		return listPost;
	}
	
	
	//tìm kiếm bài viết khi có phiên đăng nhập của người dùng
	public static List<Post> searchNamePostUserList(HttpServletRequest request, Connection conn, String key, int userId) {
		List<Post> listPost = new ArrayList<Post>();
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT p.postId, p.userId, p.visibilityId, u.fullName, u.avatarURL, p.title, p.newContent, p.oldContent, p.createdAt "
				+ "FROM post p "
				+ "INNER JOIN profile u ON p.userId = u.profileId "
				+ "LEFT JOIN follow f ON p.userId = f.following AND f.follower = ? "
				+ "WHERE (p.oldContent like ? OR p.title like ? OR u.fullName like ?) "
				+ "AND (p.visibilityId = 0 "
				+ "OR p.userId = ? "
				+ "OR (p.visibilityId = 1 AND f.following IS NOT NULL)) "
				+ "ORDER BY p.createdAt DESC, p.postId DESC";

		 try { 
			 ptmt = conn.prepareStatement(sql); 
			 ptmt.setInt(1,  userId);
			 ptmt.setString(2, "%" + key + "%");
			 ptmt.setString(3, "%" + key + "%");
			 ptmt.setString(4, "%" + key + "%");
			 ptmt.setInt(5, userId);
			 rs = ptmt.executeQuery(); 
			 while(rs.next()) { 
				Post post = new Post();
				post.setPostId(rs.getInt("p.postId"));
				post.setUserId(rs.getInt("p.userId"));
				post.setVisibilityId(rs.getInt("p.visibilityId"));
				post.setUserName(rs.getString("u.fullName"));
				post.setUserAvatarURL(rs.getString("u.avatarURL"));;
				post.setTitle(rs.getString("p.title"));
				post.setNewContent(rs.getString("p.newContent"));
				post.setOldContent(rs.getString("p.oldContent"));
				post.setCreatedAt(rs.getString("p.createdAt"));
				listPost.add(post); 
			}
		} catch (SQLException e) {
			ErrorDAO.insertError(conn, "messageErrorSearchNamePostUserList", e.getMessage());
		} finally {
            if (ptmt != null) {
                try {
                    ptmt.close();
                } catch (SQLException e) {
                    ErrorDAO.insertError(conn, "Error closing PreparedStatement(searchNamePostUserList)", e.getMessage());
                }
            }
            if (rs != null) {
                try {
                	rs.close();
                } catch (SQLException e) {
                    ErrorDAO.insertError(conn, "Error closing ResultSet(searchNamePostUserList)", e.getMessage());
                }
            }
        }
		return listPost;
	}
	
	public static List<User> searchNameUserList(HttpServletRequest request, Connection conn, String key) {
		List<User> listUser = new ArrayList<User>();
		PreparedStatement ptmt = null;
		ResultSet rs = null;

		String sql ="SELECT p.profileId, u.userName, p.fullName, p.birthday, p.gender, p.avatarURL, "
				+ "(SELECT COUNT(*) FROM follow WHERE follow.follower = p.profileId) AS followingCount, "
				+ "(SELECT COUNT(*) FROM follow WHERE follow.following = p.profileId) AS followerCount "
				+ "FROM user u "
				+ "INNER JOIN profile p ON u.userId = p.profileId "
				+ "WHERE (u.userName like ? or p.fullName like ?) and u.userCategoryId = 2";
		
		try { 
			ptmt = conn.prepareStatement(sql); 
			ptmt.setString(1, "%" + key + "%");
			ptmt.setString(2, "%" + key + "%");
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
			ErrorDAO.insertError(conn, "messageErrorSearchNameUserList", e.getMessage());
		} finally {
            if (ptmt != null) {
                try {
                    ptmt.close();
                } catch (SQLException e) {
                    ErrorDAO.insertError(conn, "Error closing PreparedStatement(searchNameUserList)", e.getMessage());
                }
            }
            if (rs != null) {
                try {
                	rs.close();
                } catch (SQLException e) {
                    ErrorDAO.insertError(conn, "Error closing ResultSet(searchNameUserList)", e.getMessage());
                }
            }
        }
		return listUser;
	}
}
