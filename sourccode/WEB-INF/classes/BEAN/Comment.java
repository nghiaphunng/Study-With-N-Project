package BEAN;

public class Comment {
	private int commentId;
	private int postId;
	private String fullNameUser;
	private String nameLoginUser;
	private int userId;
	private String userAvatarURL;
	private String createdAt;
	private String content;
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getFullNameUser() {
		return fullNameUser;
	}

	public void setFullNameUser(String fullNameUser) {
		this.fullNameUser = fullNameUser;
	}

	public String getNameLoginUser() {
		return nameLoginUser;
	}

	public void setNameLoginUser(String nameLoginUser) {
		this.nameLoginUser = nameLoginUser;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserAvatarURL() {
		return userAvatarURL;
	}

	public void setUserAvatarURL(String userAvatarURL) {
		this.userAvatarURL = userAvatarURL;
	}

	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
