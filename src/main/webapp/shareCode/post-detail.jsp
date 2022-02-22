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
				<textarea class="form-control" name="com_content" placeholder="로그인이 필요합니다" disabled></textarea>
			</c:when>
			<c:otherwise>
				<form action="#" id="commentsForm" name="commentsForm" method="post">
					<input type="hidden" name="post_no" value="${postInfo.post_no}">
					<input type="hidden" name="user_no" value="${member.user_no}">
					<input type="hidden" name="com_job" value="0">
				    <textarea class="form-control" name="com_content" id="commentsArea" placeholder="댓글을 작성하세요"></textarea>
	      			<button type="button" class="write-btn reply-btn" id="commentsReg">등록</button>
				</form>
			</c:otherwise>
		</c:choose>
	  </div>
	</div>

	<div class="panel">
 		<div>
      		<div id="commentsShow"></div> <!-- 댓글 구역 -->
     	</div>
   </div>
</div>


<script type="text/javascript">
	commentsAjax('/web/commentsList.do',{"post_no":${postInfo.post_no}},'json'); //ajax로 바로 댓글 리스트 출력
	
	$("button#commentsReg").click(function(){ //댓글 작성 완료
		var com=$("textarea#commentsArea").val();
	
		if(com.replace(/\s/g,'').length==0){
			alert('댓글을 작성하세요')
			return false;
		}
		commentsAjax('${pageContext.request.contextPath}/commentsReg.do',$("form#commentsForm").serialize(),'json');
    }); 
	
	function commentsAjax(url,data,dataType){
		 $.ajax({
	          url:url,
	          type:'POST',
	          data:data,
	          dataType:dataType,              
	          success:function(v){
	        	 commentsListHtml(v);
	          },
	          error:function(e){
	             alert('error'+e);
	          }
	       });   
	}
	
   function commentsListHtml(v){ //댓글 Html
	      var nowUserNo=$("input[name=user_no]").val();
	      
	      var temp="";
	       $.each(v,function(index,dom){
	    	  	temp+="<div id='commentsLoc"+dom.com_no+"'>";
	    	  
	    		if (dom.com_job==0){ //댓글(0) 답글(1) 여부 확인
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
    			
    			if (dom.com_del==0){ //삭제된 댓글인지 확인
		    		temp+="<button type=\"button\" class=\"reply-write\"onclick=\"replyWriteForm("+dom.com_no+","+dom.com_pnum+",'"+dom.user_id+"');\">답글</button>";
					if (dom.user_no==nowUserNo){ //댓글 작성자와 현재 사용자의 user_no가 같을 경우
						temp+="<button type=\"button\" class=\"reply-write\" onclick=\"commentsDelete("+dom.com_no+");\">삭제</button>";
						temp+="<button type=\"button\" class=\"reply-write\" onclick=\"commentsModifyForm("+dom.com_no+",'"+dom.com_content+"');\">수정</button>";
		    		} 
    			}
    			
	    		temp+="</div></div><hr></div>";
	    		temp+="<div id='replyShow"+dom.com_no+"'></div>";
	       });
	       
	       $("div#commentsShow").html(temp);
	       $("textarea#commentsArea").val('');
	   }
	
	function replyWriteForm(comNo, pnumNo, userID){ //답글 작성 칸 생성
		replyWriteFormClose();

		var temp="";
		temp+=" <div class=\"panel-body\" id=\"replyArea\">";
		temp+="	<form action=\"#\" id=\"replyForm\" name=\"replyForm\" method=\"post\">";
		temp+="	<input type=\"hidden\" name=\"post_no\" value=\"${postInfo.post_no}\">";
		temp+="	<input type=\"hidden\" name=\"user_no\" value=\"${member.user_no}\">";
		temp+="	<input type=\"hidden\" name=\"com_pnum\" value=\""+pnumNo+"\">";
		temp+="	<input type=\"hidden\" name=\"com_job\" value=\"1\">";
		temp+=" <textarea class=\"form-control\" name=\"com_content\">@"+userID+" </textarea>";
		temp+="	<button type=\"button\" class=\"write-btn reply-btn\" onclick=\"replyReg();\">등록</button>";
		temp+="	<button type=\"button\" class=\"write-btn reply-btn\" onclick=\"replyWriteFormClose();\">취소</button>";
		temp+=" </form><hr></div>";
		
		$('div#replyShow'+comNo).html(temp);
	}	
	
	function replyWriteFormClose(){ //답글 작성 취소 시 답글 칸 삭제
		$('div#replyArea').remove();
	}
	

	function commentsDelete(comNo){ //댓글 삭제
 		commentsAjax('${pageContext.request.contextPath}/commentsDelete.do',{"com_no":comNo, "post_no":${postInfo.post_no}},'json');
	}

	function replyReg(){ //답글 작성 완료
		commentsAjax('${pageContext.request.contextPath}/commentsReg.do',$("form#replyForm").serialize(),'json');
	}
	
	
	var beforeComNo=0; //사용자가 기존에 수정하고 있던 댓글 번호 저장
	function commentsModifyForm(comNo,comCon){
		modifyFormClose(comNo); 
		
 		var temp="";
		temp+=" <div class=\"panel-body\" id=\"modifyForm\">";
		temp+="	<form action=\"#\" id=\"modifyForm\" name=\"modifyForm\" method=\"post\">";
		temp+="	<input type=\"hidden\" name=\"post_no\" value=\"${postInfo.post_no}\">";
		temp+="	<input type=\"hidden\" name=\"com_no\" value=\""+comNo+"\">";
		temp+=" <textarea class=\"form-control\" name=\"com_content\" id=\"replyArea\">"+comCon+"</textarea>";
		temp+="	<button type=\"button\" class=\"write-btn reply-btn\" onclick=\"commentsModify();\">수정</button>";
		temp+="	<button type=\"button\" class=\"write-btn reply-btn\" onclick=\"modifyFormClose();\">취소</button>";
		temp+=" </form><hr></div>";
		
		$('div#replyShow'+comNo).append(temp);
		beforeComNo=comNo;
	}
	
	function modifyFormClose(comNo){ //수정 취소 시 댓글 수정 칸 삭제
		$('div#commentsLoc'+comNo).hide(); //현재 댓글 숨기기
		$('div#commentsLoc'+beforeComNo).show(); //그전에 수정중이던 댓글 다시 보이기
		$('div#replyShow'+beforeComNo).empty(); //그전에 수정칸 삭제 
	}

	function commentsModify(){ //댓글 수정 완료
 		commentsAjax('${pageContext.request.contextPath}/commentsModify.do',$("form#modifyForm").serialize(),'json');
	}
	
</script>
</body>
</html>