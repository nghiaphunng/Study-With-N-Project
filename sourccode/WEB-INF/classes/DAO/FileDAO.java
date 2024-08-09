package DAO;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import BEAN.User;

public class FileDAO {
	public static int UpdateAvatarUser(HttpServletRequest request,HttpServletResponse response, Connection conn, User user){
		int res = -1;
		ServletContext context = request.getServletContext();
		response.setContentType("text/html; charset=UTF-8");
		
		final String address = context.getRealPath("View/User/avatar/img");
		final int MaxMemorySize = 1024 * 1024 * 3; //3MB
		final int MaxRequestSize = 1024 * 1024 * 50; //50MB
		
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if(!isMultipart) {
			res = -1;   //thiếu multipart/form-data trong form gửi
		}
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		
		//cài đặt nơi chứa
		factory.setSizeThreshold(MaxMemorySize);
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
		
		//tạo file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);
		//set kích thước 
		upload.setSizeMax(MaxRequestSize);
		
		
		try {
			List<FileItem> items = upload.parseRequest(request);
			Iterator<FileItem> iter = items.iterator();
			while(iter.hasNext()) {
				FileItem item = iter.next();
				if(!item.isFormField()) {
					String fileName = item.getName();
					String pathFile = address + File.separator + fileName;
					
					File uploadedFile = new File(pathFile);
//					
//					boolean check = uploadedFile.exists();
					try {
//						if(check == true) {
//							res = -2; //file tồn tại, chọn file khác
//						}
//						else {
							item.write(uploadedFile);
							//update lại tên
							UpdateAvatarDB(request, conn, user.getUserId(),"View/User/avatar/img/" + fileName);
							user.setUserAvatarURL("View/User/avatar/img/" + fileName);
							res = 1; //upload file thành công
//						}
					} catch (Exception e) {
						e.getMessage();
						res = -2;  // lỗi khác
					}
				}
				else {
					res = -3; //thất bại
				}
			}
		} catch (FileUploadException e) {
			res = -4; 
			e.getMessage();
			ErrorDAO.insertError(conn, "messageErrorUpdateAvatarUser", e.getMessage());
		}
		return res;
	}
	
	public static boolean UpdateAvatarDB(HttpServletRequest request, Connection conn, int userId, String nameFile) {
		PreparedStatement ptmt = null;
		String sql = "UPDATE profile SET avatarURL = ? WHERE profileId = ?";
		try {
			ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, nameFile);
			ptmt.setInt(2, userId);
			
			return ptmt.executeUpdate() > 0;
		}catch(SQLException e) {
			ErrorDAO.insertError(conn, "messageErrorUpdateAvatarDB", e.getMessage());
			return false;
		} finally {
	        if (ptmt != null) {
	            try {
	                ptmt.close();
	            } catch (SQLException e) {
	                ErrorDAO.insertError(conn, "Error closing PreparedStatement(UpdateAvatarDB)", e.getMessage());
	            }
	        }
	    }
	}
}	
