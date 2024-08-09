package BEAN;

import java.util.List;

public class Post {
	private int postId;
	private int userId;
	private String userName;
	private int visibilityId;
	private String title;
	private String newContent;
	private String oldContent;
	private String createdAt;
	private String userAvatarURL;
	private List<Like> likeList;
	private List<Comment> commentList;
	private int userLiked;  //1: đã like 0:chưa like
	public List<Like> getLikeList() {
		return likeList;
	}
	public int getUserLiked() {
		return userLiked;
	}

	public void setUserLiked(int userLiked) {
		this.userLiked = userLiked;
	}

	public void setLikeList(List<Like> likeList) {
		this.likeList = likeList;
	}
	public List<Comment> getCommentList() {
		return commentList;
	}

	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}

	public String getUserAvatarURL() {
		return userAvatarURL;
	}

	public void setUserAvatarURL(String userAvatarURL) {
		this.userAvatarURL = userAvatarURL;
	}

	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getVisibilityId() {
		return visibilityId;
	}
	public void setVisibilityId(int visibilityId) {
		this.visibilityId = visibilityId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getNewContent() {
		return newContent;
	}

	public void setNewContent(String newContent) {
		this.newContent = newContent;
	}

	public String getOldContent() {
		return oldContent;
	}

	public void setOldContent(String oldContent) {
		this.oldContent = oldContent;
	}

	public String getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
}
