<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#btn').click(function(){
			if($('#noticeTitle').val().length < 1){
				alert('공지 제목을 입력해주세요')
			}else if($('#noticeContent').val().length < 1){
				alert('공지 내용을 입력해주세요')
			}else if($('#noticePw').val().length < 1){
				alert('공지 비밀번호를 입력해주세요')
			}else{
				$('#form').submit()
			}
		})
	})
</script>
</head>
<body>
	<div class="container col-lg-2" align="center">
	<br><h1>공지 추가</h1><br>
	<form action="${pageContext.request.contextPath }/addNotice" method="post" id="form">
		<table class="table ">
			<tr>
				<th>제목</th>
				<td><input type="text" name="noticeTitle" id="noticeTitle"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="noticeContent" rows="5" cols="22" id="noticeContent"></textarea></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="noticePw" id="noticePw"></td>
			</tr>
		</table><br>
	</form>
	<br><button class="btn btn-outline-dark" id="btn">추가</button>
	<a href="${pageContext.request.contextPath }/noticeList" class="btn btn-outline-dark">뒤로</a>
	</div>
</body>
</html>