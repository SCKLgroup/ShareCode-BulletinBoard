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


<link rel="stylesheet" href="css/header.css" type="text/css">
<link rel="stylesheet" href="css/login.css" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.2.0/css/all.min.css"
	integrity="sha512-6c4nX2tn5KbzeBJo9Ywpa0Gkt+mzCzJBrE1RB6fmpcsoN+b/w/euwIMuQKNyUoU/nToKN3a8SgNOtPrbW12fug=="
	crossorigin="anonymous" />

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<header class="header">
		<a href="list.jsp" class="logo">ShareCode</a> <input class="menu-btn"
			type="checkbox" id="menu-btn" /> <label class="menu-icon"
			for="menu-btn"><span class="navicon"></span></label>

		<div class="wrap">
			<div class="search">
				<input type="text" class="searchTerm" placeholder="검색어를 입력해주세요">
				<button type="submit" class="searchButton">
					<i class="fa fa-search"></i>
				</button>
			</div>
		</div>


		<ul class="menu">
			<c:if test="${member == null}">
				<li><a href="#work">SignUp</a></li>
				<li><a href="#about" id="popup_open_btn">Login</a></li>
			</c:if>
			<c:if test="${member != null}">
				<p>${member.USER_ID}님환영합니다.</p>
				<button id="logoutBtn" type="button">logout</button>
			</c:if>
			<c:if test="${msg == false }">
				<li><a href="#work">SignUp</a></li>
				<li><a href="#about" id="popup_open_btn">Login</a></li>
				<p style="color: red;">로그인 실패 ! 아이디와 비밀번호를 확인해 주세요</p>
			</c:if>
		</ul>
	</header>




	<%@include file="login.jsp"%>
	<script src="js/header.js"></script>
</body>
</html>