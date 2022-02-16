package sharecode.dao;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import sharecode.vo.PostVO;
@Repository
public class PostDaoImpl implements PostDao{

	@Inject
	protected SqlSessionTemplate sqlSession;
	
	@Override
	public void insertPost(PostVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert("insertPost",vo);
		
	}

	@Override
	public PostVO selectPostInfo(int post_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("selectPostInfo",post_no);
	}

	@Override
	public void updatePostHit(int post_no) {
		sqlSession.update("updatePostHit",post_no);
	}

	@Override
	public void updatePostInfo(PostVO vo) {
		// TODO Auto-generated method stub
		sqlSession.update("updatePostInfo",vo);
	}
	
}
