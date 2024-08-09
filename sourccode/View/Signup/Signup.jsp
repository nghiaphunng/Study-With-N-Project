<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang đăng ký</title>

<% 
	String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath(); 
	request.setAttribute("path", path);
%>

<link rel="stylesheet" href="<%=path %>/View/Signup/signupstyle.css">

</head>
<body>
	<c:if test="${not empty messageSignup}">
	    <script>
	        window.addEventListener("load", function() {
	            alert("${messageSignup}");
	        });
	    </script>
	</c:if>
	
	<div class="container">
	   
	   <div class="trangchu">
	   		<button class="title" id="signupButton">Đăng ký</button>
	        <button class="title" id="homeButton">Trang chủ</button>
	   </div>
	      
	   <div class="content">
	     <form action="SignupController" name="formSignup" onsubmit="return validateSignUp()" method="POST">
	      <div class="user-details">
	        <div class="input-box">
	          <span class="details">Họ và tên của bạn</span>
	          <input type="text" placeholder="Nhập họ tên" required name="fullName">
	        </div>
	        
	        <div class="input-box">
	          <span class="details">Tên tài khoản của bạn</span>
	          <input type="text" placeholder="Nhập tên tài khoản" required name="userName">
	        </div>
	        
	        <div class="input-box">
	          <span class="details">Email</span>
	          <input type="text" placeholder="Nhập email" required name="userEmail">
	        </div>
	        
	        <div class="input-box">
	          <span class="details">Ngày sinh của bạn</span>
	          <input type="date" name="birthday" placeholder="Nhập email" required>
	        </div>

	        <div class="input-box">
	          <span class="details">Mật Khẩu</span>
	          <input type="password" placeholder="Nhập mật khẩu" required name="userPassWord">
	        </div>
	        
	        <div class="input-box">
	          <span class="details">Xác nhận lại mật khẩu</span>
	          <input type="password" placeholder="Nhập mật khẩu" required name="psw_repeat">
	        </div>
	        
	      </div>
	      <div class="final-details">
	        <label for="gender">Giới Tính:</label>
	          <select id="gender" name="gender">
	            <option value="0">Nam</option>
	            <option value="1">Nữ</option>
	          </select>
	      </div>
	      
	      <div class="button-div">
	        <button type="submit" class="signupbtn">Đăng ký</button>
	      </div>
	      
	    </form>
	  </div>
	</div>
	
	<script>
		document.getElementById("homeButton").addEventListener("click", function() {
		    window.location.href = "HomeForward"
		});
		document.getElementById("signupButton").addEventListener("click", function() {
		    window.location.reload();
		});
	</script>
	
	<script type="text/javascript" src="<%=path%>/View/Signup/ValidateSignup.js"></script>
	
</body>
</html>