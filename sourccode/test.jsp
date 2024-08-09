<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang thông báo kết quả chạy thử</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<style type="text/css">
*{
	font-size: 18px;
}
.avatar{
	vertical-align: middle;
	width: 50p;
	height: 50px;
	border-radius: 50%;
}
.follwers-group{
	display: flex;
	flex-wrap: wrap;
	padding-right: 50px;
	padding-left: 50px;
}
.follwer-item{
	box-sizing: border-box;
	flex: 50%;
	display: flex;
	padding: 20px;
}
.info-follower{
	margin-left: 5px;
}
.social-stats{
	margin-left: 10px;
}
</style>
</head>
<body>
<%-- 	<p>${messageUpdateAvatarUser}</p> --%>
	<div class="follwers-group">
		<div class="follower-item">	
			<img alt="error" class="avatar" src="View/User/avatar/img/img_avatar_0.png">	
			<div class="info-follower">
				<a href="" class="fullname-follower"><strong>Phùng Duy Nghĩa</strong></a>
				<div class="loginname-follower">duynghia135z</div>
				<div class="birthday-follower">2004-05-13</div>
			</div>
			<div class="social-stats">
				<br>
				<div class="">12 Follower</div>
				<div class="">10 Đang Follow</div>
			</div>
		</div>
		
	</div>
</body>
</html>