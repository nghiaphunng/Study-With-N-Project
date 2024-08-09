package BEAN;

public class Contact {
	private int contactId;
	private int userId;
	private int contactType; //1:facebook 2:ins 3:tiktok 4:youtube 5:linkedin 6:khác
	private String linkContact;
	private String descContact;
	public Contact() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getContactId() {
		return contactId;
	}

	public void setContactId(int contactId) {
		this.contactId = contactId;
	}

	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getContactType() {
		return contactType;
	}
	public void setContactType(int contactType) {
		this.contactType = contactType;
	}
	public String getLinkContact() {
		return linkContact;
	}
	public void setLinkContact(String linkContact) {
		this.linkContact = linkContact;
	}
	public String getDescContact() {
		return descContact;
	}
	public void setDescContact(String descContact) {
		this.descContact = descContact;
	}
}
