<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu Page</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
	<nav id="menu" class="navbar">
        <a class="menu_left" href="HomeForward">Trang chủ</a>  
		<a class="menu_left" href="CommunityForward">Cộng đồng</a>
		
		<% if(session.getAttribute("sessionUser") == null)
			{
		%>
        	<a class="menu_right" href="LoginForward">Đăng nhập</a>
        	<a class="menu_right" href="HomeForward">Trang cá nhân</a>
        <%
			}
		else
			{
	    %>
	    	<a class="menu_right" href="LogoutController">Đăng xuất</a>
	    	<a class="menu_right" href="ProfileForward">Trang cá nhân</a>
	    <%
			}
	    %>
	        
           
        <div class="search-container">
            <form name="search_form" onsubmit="return false;">
                <input type="text" placeholder="Tìm kiếm..." name="search" onkeyup="SearchName(this.value, document.search_form.search_scope.value)">
                <button type="button" onclick="SearchName(document.search_form.search.value, document.search_form.search_scope.value)"><i class="fa fa-search"></i></button>
            	<select name="search_scope" onchange="SearchName(document.search_form.search.value, document.search_form.search_scope.value)">
            		<option value="0">Tất cả</option>
		            <option value="1">Môn học</option>
		            <option value="2">Mọi người</option>
		            <option value="3">Bài viết</option>
		        </select>
            </form>
        </div>  
    </nav>
    
</body>
</html>