package sharecode.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import sharecode.dao.PostDao;
import sharecode.vo.PostVO;

@Controller
public class PostController {
	@Autowired
	private PostDao dao;
	
	@RequestMapping(value = "shareCode/post.do")
	public String postInsertAction(PostVO vo) {
		dao.insertPost(vo);
		
		
		
		return "/shareCode/list";
	}
	
}
