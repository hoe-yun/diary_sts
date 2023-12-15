<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container col-lg-5" align="center">
		<br><h1>일정 검색</h1><br>
		<a href="${pageContext.request.contextPath }/home" class="btn btn-outline-dark">홈으로</a><br><br>
		<div>
			<form action="${pageContext.request.contextPath }/scheduleListByWord" method="get">
				<input type="text" name="word">
				<button class="btn btn-outline-dark">검색</button>
			</form> 
		</div><br>
		<table class="table table-bordered">
			<tr align="center">
				<th class="col-lg-2">no</th>
				<th class="col-lg-10">memo</th>
			</tr>
			<c:forEach var="s" items="${list }">
				<tr align="center">
					<td>${s.scheduleNo }</td>
					<td>${s.scheduleMemo }</td>
				</tr>
			</c:forEach>
		</table>
		<div>
			<a href="${pageContext.request.contextPath }/scheduleListByWord?currentPage=1&word=${paramWord}" class="btn btn-outline-dark">처음</a>
			<c:if test="${currentPage - 1 > 0 }">
				<a href="${pageContext.request.contextPath }/scheduleListByWord?currentPage=${currentPage - 1}&word=${paramWord}" class="btn btn-outline-dark">이전</a>
			</c:if>
			<c:if test="${!(currentPage - 1 > 0) }">
				<button class="btn btn-outline-dark" disabled>이전</button>
			</c:if>
			<button class="btn btn-outline-dark" disabled>${currentPage }</button>
			<c:if test="${currentPage < lastPage}">
				<a href="${pageContext.request.contextPath }/scheduleListByWord?currentPage=${currentPage + 1}&word=${paramWord}" class="btn btn-outline-dark">다음</a>
			</c:if>
			<c:if test="${!(currentPage < lastPage)}">
				<button class="btn btn-outline-dark" disabled>다음</button>
			</c:if>
			<a href="${pageContext.request.contextPath }/scheduleListByWord?currentPage=${lastPage }&word=${paramWord}" class="btn btn-outline-dark">마지막</a>
		</div>
	</div>
</body>
</html>