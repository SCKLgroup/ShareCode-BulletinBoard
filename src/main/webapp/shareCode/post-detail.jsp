<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>shareCode</title>
<link rel="stylesheet" href="css/writing.css" type="text/css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"/>
	
	<div class="main-content">
		<div class="write-content">
			<div class="post-title">
				<h2>${postInfo.post_title}</h2>
			</div>
			
			
			<div class="form-row">
				<div class="section">
					<span class="title post">카테고리</span> 
					${postInfo.post_category}
				</div>
				<div class="section">
					<span class="title post">조회수</span>
					${postInfo.post_hit}
				</div>
			</div>
			
			<div class="form-row">
				<div class="section">
					<span class="title post">작성자</span> 
					${postInfo.user_id}
				</div>
				<div class="section">
					<span class="title post">작성일</span>
					${postInfo.post_date}
				</div>
			</div>
			
			<div class="title-border"></div>
		
			
			<div class="form-row post-content">
				${postInfo.post_content}
			</div>
			
			<c:catch>
				<c:choose>
					<c:when test="${postInfo.user_no eq member}">
						<button class="write-btn" type="button" onclick="location.href='postModifyInfo.do?post_no=29'">수정</button>
						<button class="write-btn" type="button" onclick="location.href='postModifyInfo.do?post_no=29'">삭제</button>
					</c:when>
				</c:choose>
			</c:catch>
		
		</div>
	</div>

<script type="text/javascript">
	$(function(){
		
	});
</script>
</body>
</html>