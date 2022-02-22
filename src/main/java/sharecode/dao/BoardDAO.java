package sharecode.dao;

import java.util.List;

import sharecode.vo.PostVO;

public interface BoardDAO {
	
	public List<PostVO> boardAll(String searchOption, String keyword) throws Exception;
	
	public int countArticle(String searchOption, String keyword) throws Exception;

}
