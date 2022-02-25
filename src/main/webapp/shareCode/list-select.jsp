<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions"
	uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ShareCode</title>
<link rel="stylesheet" href="css/list.css" type="text/css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="inner_cont">
		<div class="borad_list_tbl">
			<div class="select_result">[ ${map.count} ] 개의 게시글이 있습니다.</div>
			<br>
			<table>
				<caption>게시판 리스트</caption>
				<colgroup>
					<col width="30">
					<col width="180">
					<col width="50">
					<col width="50">
					<col width="30">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">글번호</th>
						<!--  <th scope="col"><select><option value="python">python</option><option value="java">Java</option></select></th> -->
						<th scope="col">글제목</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>

				<tbody id="tblist">
					<c:forEach var="low" items="${map.board}">
						<tr>
							<td>${low.post_no}</td>
							<td><a href="postInfo.do?post_no=${low.post_no}">${low.post_title }</a></td>
							<td>${low.user_id}</td>
							<td>${low.post_date}</td>
							<td>${low.post_hit}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
		<div class="btn-div">
			<button class="write-btn" type="button"
				onclick="location.href='post-write.jsp'">글작성</button>
		</div>

		<div class="container xlarge">
			<div class="pagination" id="pageList">
				<ul>
					<c:choose>
						<c:when test="${pageList.startPage==1}">
							<li><a href="list.do?category=${pageList.category}&page=${pageList.startPage}">처음으로</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="list.do?category=${pageList.category}&page=${pageList.startPage-10}"></a></li>
						</c:otherwise>
					</c:choose>

					<c:forEach varStatus="cnt" begin="${pageList.startPage}" end="${pageList.endPage}">
						<c:choose>
							<c:when test="${cnt.index eq pageList.page }">
								<li><a href="#" class="current-page">${cnt.index}</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="list.do?category=${pageList.category}&page=${cnt.index}">${cnt.index}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<c:when test="${pageList.endPage ne pageList.totalPage}">
							<a href="list.do?category=${pageList.category}&page=${pageList.endPage+1}"></a>
						</c:when>
						<c:otherwise>
							<a href="list.do?category=${pageList.category}&page=${pageList.endPage}"></a>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</div>

</body>
</html>