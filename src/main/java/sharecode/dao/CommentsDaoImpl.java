package sharecode.dao;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import sharecode.vo.CommentsVO;
@Repository
public class CommentsDaoImpl implements CommentsDao{

	@Inject
	protected SqlSessionTemplate sqlSession;
	

	@Override
	public List<CommentsVO> selectCommentsList(int post_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("selectCommentsList",post_no);
	}
	
	@Override
	public void insertCommentsInfo(CommentsVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert("insertCommentsInfo",vo);
		
	}

	@Override
	public int getComSequence() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getComSequence");
	}

}
