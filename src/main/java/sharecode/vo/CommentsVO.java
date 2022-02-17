package sharecode.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentsVO {
	private int com_no; //댓글 번호
	private int post_no; //게시글 번호
	private int user_no; //회원 번호 
	private String com_content; //댓글 내용 
	private int com_pnum; //상위 댓글 번호 
	private int com_step; //댓글 정렬 순서 
	private int com_lev; //그룹 내 단계(들여쓰기 단계)  
	private int com_ref; //그룹 번호 
	private int com_reply; //답글 수 
	private int com_job; //댓글(0) 답글(1) 여부 
	private String com_date; //댓글 작성일 
	private String user_id;
}