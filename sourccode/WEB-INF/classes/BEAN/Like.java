package BEAN;

public class Like {
	private int likeId;
	private int userId;
	private int postId;
	private String fullNameUser;
	private String nameLoginUser;
	private String createdAt;
	private int relationshipUser; // 0 : bạn bè 1 : người like theo dõi tác giả  2: tác giar theo dõi người like 3: không mối quan hệ gì cả
	private String urlAvaUser;
	public Like() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getUrlAvaUser() {
		return urlAvaUser;
	}
	public void setUrlAvaUser(String urlAvaUser) {
		this.urlAvaUser = urlAvaUser;
	}
	public int getRelationshipUser() {
		return relationshipUser;
	}

	public void setRelationshipUser(int relationshipUser) {
		this.relationshipUser = relationshipUser;
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

	public int getLikeId() {
		return likeId;
	}
	public void setLikeId(int likeId) {
		this.likeId = likeId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
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
}
