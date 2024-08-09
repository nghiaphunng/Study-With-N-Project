package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import BEAN.Contact;

public class ContactDAO {
	public static List<Contact> listContact(HttpServletRequest request, Connection conn, int userId){
		List<Contact> listContact = new ArrayList<Contact>();
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		String sql = "select * from contact where profileId = ?";
		try {
			ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, userId);
			rs = ptmt.executeQuery();
			while(rs.next()) {
				Contact contact = new Contact();
				contact.setUserId(rs.getInt("profileId"));
				contact.setContactType(rs.getInt("contactType"));
				contact.setLinkContact(rs.getString("linkContact"));
				contact.setDescContact(rs.getString("descContact"));
				listContact.add(contact);
			}
		} catch (SQLException e) {
			request.setAttribute("messageErrorReturnListContact", e.getMessage());
		}
		return listContact;
	}
}
