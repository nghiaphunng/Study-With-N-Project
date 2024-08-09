<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang đăng nhập</title>

<% 
	String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath(); 
	request.setAttribute("path", path);
%>

<link rel="stylesheet" href="<%=path %>/View/Login/loginstyle.css">

</head>
<body>
	<c:if test="${not empty messageSignup}"> 
	    <script>
	        window.addEventListener("load", function() {
	            alert("${messageSignup}");
	        });
	    </script>
	</c:if>
	<c:if test="${not empty messageLogin}">
	    <script>
	        window.addEventListener("load", function() {
	            alert("${messageLogin}");
	        });
	    </script>
	</c:if>
	
	<div class="wrapper">
	 <div class="trangchu">
      	<button class="title" id="loginButton">Đăng nhập</button>
      	<button class="title" id="homeButton">Trang chủ</button>
     </div>

     <form id="loginForm" action="LoginController" method="post">
        <div class="field">
           <input type="text" name="userName" required>
           <label>Tên tài khoản</label>
        </div>
        
        <div class="field">
           <input type="password" name="userPassWord" required>
           <label>Mật khẩu</label>
        </div>
        
        <div class="field">
           <input type="submit" value="Đăng nhập">
        </div>
        
        <div class="signup-link">
           Nếu bạn chưa có tài khoản?<button id="signupButton" type="button">Đăng kí</button>
        </div>
     </form>
  </div>
  
	<script>
		document.getElementById("homeButton").addEventListener("click", function() {
		    window.location.href = "HomeForward";
		});
		document.getElementById("signupButton").addEventListener("click", function() {
		    window.location.href = "SignupForward";
		});
		document.getElementById("loginButton").addEventListener("click", function() {
		    window.location.reload();
		});
	</script>
	
</body>
</html>