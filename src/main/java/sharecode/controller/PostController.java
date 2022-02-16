package sharecode.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import sharecode.service.PostService;
import sharecode.vo.PostVO;

@Controller
public class PostController {

	@Autowired
	PostService postService;
	
	@RequestMapping(value = "shareCode/post.do")
	public String postInsertAction(PostVO vo) {
		postService.postInsertAction(vo);
		
		return "/shareCode/list";
	}
	
	@RequestMapping(value = "shareCode/postInfo.do")
	public String postInfoSelect(int post_no, Model model) {
		model.addAttribute("postInfo",postService.postInfoSelect(post_no));
		
		return "/shareCode/post-detail";
	}
	
	
	@RequestMapping(value = "shareCode/postModifyInfo.do")
	public String postModifyInfoSelect(int post_no, Model model) {
		model.addAttribute("postInfo",postService.postInfoSelect(post_no));
		
		return "/shareCode/post-modify";
	}
	
	@RequestMapping(value = "shareCode/postModify.do")
	public String postInfoUpdate(PostVO vo,RedirectAttributes redirect) {
		postService.postInfoUpdate(vo);
		redirect.addAttribute("post_no",vo.getPost_no());
		
		return "redirect:/shareCode/postInfo.do";
	}
}
