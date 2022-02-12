<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/signup.css" type="text/css">

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


				<div class="mail_wrap">
					<div class="mail_name">이메일</div>
					<div class="mail_input_box">
						<input type="email" class="mail_input" name="USER_MAIL" placeholder="이메일 입력하세요">
					</div>

					<div class="mail_check_wrap">
						<div class="mail_check_input_box" id="mail_check_input_box_false">
							<input class="mail_check_input" disabled="disabled">
						</div>

						<div class="mail_check_button">
							<span>인증번호 전송</span>
						</div>
						<div class="clearfix"></div>
						<span id="mail_check_input_box_warn"></span>
					</div>
				</div>


			</div>
			<div class="form-submit">
				<button type="submit" id="join">가입하기</button>
			</div>
		</form>
	</div>


</body>

<!-- 컨트롤러 추가해야함 -->
<!-- script -->

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("button#join").click(function() {
			$("form").submit();
		});

		/* 인증번호 이메일 전송 */
		var code = "";

		$(".mail_check_button").click(function() {
			alert('눌림');
			var email = $(".mail_input").val(); // 입력한 이메일
			var cehckBox = $(".mail_check_input"); // 인증번호 입력란
			var boxWrap = $(".mail_check_input_box"); // 인증번호 입력란 박스

			$.ajax({
				type : "GET",
				url : "/webProject/shareCode/mailCheck.do?email=" + email,
				success : function(data) {
					//console.log("data:"+data)
					cehckBox.attr("disabled", false);
					boxWrap.attr("id", "mail_check_input_box_true");
					code = data;
				}

			});

		});

		/* 인증번호 비교 */
		$(".mail_check_input").blur(function() {
			var inputCode = $(".mail_check_input").val(); // 입력코드    
			var checkResult = $("#mail_check_input_box_warn"); // 비교 결과 
			
			if(inputCode == code){                            // 일치할 경우
		        checkResult.html("인증번호가 일치합니다.");
		        checkResult.attr("class", "correct");        
		    } else {                                            // 일치하지 않을 경우
		        checkResult.html("인증번호를 다시 확인해주세요.");
		        checkResult.attr("class", "incorrect");
		    }    

		});

	});
</script>


</html>