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
<link rel="stylesheet" href="css/login.css" type="text/css">
</head>


<body>

	<script src="js/login.js"></script>
	<div id="my_login_modal">
		<div id="my_modal">
			<div>
				<h1 class="login_title">LOGIN</h1>
				<a class="modal_close_btn">ⅹ</a>
				<form name="homeForm" method="post" id="homeForm">
					<c:if test="${member == null}">
						<span class="login_font">ID <input type="text"
							name="USER_ID" id="USER_ID" class="user_id_pass"
							placeholder="아이디를 입력해주세요"> <br>
						</span>
						<br>
						<span class="login_font">PASS</span>
						<input type="password" class="user_id_pass" name="USER_PW"
							id="USER_PW" placeholder="비밀번호를 입력해주세요">
						<button type="button" class="login_btn" id="btnLogin">login</button>
					</c:if>
					<c:if test="${msg == false }">
						<p style="color: red;">로그인 실패 : 아이디와 비밀번호를 확인해주세요.</p>
					
					</c:if>
					

				</form>
			</div>

		</div>
	</div>

</body>
</html>