<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<<<<<<< HEAD
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div>
		<form method="post" action="signup.do">
			<div>
				<div>
					아이디 :
					<input type="text" name="USER_ID" id="USER_ID" placeholder="아이디 입력하세요">
				</div>
				<div>
					비밀번호 :
					<input type="password" name="USER_PW" id="USER_PW" placeholder="4~20자의 영문 소문자와 숫자 조합">
				</div>

				<div>
					이메일 :
					<input type="text" name="USER_MAIL" id="USER_MAIL" placeholder="이메일 입력하세요">
					<button type="submit">보내기</button>
				</div>

				<div>
					코드입력 :
					<input type="text">
					<button type="submit">인증</button>
				</div>
			</div>
			<div class="form-submit">
				<button type="submit" id="join">가입하기</button>
			</div>
		</form>
	</div>


</body>


<!-- script -->

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("button#join").click(function(){
			$("form").submit();
		});
=======
<meta charset="EUC-KR">
<title>Insert title here</title>

</head>
<body>

	<div>
		<div>
			아이디 :
			<input type="text">
		</div>
		<div>
			비밀번호 :
			<input type="text">
		</div>

		<div>
			이메일 :
			<input type="text">
			<button type="submit">보내기</button>
		</div>
		<div>
			코드입력 :
			<input type="text">
			<button type="submit">인증</button>
		</div>


	</div>
	
	<div>

		<button type="submit">가입하기</button>

	</div>







</body>


<!-- script -->

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
>>>>>>> branch 'master' of https://github.com/shareCodeProject/shareCode.git

	});
</script>


</html>