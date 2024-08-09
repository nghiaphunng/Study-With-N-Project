<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chạy thử</title>
</head>
<body>
	<form action="UpdateAvatarUserController" method="post" enctype="multipart/form-data">
        <input type="file" name="avatar" />
        <input type="submit" value="Upload Avatar" />
    </form>
</body>
</html>