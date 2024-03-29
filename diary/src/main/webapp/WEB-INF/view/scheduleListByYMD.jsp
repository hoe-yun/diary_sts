<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날짜로 일정 검색</title>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		
		$.ajax({
			url:'/diary/COUNT',
			method:'get',
			success:function(json){
				$('#totalCnt').text('누적 접속자 : '+json);
			}
		})
	})
</script>
</head>
<body>
	<!-- 헤더 -->
	<div class="container" align="center">
		<div align="right"><br>
			<button id="totalCnt" disabled class="btn btn-outline-dark"></button>
			<button disabled class="btn btn-outline-primary">접속자 : ${currentCnt }</button>
		</div><br>
		<div style="background-color:#D1E7DD; border-radius:5px;">
			<br><br><h1>${loginMember.memberId }'s Diary</h1><br><br>
		</div>
	</div><br>
	<!-- 헤더 -->
	<div align="center">
		<a href="${pageContext.request.contextPath }/home" class="btn btn-outline-dark">홈으로</a><br><br>
	</div>
	<div class="container">
		<div style="border:5px solid #D1E7DD; border-radius:5px;">
			<div class="container col-lg-8" align="center"><br>
				<h1>날짜로 일정 검색</h1><br>
				<div style="float:right">
					<form action="${pageContext.request.contextPath }/scheduleListByYMD" method="get">
						<select name="year">
							<option value=""></option>
							<c:forEach var="y" begin="${maxMinMap.minYear }" end="${maxMinMap.maxYear }" step="1">
								<option value="${y}">${y}</option>
							</c:forEach>
						</select>년
						<select name="month">
							<option value=""></option>
							<c:forEach var="m" begin="1" end="12" step="1">
								<option value="${m }">${m }</option>
							</c:forEach>
						</select>월
						<select name="date">
							<option value=""></option>
							<c:forEach var="d" begin="1" end="31" step="1">
								<option value="${d }">${d }</option>
							</c:forEach>
						</select>일
						<button class="btn btn-outline-dark">검색</button>
					</form> 
				</div><br><br>
				<table class="table table-bordered">
					<tr align="center">
						<th class="col-lg-2">번호</th>
						<th class="col-lg-2">날짜</th>
						<th class="col-lg-8">내용</th>
					</tr>
					<c:forEach var="s" items="${list }">
						<tr align="center">
							<td>${s.scheduleNo }</td>
							<td>${s.scheduleDate }</td>
							<td>${s.scheduleMemo }</td>
						</tr>
					</c:forEach>
				</table>
				<div>
					<a href="${pageContext.request.contextPath }/scheduleListByYMD?currentPage=1&year=${year }&month=${month }&date=${date }" class="btn btn-outline-dark">처음</a>
					<c:if test="${currentPage - 1 > 0 }">
						<a href="${pageContext.request.contextPath }/scheduleListByYMD?currentPage=${currentPage - 1}&year=${year }&month=${month }&date=${date }" class="btn btn-outline-dark">이전</a>
					</c:if>
					<c:if test="${!(currentPage - 1 > 0) }">
						<button class="btn btn-outline-dark" disabled>이전</button>
					</c:if>
					<button class="btn btn-outline-dark" disabled>${currentPage }</button>
					<c:if test="${currentPage < lastPage}">
						<a href="${pageContext.request.contextPath }/scheduleListByYMD?currentPage=${currentPage + 1}&year=${year }&month=${month }&date=${date }" class="btn btn-outline-dark">다음</a>
					</c:if>
					<c:if test="${!(currentPage < lastPage)}">
						<button class="btn btn-outline-dark" disabled>다음</button>
					</c:if>
					<a href="${pageContext.request.contextPath }/scheduleListByYMD?currentPage=${lastPage}&year=${year }&month=${month }&date=${date }" class="btn btn-outline-dark">마지막</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>