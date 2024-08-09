<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cập nhật thông tin</title>
</head>
<body>
	<div class="popup_container">
		<button type="submit" class="popup_btn" onclick="openNotifyPopup()">Thông báo</button>
		<div class="popup_window" id="notify_popup_window">
			<h2>Thông báo</h2>
			<p>Hiện tại hệ thống chưa hoàn thiện 100%</p>
			<button type="button" onclick="closeNotifyPopup()">Xong</button>
		</div>
	</div>
	
</body>
</html>