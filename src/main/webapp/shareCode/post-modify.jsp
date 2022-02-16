<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ShareCode</title>
<link rel="stylesheet" href="css/writing.css" type="text/css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"/>
	
	<div class="main-content">
		<div class="write-content">
			<div class="write-title">
				<h2>글 수정</h2>
			</div>
			
			<form method="post" action="postModify.do?post_no=${postInfo.post_no}">
				<input hidden="hidden" value="1" name="user_no"/>
				<div class="form-row">
					<span class="title writing">카테고리</span>
					<select name="post_category" id="post_category">
						<option value="Java">Java</option>
						<option value="Python">Python</option>
						<option value="C++">C++</option>
						<option value="C#">C#</option>
					</select>
				</div>
				
				<div class="form-row">
					<span class="title writing">제&emsp;&ensp;&nbsp;목</span> 
					<input type="text" name="post_title" class="write" value="<c:out value="${postInfo.post_title}"></c:out>"/>
				</div>
				
				<div class="form-row">
					<span class="title writing title-content">내&emsp;&ensp;&nbsp;용</span>
					<textarea name="content" class="write"><c:out value="${postInfo.post_content}"></c:out></textarea>
					<span style=display:none><textarea name="post_content"></textarea></span>
				</div>
				
			</form>

			<button class="write-btn" type="button" onclick="location.href='postInfo.do?post_no=${postInfo.post_no}'">취소</button>
			<button class="write-btn" type="button" id="btn-submit">수정</button>
		</div>
	</div>
	
<script type="text/javascript">

	$("button#btn-submit").click(function(){ //확인 버튼 클릭 시
		var title=$("input[name='post_title']").val();
		
		if(title.replace(/\s/g,'').length==0){
			alert('제목을 입력하세요')
			return false;
		}
		var content=$("textarea[name='content']").val();
		if(content.replace(/\s/g,'').length==0){
			alert('내용을 입력하세요')
			return false;
		}
		
		$("textarea[name='post_content']").val(content.replace(/(?:\r\n|\r|\n)/gm, '<br />'));
		//content = str.replace(/\\r\\n|\\n|\\r/gm,"<br>")		

		$("form").submit();
	});
	
	$("#post_category").val("${postInfo.post_category}").prop("selected", true); 
	
	
</script>
</body>


</html>