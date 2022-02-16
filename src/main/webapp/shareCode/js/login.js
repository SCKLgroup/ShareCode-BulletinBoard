$(function() {
	$("#btnLogin").click(function() {
		USER_ID = $("#USER_ID").val();
		var USER_PW = $("#USER_PW").val();
		if (USER_ID == "") {
			alert("아이디를 입력하세요");
			$("#USER_ID").focus(); // 입력포커스 이동

			return; // 함수 종료
		}
		if (USER_PW == "") {
			alert("비밀번호를 입력하세요");
			$("#USER_PW").focus();
			return;
		}
//		// 폼 내부의 데이터를 전송할 주소
		
		 var form = document.getElementById("homeForm");
		 form.action= "login.do";
		 form.submit(); //제출
		 
	});
	
	// logout btn
	$("#logoutBtn").on("click", function(){
		location.href="logout.do";
	});
	
});