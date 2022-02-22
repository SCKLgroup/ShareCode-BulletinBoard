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
import sharecode.vo.PostVO;

@Controller
public class BoardController {
	
	@Inject BoardService boardService;

	@RequestMapping("board.do")
	public ModelAndView board(@RequestParam(defaultValue = "post_title") String searchOption,
			@RequestParam(defaultValue = "") String keyword) throws Exception {
		List<PostVO> board = boardService.boardAll(searchOption, keyword);

		int count = boardService.countArticle(searchOption,keyword);
		
		ModelAndView mav = new ModelAndView();
		
		Map<String,Object>map=new HashMap<String, Object>();
		map.put("board", board);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		mav.addObject("map", map);
		mav.setViewName("searchCode/list");
		return mav;
		
	}
}
