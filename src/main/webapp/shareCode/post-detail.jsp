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
				${postInfo.post_content}
			</div>
			
			<c:catch>
				<c:choose>
					<c:when test="${postInfo.user_no eq member.user_no}">
						<button class="write-btn" type="button" onclick="location.href='postModifyInfo.do?post_no=${postInfo.post_no}'">수정</button>
						<button class="write-btn" type="button" onclick="location.href='postDelete.do?post_no=${postInfo.post_no}'">삭제</button>
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
	      			<button type="button" class="write-btn reply-btn" id="commentbtn">등록</button>
				</form>
			</c:otherwise>
		</c:choose>
	  </div>
	</div>

	<div class="panel">
	    <div>
	        <div id="replyShow"></div> 
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
	      var no=$("input[name=user_no]").val();
	      
	       $.each(v,function(index,dom){
	    		if (dom.com_job==0){
	    			temp+="<div class=\"media-body\">";
	    		}else{
	    			temp+="<div class=\"media-body reply-block\">";
	    		}
	    		temp+="<div class=\"mar-btm\">";
	    		temp+="<div class=\"comment-writer\">"+dom.user_id+"</div>";
	   			temp+="<div class=\"text-muted text-sm\">"+dom.com_date+"</div>";
	   			temp+="</div>";
  				temp+="<p>"+dom.com_content+"</p>";
    			temp+="<div class=\"pad-ver\">";
    			if (dom.com_del==0){
		    		temp+="<button type=\"button\" class=\"reply-write\"onclick=\"replyWriteForm("+dom.com_no+","+dom.com_pnum+",'"+dom.user_id+"');\">답글</button>";
    				
					if (dom.user_no==no){
						temp+="<button type=\"button\" class=\"reply-write\"onclick=\"commentDelete("+dom.com_no+");\">삭제</button>";
						temp+="<button type=\"button\" class=\"reply-write\"onclick=\"commentsModify("+dom.com_no+");\">수정</button>";
		    		} 
    			}
	    		temp+="</div></div><hr><div id='replyWriteShow"+dom.com_no+"'></div> ";
	       });
	       $("div#replyShow").html(temp);
	       $("textarea#replyArea").val('');
	   }
	
	$(function(){
 		$("button#commentbtn").click(function(){
 			commentsAjax('${pageContext.request.contextPath}/comments.do',$("form#commentsForm").serialize(),'json');
 	    }); 
	});
	

	function commentDelete(comNo){
 		commentsAjax('${pageContext.request.contextPath}/commentsDelete.do',{"com_no":comNo, "post_no":${postInfo.post_no}},'json');
	}
	function commentsModify(comNo){
 		commentsAjax('${pageContext.request.contextPath}/commentsModify.do',{"com_no":comNo, "post_no":${postInfo.post_no}},'json');
	}
	
	function replyWriteForm(comNo, pnumNo, userID){ //답글 작성 칸 생성
		replyWriteFormClose();
		var temp="";
		temp+=" <div class=\"panel-body\">";
		temp+="	<form action=\"#\" id=\"replyForm\" name=\"replyForm\" method=\"post\">";
		temp+="	<input type=\"hidden\" name=\"post_no\" value=\"${postInfo.post_no}\">";
		temp+="	<input type=\"hidden\" name=\"user_no\" value=\"${member.user_no}\">";
		temp+="	<input type=\"hidden\" name=\"com_pnum\" value=\""+pnumNo+"\">";
		temp+="	<input type=\"hidden\" name=\"com_job\" value=\"1\">";
		temp+=" <textarea class=\"form-control\" name=\"com_content\" id=\"replyArea\" rows=\"2\">@"+userID+" </textarea>";
		temp+="	<button type=\"button\" class=\"write-btn reply-btn\" onclick=\"replyWriteAction();\">등록</button>";
		temp+="	<button type=\"button\" class=\"write-btn reply-btn\" onclick=\"replyWriteFormClose();\">취소</button>";
		temp+=" </form></div><hr>";
		var show="replyWriteShow"+comNo;
		$('div#'+show).html(temp);
	}	
	
	function replyWriteAction(){
		commentsAjax('${pageContext.request.contextPath}/comments.do',$("form#replyForm").serialize(),'json');
	}
	
	function replyWriteFormClose(){
		$('div#replyWriteShow').remove();
	}
	
	function replyWriteForm(comNo, pnumNo, userID){ //답글 작성 칸 생성
		replyWriteFormClose();
		var temp="";
		temp+=" <div class=\"panel-body\">";
		temp+="	<form action=\"#\" id=\"replyForm\" name=\"replyForm\" method=\"post\">";
		temp+="	<input type=\"hidden\" name=\"post_no\" value=\"${postInfo.post_no}\">";
		temp+="	<input type=\"hidden\" name=\"user_no\" value=\"${member.user_no}\">";
		temp+="	<input type=\"hidden\" name=\"com_pnum\" value=\""+pnumNo+"\">";
		temp+="	<input type=\"hidden\" name=\"com_job\" value=\"1\">";
		temp+=" <textarea class=\"form-control\" name=\"com_content\" id=\"replyArea\" rows=\"2\">@"+userID+" </textarea>";
		temp+="	<button type=\"button\" class=\"write-btn reply-btn\" onclick=\"replyWriteAction();\">등록</button>";
		temp+="	<button type=\"button\" class=\"write-btn reply-btn\" onclick=\"replyWriteFormClose();\">취소</button>";
		temp+=" </form></div><hr>";
		var show="replyWriteShow"+comNo;
		$('div#'+show).html(temp);
	}
	
	
	
</script>
</body>
</html>