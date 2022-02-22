package sharecode.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import sharecode.vo.PostVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject SqlSession SqlSession;

	@Override
	public List<PostVO> boardAll(String searchOption, String keyword) throws Exception {
		Map<String,String>map=new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return SqlSession.selectList("board.boardAll",map);
	}

	@Override
	public int countArticle(String searchOption, String keyword) throws Exception {
		Map<String, String>map=new HashMap<String,String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return SqlSession.selectOne("board.countArticle",map);
		
	}

	
	
}
