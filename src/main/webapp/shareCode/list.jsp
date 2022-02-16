<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ShareCode</title>
<link rel="stylesheet" href="css/list.css" type="text/css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {

	});
</script>
</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="inner_cont">
		<div class="borad_list_tbl">
			${selectLang}
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
					<select><option id="category" value="Java">Java</option>
						<option id="category" value="Python">Python</option></select>
					<tr>
						<th scope="col">글번호</th>
						<!--  <th scope="col"><select><option value="python">python</option><option value="java">Java</option></select></th> -->
						<th scope="col">글제목</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>

				<c:forEach var="i" items="${selectLang}" varStatus="cnt">
					<tbody>
						<tr>
							<td>${i.post_no}</td>
							<td>${i.post_title }</td>
							<td>${i.user_no }</td>
							<td>${i.post_date }</td>
							<td>${i.post_hit }</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
		<div class="btn-div">
			<button class="write-btn" type="button" onclick="location.href='post-write.jsp'">글작성</button>
		</div>

		<div class="container xlarge">
			<div class="pagination">
				<ul>
					<li><a href="#">PREVIOUS</a></li>
					<li><a href="#">1</a></li>
					<li class="active"><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">NEXT</a></li>
				</ul>
			</div>
		</div>
	</div>

</body>
</html>
