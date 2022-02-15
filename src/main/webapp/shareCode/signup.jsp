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
					<input type="text" name="user_id" id="user_id" placeholder="아이디 입력하세요">
					<button class="btn-css" type="button" id="duplCheck">중복확인</button>
					<div class="validCheck" id="validId"></div>
				</div>
				<div>
					비밀번호 :
					<input type="password" name="user_pw" id="user_pw" placeholder="4~20자의 영문 소문자와 숫자 조합">

					비밀번호 확인 :
					<input type="password" id="pwCheck">

					<div class="validCheck" id="validPwCheck"></div>
				</div>


				<div class="mail_wrap">
					<div class="mail_name">이메일</div>
					<div class="mail_input_box">
						<input type="email" class="mail_input" name="user_mail" placeholder="이메일 입력하세요">
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
				<button type="button" id="join">가입하기</button>
			</div>
		</form>
	</div>


</body>

<!-- 컨트롤러 추가해야함 -->
<!-- script -->

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {

		/* 인증번호 이메일 전송 */
		var code = "";
		var checkMail = "";
		var checkId = "";
		var checkPw = "";

		$(".mail_check_button").click(function() {
			if (confirm("입력하신 이메일에 인증번호를 전송하시겠습니까?") == true) {
				var email = $(".mail_input").val(); // 입력한 이메일
				var cehckBox = $(".mail_check_input"); // 인증번호 입력란
				var boxWrap = $(".mail_check_input_box"); // 인증번호 입력란 박스

				$.ajax({
					type : "GET",
					url : "/web/shareCode/mailCheck.do?email=" + email,
					success : function(data) {
						//console.log("data:"+data)
						cehckBox.attr("disabled", false);
						boxWrap.attr("id", "mail_check_input_box_true");
						code = data;
					}

				});
			}

		});

		/* 인증번호 비교 */
		$(".mail_check_input").blur(function() {
			var inputCode = $(".mail_check_input").val(); // 입력코드    
			var checkResult = $("#mail_check_input_box_warn"); // 비교 결과 
			console.log(checkResult);

			if (inputCode == code) { // 일치할 경우
				checkResult.html("인증번호가 일치합니다.");
				checkResult.attr("class", "correct");
				checkMail = "correct";
				console.log(check);

			} else { // 일치하지 않을 경우
				checkResult.html("인증번호를 다시 확인해주세요.");
				checkResult.attr("class", "incorrect");
				checkMail = "incorrect";
				console.log(checkMail);

			}

		});
		
		
		/* 회원가입  */
		$("button#join").click(function() {
			if (confirm("정말 가입하시겠습니까?") == true) {
				if (checkMail == "correct" && checkPw == "correct" && checkId == "correct") {
					$("form").submit();
				} else if (checkMail == "incorrect"){
					alert('인증번호를 확인해주세요.');
				} else if (checkPw == "incorrect"){
					alert('비밀번호를 확인해주세요.');
				} else if (checkId == "incorrect"){
					alert('아이디 중복체크를 확인해주세요.');
				} 
			}
		});
		
		/* 아이디 유효성 검사 */
		
		var idval; //아이디 유효성 여부 체크
			$("input[name='user_id']").blur(function(){ //아이디 유효성 검사
				var idRegExp = /^[a-z0-9]{6,20}$/; //6~20자 영문소문자, 숫자 사용가능
				idval=0;
				if(!idRegExp.test($(this).val())){ //아이디가 유효하지 않을 때
					idval+=1;  
					$("div#validId").text("6~20자의 영문 소문자와 숫자만 가능합니다");
					$(this).val('');            
		            return false;
				}
				$("div#validId").text("");
		    });
		
		var dup;
		$("button#duplCheck").click(function(){ //중복 체크
			if(idval==0){
				dup+=1;
				$.ajax({
			          url:'/web/shareCode/idCheck.do',
			          type:'GET',
			          data: {"user_id":$("#user_id").val()},
			          dataType:'json',              
			          success:function(v){
			            if(v=="1"){ //중복 아이디 존재 
							$("div#validId").text("중복된 아이디가 존재합니다");
							$("input#user_id").val('');
							checkId= "incorrect";
							return false;
			            }else {
							$("div#validId").text("사용 가능한 아이디입니다");
							checkId = "correct";
			            }
			          },
			          error:function(e){
			             alert('error'+e);
			          }
			    });
			}
		});
	
		$("input[name='user_id']").click(function(){ //아이디 재입력시 중복체크 다시 0으로 리셋
			dup=0;
		});
		
		
		/* 비밀번호 유효성 검사 */
		$("input#pwCheck").blur(function(){ //비밀번호 확인 유효성 검사 
	        if($("input#user_pw").val()!=$("input#pwCheck").val()){
				$("div#validPwCheck").text("비밀번호가 일치하지 않습니다");
	        	$(this).val('');
	        	checkPw ="incorrect";
	        	return false;

	       	}
	        else if($("input#user_pw").val()==$("input#pwCheck").val()){
				$("div#validPwCheck").text("비밀번호가 일치합니다");
				checkPw = "correct";
	        	return true;
	       	}
	   	});

	});
</script>


</html>