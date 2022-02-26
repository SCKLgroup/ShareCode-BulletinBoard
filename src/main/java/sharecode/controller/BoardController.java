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

	@Inject
	BoardService boardService;


	@RequestMapping("shareCode/board.do")
	public ModelAndView board(@RequestParam(defaultValue = "post_title") String searchOption,
			@RequestParam(defaultValue = "") String keyword,@RequestParam(value = "category", defaultValue = "all") String category,
			@RequestParam(value = "page", defaultValue = "1") int page) throws Exception {
		System.out.println("보드컨트롤러 도착?");
		List<PostVO> board = boardService.boardAll(searchOption, keyword);

		int count = boardService.countArticle(searchOption, keyword);

		ModelAndView mav = new ModelAndView();

		PagingVO vo = new PagingVO(page, count);
		
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("page", page);
		map.put("totalPage", vo.getTotalPage());
		map.put("start", vo.getStartList());
		map.put("end", vo.getEndList());
		map.put("startPage", vo.getStartPage());
		map.put("endPage", vo.getEndPage());
		map.put("category", searchOption);
		
		map.put("board", board);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		mav.addObject("map", map);
		
		if (category.equals("all")) { //카테고리가 all 일때 전체 리스트 출력
			mav.addObject("selectLang", boardService.boardAll(searchOption, keyword));
			mav.addObject("pageList", map);
		} 
//		mav.setViewName("redirect:list-select.do");
		if (count != 0) {
			mav.setViewName("shareCode/list-select");
		} else {
			mav.addObject("msg","검색 결과가 없습니다.");
			mav.addObject("url","list.do");
			mav.setViewName("shareCode/select-alert");
		}
		return mav;

	}
}
