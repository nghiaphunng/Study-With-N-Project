<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404 Page Error</title>

<% String e404Path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath(); %>

<style>
	@import url('https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900');
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
		font-family: 'Poppins', sans-serif;
	}
	body {
		background: linear-gradient(45deg, #8500ff, #5acaff);
		height: 100vh;
	}
	#error404_container {
		position: absolute;
		width: 100%;
		height: 100%;
		display: flex;
		justify-content: center;
		align-items: center;
		background: url('<%=e404Path%>/Error/img/error404_1.jpg') center center / cover, #151729;
		box-shadow: 0 15px 30px rgba(0,0,0,.5);
	}
	#error404_container .e404content {
		max-width: 600px;
		text-align: center;
	}
	#error404_container .e404content h4 {
		position: relative;
		font-size: 1.5em;
		margin-bottom: 20px;
		color: #111;
		background: #fff;
		font-weight: 300;
		padding: 10px 20px;
		display: inline-block;
	}
	#error404_container .e404content a {
		position: relative;
		display: inline-block;
		padding: 10px 25px;
		background: green;
		color: #fff;
		text-decoration: none;
		margin-top: 25px;
		border-radius: 25px;
		border-bottom: 4px solid #d00d56;
	}
	#error404_container .e404content a:hover {
		background: #ff0562;
	}
</style>

</head>
<body>
	
	<div id="error404_container">
		<div class="e404content">
			<h4>Xin lỗi, trang web bạn truy cập không tồn tại</h4>
			<a href="HomeForward">Trở về trang chủ</a>
		</div>
	</div>
	
	<script type="text/javascript">
		var error404_container = document.getElementById('error404_container');
		window.onmousemove = function(e){
			var xPercent = (e.clientX / window.innerWidth) * 100,
            yPercent = (e.clientY / window.innerHeight) * 100;
        	error404_container.style.backgroundPosition = xPercent + '% ' + yPercent + '%';
		}
	</script>
</body>
</html>