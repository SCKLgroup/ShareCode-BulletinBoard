<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>shareCode</title>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

	<link rel="stylesheet" href="css/writing.css" type="text/css">
	<link rel="stylesheet" href="css/comments.css" type="text/css">
</head>
<body>

	<jsp:include page="header.jsp"/>
	
	<div class="main-content">
		<div class="write-content">
			<div class="post-title">
				<h2><c:out value="${postInfo.post_title}"></c:out></h2>
			</div>
			
			
			<div class="form-row">
				<div class="section">
					<span class="title post">카테고리</span> 
					${postInfo.post_category}
				</div>
				<div class="section">
					<span class="title post">조회수</span>
					${postInfo.post_hit}
				</div>
			</div>
			
			<div class="form-row">
				<div class="section">
					<span class="title post">작성자</span> 
					<c:out value="${postInfo.user_id}"></c:out>
				</div>
				<div class="section">
					<span class="title post">작성일</span>
					${postInfo.post_date}
				</div>
			</div>
			
			<div class="title-border"></div>
		
			
			<div class="form-row post-content">
				<c:out value="${postInfo.post_content}"></c:out>
			</div>
			
						<button class="write-btn" type="button" onclick="location.href='postModifyInfo.do?post_no=${postInfo.post_no}'">수정</button>
						<button class="write-btn" type="button" onclick="location.href='postDelete.do?post_no=${postInfo.post_no}'">삭제</button>
			
			<c:catch>
				<c:choose>
					<c:when test="${postInfo.user_no eq member.user_no}">
					</c:when>
				</c:choose>
			</c:catch>
		
		</div>
	</div>
	
<div class="main-reply">
	<div class="panel">
	  <div class="panel-body">
	  	<c:choose>
			<c:when test="${member.user_no eq null}">
				<textarea class="form-control" name="com_content" id="replyArea" rows="2" placeholder="로그인이 필요합니다" disabled></textarea>
			</c:when>
			<c:otherwise>
				<form action="#" id="commentsForm" name="commentsForm" method="post">
					<input type="hidden" name="post_no" value="${postInfo.post_no}">
					<input type="hidden" name="user_no" value="${member.user_no}">
					<input type="hidden" name="com_job" value="0">
				    <textarea class="form-control" name="com_content" id="replyArea" rows="2" placeholder="댓글을 작성하세요"></textarea>
	      			<button class="write-btn reply-btn" id="commentbtn" type="submit">등록</button>
				</form>
			</c:otherwise>
		</c:choose>
	    <div class="mar-top">
	    </div>
	  </div>
	</div>

	<div class="panel">
	    <div class="panel-body">
	    <div class="media-block">
	      <a class="media-left" href="#"><img class="img-circle img-sm" alt="Profile Picture" src="https://bootdey.com/img/Content/avatar/avatar1.png"></a>
	      <div class="media-body">
	        <div class="mar-btm">
	          <a href="#" class="btn-link text-semibold media-heading box-inline">작성자</a>
	          <p class="text-muted text-sm">2022.02.02</p>
	        </div>
	        <p>댓글 작성 내용 </p>
	        <div class="pad-ver">
	          <a class="btn btn-sm" href="#">답글</a>
	        </div>
	        <hr>
	        
	        <div>여기 !</div>
	        
	        <div id="replyShow"></div> 
	   <!-- 
	          <div class="media-block">
	            <a class="media-left" href="#"><img class="img-circle img-sm" alt="Profile Picture" src="https://bootdey.com/img/Content/avatar/avatar2.png"></a>
	            <div class="media-body">
	              <div class="mar-btm">
	                <a href="#" class="btn-link text-semibold media-heading box-inline">답글작성자</a>
					  <p class="text-muted text-sm">2022.02.02</p>
				  </div>
				  <p>댓글 작성 내용 </p>
				  <div class="pad-ver">
				 	 <a class="btn btn-sm" href="#">답글</a>
	          	  </div>
	            </div>
	          </div>
	          <hr> -->
	        </div>
	      </div>
	    </div>
	  </div>
	</div>


<script type="text/javascript">
	commentsAjax('/web/commentsList.do',{"post_no":${postInfo.post_no}},'json');
	
	function commentsAjax(url,data,dataType){
		 $.ajax({
	          url:url,
	          type:'POST',
	          data:data,
	          dataType:dataType,              
	          success:function(v){
	        	 commentsListfunc(v);
	          },
	          error:function(e){
	             alert('error'+e);
	          }
	       });   
	}
	
   function commentsListfunc(v){
	      var temp="";
	       $.each(v.commentsList,function(index,dom){
	    		temp+="<div class=\"media-block\">";
	    		temp+="<a class=\"media-left\" href=\"#\"><img class=\"img-circle img-sm\" alt=\"Profile Picture\" src=\"https://bootdey.com/img/Content/avatar/avatar2.png\"></a>";
	    		temp+="<div class=\"media-body\">";
	    		temp+="<div class=\"mar-btm\">";
	    		temp+="<a href=\"#\" class=\"btn-link text-semibold media-heading box-inline\">"+dom.user_id+"</a>";
	   			temp+="<p class=\"text-muted text-sm\">"+dom.com_date+"</p>";
	   			temp+="</div>";
  				temp+="<p>"+dom.com_content+"</p>";
    			temp+="<div class=\"pad-ver\">";
	    		temp+="<a class=\"btn btn-sm\" href=\"#\">답글</a>";
	    		temp+="</div></div></div><hr>";
	       });
	       $("div#replyShow").html(temp);
	       $("textarea#replyArea").val('');
	   }
	
	$(function(){
 		$("button#commentbtn").click(function(){
 			commentsAjax('${pageContext.request.contextPath}/comments.do',$("form#commentsForm").serialize(),'json');
 	    }); 
	});
	
</script>
</body>
</html>