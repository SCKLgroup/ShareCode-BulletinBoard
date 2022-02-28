package sharecode.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import sharecode.service.BoardService;
import sharecode.vo.PagingVO;
import sharecode.vo.PostVO;

@Controller
public class BoardController {

	@Inject
	BoardService boardService;


	@RequestMapping("shareCode/board.do")
	public ModelAndView board(@RequestParam(defaultValue = "all") String searchOption,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(value = "page", defaultValue = "1") int page) throws Exception {
		System.out.println("보드컨트롤러 도착?");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		int count = boardService.countArticle(map);

		ModelAndView mav = new ModelAndView();

		PagingVO vo = new PagingVO(page, count);
		

		map.put("page", page);
		map.put("totalPage", vo.getTotalPage());
		map.put("start", vo.getStartList());
		map.put("end", vo.getEndList());
		map.put("startPage", vo.getStartPage());
		map.put("endPage", vo.getEndPage());
		System.out.println(vo);
		System.out.println(searchOption+"   /////////////////////////////////");
		
		map.put("count", count);
		mav.addObject("map", map);
		List<PostVO> board = boardService.boardAll(map);
		map.put("board", board);
//		mav.addObject(vo);

		System.out.println(map+"   //////************//////////////////////////");
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
