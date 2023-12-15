<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			if($('#commentContent').val().length < 1){
				alert('코멘트 내용을 입력하세요')
			}else{
				$('#form').submit()
			}
		})
	})
</script>
</head>
<body>
	<div class="container" align="center">
		<br><h1>공지제목 : ${resultNotice.noticeTitle }</h1><br><br><br>
		<h2>공지내용 : ${resultNotice.noticeContent }</h2><br><br><br>
		<h4>작성자 : ${resultNotice.memberId }</h4>
		<h4>작성일 : ${resultNotice.createdate }</h4><br><br>
		<a href="${pageContext.request.contextPath }/noticeList" class="btn btn-outline-dark">뒤로</a>
	</div>
	<div class="container" align="center">
		<br><br><br><h1>코멘트</h1><br><br>
		<table class="table">
			<c:forEach var="c" items="${list }">
				<tr align="center" style="height:70px">
					<c:choose>
						<c:when test="${c.isSecret == true && (loginMember.memberLevel > 0 || loginMember.memberId == c.memberId)}">
							<td><span class="badge rounded-pill bg-warning">Secret</span></td>
							<td class="col-lg-8">${c.commentContent }</td>
							<td class="col-lg-1">${c.memberId }</td>
							<td class="col-lg-1">${c.createdate }</td>
							<td class="col-lg-2">
							<c:if test="${loginMember.memberId == c.memberId }">
								<a href="${pageContext.request.contextPath }/modifyComment?commentNo=${c.commentNo}&noticeNo=${resultNotice.noticeNo }" class="btn btn-outline-dark">수정</a>
							</c:if>
							<c:if test="${loginMember.memberId == c.memberId || loginMember.memberLevel > 0}">
								<a href="${pageContext.request.contextPath }/removeComment?commentNo=${c.commentNo}&noticeNo=${resultNotice.noticeNo }" class="btn btn-outline-danger">삭제</a>
							</c:if>
							</td>
						</c:when>
						<c:when test="${c.isSecret == true && loginMember.memberId != c.memberId}">
							<td><span class="badge rounded-pill bg-warning">Secret</span></td>
							<td colspan="4">비밀글 입니다.</td>
						</c:when>
						<c:otherwise>
							<td><span class="badge rounded-pill bg-success">Public</span></td>
							<td class="col-lg-8">${c.commentContent }</td>
							<td class="col-lg-1">${c.memberId }</td>
							<td class="col-lg-1">${c.createdate }</td>
							<td class="col-lg-2">
							<c:if test="${loginMember.memberId == c.memberId }">
								<a href="${pageContext.request.contextPath }/modifyComment?commentNo=${c.commentNo}&noticeNo=${resultNotice.noticeNo }" class="btn btn-outline-dark">수정</a>
							</c:if>
							<c:if test="${loginMember.memberId == c.memberId || loginMember.memberLevel > 0}">
								<a href="${pageContext.request.contextPath }/removeComment?commentNo=${c.commentNo}&noticeNo=${resultNotice.noticeNo }" class="btn btn-outline-danger">삭제</a>
							</c:if>
							</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>
		</table>
		<div>
			<c:if test="${currentPage - 1 > 0 }">
				<a href="${pageContext.request.contextPath }/noticeOne?noticeNo=${resultNotice.noticeNo }&currentPage=${currentPage - 1}" class="btn btn-outline-dark">이전</a>
			</c:if>
			<c:if test="${!(currentPage - 1 > 0) }">
				<button class="btn btn-outline-dark" disabled>이전</button>
			</c:if>
			<c:if test="${currentPage < lastPage}">
				<a href="${pageContext.request.contextPath }/noticeOne?noticeNo=${resultNotice.noticeNo }&currentPage=${currentPage + 1}" class="btn btn-outline-dark">다음</a>
			</c:if>
			<c:if test="${!(currentPage < lastPage)}">
				<button class="btn btn-outline-dark" disabled>다음</button>
			</c:if>
		</div><br>
		<div>
			<table class="table ">
				<tr align="center">
					<form action="${pageContext.request.contextPath }/addComment" method="post" id="form">
						<td class="col-lg-8">
							<textarea name="commentContent" rows="2" cols="50" id="commentContent"></textarea>
						</td>
						<td class="col-lg-2">
							<input type="checkbox" name="isSecret" value="true">비밀글
						</td>
						<td>
							<input type="hidden" name="memberId" value="${loginMember.memberId }">
							<input type="hidden" name="noticeNo" value="${resultNotice.noticeNo }">
						</td>
					</form>
					<td class="col-lg-2">
						<button class="btn btn-outline-dark" id="btn">추가</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>