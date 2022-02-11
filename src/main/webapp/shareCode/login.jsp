<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions"
	uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ShareCode</title>
<link rel="stylesheet" href="css/header.css" type="text/css">
<link rel="stylesheet" href="css/login.css" type="text/css">
</head>

<ul class="menu">
	<li><a href="#work">SignUp</a></li>
	<li><a href="#about" id="popup_open_btn">Login</a></li>
</ul>
<th:block th:fragment="setLogin(login)">
	<body>
		<div id="my_modal">
			<div>
				<h1 class="login_title">LOGIN</h1>
				<form th:action="@{/auth/loginProc}" th:method="POST">
					<a class="modal_close_btn">ⅹ</a> <span class="login_font">ID
						<input type="text" name="username" class="user_id_pass"
						placeholder="아이디를 입력해주세요"><br>
					</span><br> <span class="login_font">PASS</span> <input type="text"
						class="user_id_pass" name="password" placeholder="비밀번호를 입력해주세요">
					<input type="submit" class="login_btn" value="login">
				</form>
			</div>

		</div>

		<script src="js/header.js"></script>

	</body>
</th:block>
</html>