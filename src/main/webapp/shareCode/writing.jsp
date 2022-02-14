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
				<h2>새 글 작성</h2>
			</div>
			
			<form method="post" action="post.do" onsubmit="return false;">
			
				<div class="form-row">
					<span class="title">카테고리</span>
					<select name="post_category" id="post_category">
						<option value="Java">Java</option>
						<option value="Python">Python</option>
						<option value="C++">C++</option>
						<option value="C#">C#</option>
					</select>
				</div>
				
				<div class="form-row">
					<span class="title">제&emsp;&ensp;&nbsp;목</span> 
					<input type="text" placeholder="제목을 작성하세요" name="post_title" class="write"/>
				</div>
				
				<div class="form-row">
					<span class="title title-content">내&emsp;&ensp;&nbsp;용</span>
					<textarea placeholder="글을 작성하세요" name="content" class="write"></textarea>
					<span style=display:none><textarea name="post_content"></textarea></span>
				</div>
				
			</form>

			<button class="write-btn" type="button" onclick="location.href='list.jsp'">취소</button>
			<button class="write-btn" type="button" id="btn-submit">확인</button>
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


</script>
</body>


</html>