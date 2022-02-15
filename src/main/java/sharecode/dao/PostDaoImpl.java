package sharecode.dao;

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
	
}
