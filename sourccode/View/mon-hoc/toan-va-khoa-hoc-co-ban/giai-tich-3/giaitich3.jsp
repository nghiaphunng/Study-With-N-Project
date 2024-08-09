<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giải tích 3</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>

<% 	String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath(); 
	String pathAva = "View/User/avatar/img/";
	String pathEbook = path + "/View/mon-hoc/toan-va-khoa-hoc-co-ban/giai-tich-3/ebook/";
%>

<!-- file css -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=path %>/View/Home/css/viewhome.css">
<link rel="stylesheet" href="<%=path %>/View/Home/css/viewmenu.css">
<link rel="stylesheet" href="<%=path %>/View/Home/css/view_toc_collapsible.css">
<link rel="stylesheet" href="<%=path %>/View/Home/css/popup.css">

<link rel="stylesheet" href="<%=path %>/View/mon-hoc/style.css">
<link rel="stylesheet" href="<%=path %>/View/Comment/css/comment.css">

<link rel="stylesheet" href="<%=path %>/View/User/css/style.css">
<link rel="stylesheet" href="<%=path %>/View/User/css/post_style.css">
<link rel="stylesheet" href="<%=path %>/View/User/css/icon.css">

<link rel="stylesheet" href="<%=path %>/View/User/css/socialstats.css">

</head>
<body>
	
	<!--thêm header-->
	<jsp:include page="/View/Home/menu.jsp"></jsp:include>
	
	<div class="split left">
		<h2 style="text-align: center;color: orange;">Nội dung bài viết</h2>
		<h1>Giải tích 3</h1>
		<button class="course_title_collapsible">Bài giảng</button>
		<div class="list_course">
			<ol>
				<li><a href="#bgFami">Bài giảng Fami</a></li>
				<li><a href="#bgthayBXD">Bài giảng thầy Bùi Xuân Diệu</a></li>
				<li><a href="#bgthayNTH">Bài giảng thầy Nguyễn Thiệu Huy</a></li>
				<li><a href="#bgthayNXT">Bài giảng thầy Nguyễn Xuân Thảo</a></li>
				<li><a href="#bgthayLVT">Bài giảng thầy Lê Văn Tứ</a></li>
			</ol>	
		</div>
		
		<button class="course_title_collapsible">Đề cương</button>
		<div class="list_course">
			<ol>
				<li><a href="#dcNN1">Đề cương giải tích 3 nhóm ngành 1</a></li>
				<li><a href="#dcGK">Đề thi thử giữa kì</a></li>
				<li><a href="#dcCK">Đề thi thử cuối kì</a></li>
			</ol>	
		</div>
		
		<button class="course_title_collapsible">Đề thi</button>
		<div class="list_course">
			<ol>
				<li><a href="#dethi1">Đề thi kì 2023.1</a></li>
				<li><a href="#dethi2">Đề thi kì 2023.2</a></li>
			</ol>	
		</div>
		
		<button class="course_title_collapsible">Tài liệu tham khảo khác</button>
		<div class="list_course">
			<ol>
				<li><a href="#clbHTHT">Câu lạc bộ hỗ trợ học tập</a></li>
			</ol>	
		</div>
		
		<br>
	</div>
	
	<div class="split center" id="result-display">	
		<h2>1.Bài giảng</h2>
		<h3 id="bgFami">1.1.Bài giảng Fami</h3>
		<p>Chương 1: Chuỗi</p>
		<div class="documentFile">
			<iframe src="<%=pathEbook %>Fami/Slides_Giaitich3_Chuong1.pdf"></iframe>
		</div>
                
           <p>Chương 2: Phương trình vi phân</p>
           <div class="documentFile">
           	<iframe src="<%=pathEbook %>Fami/Slides_Giaitich3_Chuong2.pdf"></iframe>
           </div>

           <p>Chương 3: Phương pháp biến đổi Laplace</p>
           <div class="documentFile">
           	<iframe src="<%=pathEbook %>Fami/Slides_Giaitich3_Chuong3.pdf"></iframe>
           </div>
		
		<h3 id="bgthayBXD">1.2.Bài giảng thầy Bùi Xuân Diệu</h3>
		<div class="documentFile">
			<iframe src="<%=pathEbook %>BuiXuanDieu.pdf"></iframe>
		</div>
		
		<h3 id="bgthayNTH">1.3.Bài giảng thầy Nguyễn Thiệu Huy</h3>
		<div class="documentFile">
			<iframe src="<%=pathEbook %>NguyenThieuHuy.pdf"></iframe>
		</div>
		
		<h3 id="bgthayNXT">1.4.Bài giảng thầy Nguyễn Xuân Thảo</h3>
		<div class="documentFile">
			<iframe src="<%=pathEbook %>NguyenXuanThao.pdf"></iframe>
		</div>
		
		<h3 id="bgthayLVT">1.5.Bài giảng thầy Lê Văn Tứ</h3>
		<p>Bài 1</p>
		<div class="documentFile">
			<iframe src="<%=pathEbook %>Slide_LVT/bai_1.pdf"></iframe>
		</div>
              
           <p>Bài 2</p>
		<div class="documentFile">
			<iframe src="<%=pathEbook %>Slide_LVT/bai_2.pdf"></iframe>
		</div>
              
           <p>Bài 3</p>
		<div class="documentFile">
			<iframe src="<%=pathEbook %>Slide_LVT/bai_3.pdf"></iframe>
		</div>
              
           <p>Bài 4</p>
		<div class="documentFile">
			<iframe src="<%=pathEbook %>Slide_LVT/bai_4.pdf"></iframe>
		</div>
              
           <p>Bài 5</p>
           <div class="documentFile">
           	<iframe src="<%=pathEbook %>Slide_LVT/bai_5.pdf"></iframe>
           </div>      
			
		<h2>2.Đề cương</h2>
		<h3 id="dcNN1">2.1.Đề cương giải tích nhóm ngành 1</h3>
		<div class="documentFile">
			<iframe src="<%=pathEbook %>MI1131_Baitapthamkhao_Giaitich3.pdf"></iframe>
		</div>
		
		<h3 id="dcGK">2.2.Đề thi thử giữa kì</h3>
		<p>2.2.1.Bài tập trắc nghiệm tham khảo thi giữa kì lần 1-Thầy Lê Văn Tứ</p>
		<p>Đề số 1</p>
           <div class="documentFile">
           	<iframe src="<%=pathEbook %>BT_LVT/Tuan_1.pdf"></iframe>
           </div>
		
		<p>Đề số 2</p>
		<div class="documentFile">
			<iframe src="<%=pathEbook %>BT_LVT/Tuan_2.pdf"></iframe>
		</div>
              
        <p>Đề số 3</p>
        <div class="documentFile">
        	<iframe src="<%=pathEbook %>BT_LVT/Tuan_3.pdf"></iframe>
        </div>
           
        <p>Đề số 4</p>
		<div class="documentFile">
			<iframe src="<%=pathEbook %>BT_LVT/Tuan_4.pdf"></iframe>
		</div>
              
        <p>Đề số 5</p>
		<div class="documentFile">
			<iframe src="<%=pathEbook %>BT_LVT/Tuan_5.pdf"></iframe>
		</div>	
		
		<p>Đáp án</p>
		<div class="documentFile">
			<a target="_blank" href="https://www.youtube.com/playlist?list=PLGU_ZLSbSFRaNMyf5Xj20kklI6qcLkFR-">Video chữa đề của thầy Tứ</a>
		</div>                
		
		<h3 id="dcCK">2.3.Đề thi thử cuối kì</h3>
		
		<h2>3.Đề thi</h2>
		<h3 id="dethi1">3.1.Đề thi kì 2023.1</h3>
			
		<h3 id="dethi2">3.2.Đề thi kì 2023.2</h3>
		
		<h2>4.Tài liệu tham khảo khác</h2>
		<h3 id="clbHTHT">4.1.Câu lạc bộ hỗ trợ học tập</h3>
		<p>4.1.1.Tài liệu chương 1</p>
		<div class="documentFile">
			<a target="_blank" href="https://drive.google.com/drive/folders/1sd36rQxeuT-G7ooORZ8mAnABCjDcBQEr">Xem tài liệu</a>
		</div>	
		<p>4.1.2.Tài liệu chương 2</p>
		<div class="documentFile">
			<a target="_blank" href="https://drive.google.com/drive/folders/1ftPr08fhamD8uSyUfGoFJEt_WsHdfbQb?fbclid=IwZXh0bgNhZW0CMTAAAR2SKMyqNxrNRr45fa0i2doKRwwIzOHYM61gLaI8jIta2lTvPsM6mdHO2K4_aem_AcLiuAR8Yq4OGFM1MJxIDAupPvE26NNuWMW-MZoi2GtVP5xbyqOXFxz2b1bZMHOSAfypF9CcGXbYHuFW_tgKKYdU">Xem tài liệu</a>
		</div>	
		
		<!-- Phần bình luận -->
		<h2 id="comment">Phần bình luận</h2>
		<div id="show_comment_container">
			<c:forEach items="${listCmt}" var="cmt">
				<div class="list-comment">
					<img src="${cmt.getUserAvatarURL()}" alt="User Avatar" class="avatar">
					<div class="comment-content">
						<c:if test="${sessionUser.getUserId() == cmt.getUserId() }">
								<a class="username" href="ProfileForward" class="name-user-post" style="font-weight: bold;">${cmt.getFullNameUser() }</a>
						</c:if>
						<c:if test="${sessionUser != null && sessionUser.getUserId() != cmt.getUserId()}">
								<a class="username" href="UserInforPageForward?userid=${cmt.getUserId() }" class="name-user-post" style="font-weight: bold;">${cmt.getFullNameUser() }</a>
						</c:if>
						<c:if test="${sessionUser == null}">
								<div class="username">${cmt.getFullNameUser() }</div>
						</c:if>
						<div class="comment-text">${cmt.getContent() }</div>
					</div>
					<c:if test="${sessionUser.getUserId() == cmt.getUserId() }">
						<button type="button" class="delete-comment-btn" onclick="DeleteCommentCourse(${cmt.getCommentId()}, ${cmt.getPostId()})"><i style="font-size:30px;color:red;" class="fa fa-close"></i></button>
					</c:if>	
				</div>
			</c:forEach>
		</div>
		
		<jsp:include page="/View/Comment/commentcourse.jsp"></jsp:include>
		
		<br>
		<br>
	</div>
	
	<div class="split right">
		
	</div>
	
	<!-- file javascript -->
	<script type="text/javascript" src="<%=path %>/View/Home/js/TocCollapsible.js"></script>
	<script type="text/javascript" src="<%=path %>/View/Home/js/ProcessTextInput.js"></script>
	<script type="text/javascript" src="<%=path %>/View/Home/js/popup.js"></script>
	<script type="text/javascript" src="<%=path %>/View/Search/js/Search.js"></script>
	
	<script type="text/javascript" src="<%=path %>/View/Comment/js/Comment.js"></script>
	
	<script type="text/javascript" src="<%=path %>/View/Search/js/Search.js"></script>
</body>
</html>