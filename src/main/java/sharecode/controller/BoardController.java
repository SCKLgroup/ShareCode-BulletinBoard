package sharecode.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import sharecode.service.BoardService;
import sharecode.service.PostService;
import sharecode.vo.PagingVO;
import sharecode.vo.PostVO;

@Controller
public class BoardController {
	
	@Inject BoardService boardService;
	

	@Autowired
	PostService postService;

	@RequestMapping("shareCode/board.do")
	public ModelAndView board(@RequestParam(defaultValue = "post_title") String searchOption,
			@RequestParam(defaultValue = "") String keyword) throws Exception {
		System.out.println("보드컨트롤러 도착?");
		List<PostVO> board = boardService.boardAll(searchOption, keyword);

		int count = boardService.countArticle(searchOption,keyword);
		
		ModelAndView mav = new ModelAndView();
		
		Map<String,Object>map=new HashMap<String, Object>();
		
		map.put("board", board);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		mav.addObject("map", map);
		mav.setViewName("redirect:list-select.do");
		return mav;
		
	}
	

	@RequestMapping(value = "list-select.do")
	public String mainlistAction(Model model, @RequestParam(value = "category", defaultValue = "all") String category,@RequestParam(value = "page", defaultValue = "1") int page) {
		System.out.println(category);
		HashMap<String, Object> map = new HashMap<String, Object>();

		PagingVO vo = new PagingVO(page, postService.listCount(category));
		map.put("page", page);
		map.put("totalPage", vo.getTotalPage());
		map.put("start", vo.getStartList());
		map.put("end", vo.getEndList());
		map.put("startPage", vo.getStartPage());
		map.put("endPage", vo.getEndPage());
		map.put("category", category);
		
		System.out.println(vo.getStartPage());
		System.out.println(vo.getEndPage());
		System.out.println(vo.getTotalPage());

		if (category.equals("all")) {
			model.addAttribute("selectLang", postService.alllistAction(map));
			model.addAttribute("pageList", map);
		} else {
			model.addAttribute("selectLang", postService.listAction(map));
			model.addAttribute("pageList", map);
		}


		if (category.equals("C++")) {
			category = "C%2B%2B";
		}
		model.addAttribute("category", category);

		return "/shareCode/list-select";
	}
}
