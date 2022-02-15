package sharecode.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@ResponseBody
	@RequestMapping(value="mainPageCategory.do") //메인페이지 카테고리
	public List<PostVO> mainCategoryAjax(String category) {
		return dao.selectPost(category);
	}
	
	@RequestMapping(value = "/shareCode/list.do") //리스트 카테고리 띄우기
	public String mainlistAction(Model model) {
	
		model.addAttribute("selectLang", dao.selectLangCategory("Java"));

		return "shareCode/list";
	}
	
}
