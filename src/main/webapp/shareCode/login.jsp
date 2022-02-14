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
</head>

<body>
	<div id="my_login_modal">
		<div id="my_modal">
			<div>
				<h1 class="login_title">LOGIN</h1>
				<from name="from1" method="post"> <a class="modal_close_btn">ⅹ</a>
				<span class="login_font">ID <input type="text" name="user_id"
					id="user_id" class="user_id_pass" placeholder="아이디를 입력해주세요"><br>
				</span> <br>
				<span class="login_font">PASS</span> <input type="text"
					class="user_id_pass" name="password" id="password"
					placeholder="비밀번호를 입력해주세요">
				<button type="button" class="login_btn" id="btnlogin">login</button>
				<c:if test="${message == 'error' }">
					<div style="color: red;">아이디 또는 비밀번호가 일치하지 않습니다.</div>
				</c:if> <c:if test="${message == 'logout' }">
					<div style="color: red;">로그아웃되었습니다.</div>
				</c:if> </from>
			</div>

		</div>
	</div>
	<script src="js/login.js"></script>
</body>
</html>