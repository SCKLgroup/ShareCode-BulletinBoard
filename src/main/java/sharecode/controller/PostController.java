package sharecode.controller;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import sharecode.service.CommentsService;
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
	
	@RequestMapping(value = "shareCode/postDelete.do")
	public String postDelete(int post_no) {
		postService.postDelete(post_no);
		
		return "redirect:/shareCode/list.jsp";
	}
	
	@RequestMapping(value = "shareCode/postModify.do")
	public String postInfoUpdate(PostVO vo,RedirectAttributes redirect) {
		postService.postInfoUpdate(vo);
		redirect.addAttribute("post_no",vo.getPost_no());
		
		return "redirect:/shareCode/postInfo.do";
	}
	
	/*
	 * @RequestMapping(value = "shareCode/list.do") public String
	 * mainlistAction(Model model,String category) {
	 * 
	 * model.addAttribute("selectLang", postService.listAction("C++"));
	 * System.out.println(model.addAttribute("selectLang",
	 * postService.listAction("Java"))); System.out.println("포스트컨트롤러의 메인리스트 실행");
	 * 
	 * return "/shareCode/list"; }
	 */
	
	@RequestMapping(value="shareCode/list.do", method = RequestMethod.GET) // 관리자 페이지에서 상품 뿌리기  
	@ResponseBody
	public Map<String, Object> ajaxListAction(String job) {
		if (job == null) {
			job = "all";
		}
		System.out.println(job);
		HashMap<String, Object> jobs=new HashMap<String, Object>();
		jobs.put("job", job);
		Map<String, Object> map=new HashMap<String, Object>();
		if(!job.equals("all")) {
			map.put("slang", postService.ajaxlistAction(jobs));
			return map;
		}  else {
			map.put("slang", postService.ajaxalllistAction(jobs));
			return map;
		}
	}
}