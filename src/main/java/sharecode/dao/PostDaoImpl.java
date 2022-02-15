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
	public List<PostVO> selectPostInfo(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("selectPostInfo",no);
	}

	@Override
	public void updatePostHit(int no) {
		sqlSession.update("updatePostHit",no);
	}

	@Override
	public void updatePostInfo(int no) {
		// TODO Auto-generated method stub
		sqlSession.update("updatePostInfo",no);
	}
	
}
