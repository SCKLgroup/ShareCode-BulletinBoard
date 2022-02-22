package sharecode.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import sharecode.dao.BoardDAO;
import sharecode.vo.PostVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	BoardDAO boardDAO;

	@Override
	public List<PostVO> boardAll(String searchOption, String keyword) throws Exception {
		return boardDAO.boardAll(searchOption, keyword);
	}

	@Override
	public int countArticle(String searchOption, String keyword) throws Exception {
		return boardDAO.countArticle(searchOption, keyword);
	}

}
