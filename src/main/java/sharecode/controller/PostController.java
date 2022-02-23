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
		model.addAttribute("postInfo", postService.postInfoSelect(post_no));

		return "/shareCode/post-detail";
	}

	@RequestMapping(value = "shareCode/postModifyInfo.do")
	public String postModifyInfoSelect(int post_no, Model model) {
		model.addAttribute("postInfo", postService.postInfoSelect(post_no));

		return "/shareCode/post-modify";
	}

	@RequestMapping(value = "shareCode/postDelete.do")
	public String postDelete(int post_no) {
		postService.postDelete(post_no);

		return "redirect:/shareCode/list.jsp";
	}

	@RequestMapping(value = "shareCode/postModify.do")
	public String postInfoUpdate(PostVO vo, RedirectAttributes redirect) {
		postService.postInfoUpdate(vo);
		redirect.addAttribute("post_no", vo.getPost_no());

		return "redirect:/shareCode/postInfo.do";
	}

	@RequestMapping(value = "shareCode/list.do")
	public String mainlistAction(Model model, String category,int page) {
		System.out.println(category);
		if (category.equals("all")) {
			model.addAttribute("selectLang", postService.alllistAction());
		} else {
			model.addAttribute("selectLang", postService.listAction(category));
		}
//		System.out.println(model.addAttribute("selectLang", postService.listAction("Java")));
		System.out.println("포스트컨트롤러의 메인리스트 실행");
		if (category.equals("C++")) {
			category="C%2B%2B";
		}
		model.addAttribute("category",category);

		return "/shareCode/list";
	}

}