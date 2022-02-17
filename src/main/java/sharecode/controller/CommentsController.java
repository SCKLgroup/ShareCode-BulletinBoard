package sharecode.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import sharecode.service.CommentsService;
import sharecode.vo.CommentsVO;

@Controller
public class CommentsController {

	@Autowired
	CommentsService service;

	@RequestMapping(value="comments.do")
	@ResponseBody
	public HashMap<String, Object> commentsInsert(CommentsVO vo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		service.commentsInsert(vo);
		map.put("commentsList", service.commentsList(vo.getPost_no()));
		
		return map;
	}
	
	// 댓글 리스트 출력 
	@RequestMapping(value = "commentsList.do")
	@ResponseBody
	public HashMap<String, Object> commentsList(int post_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("commentsList", service.commentsList(post_no));
		return map;
	}
}
