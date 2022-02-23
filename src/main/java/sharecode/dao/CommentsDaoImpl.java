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
		return sqlSession.selectList("selectCommentsList",post_no);
	}
	
	@Override
	public void insertCommentsInfo(CommentsVO vo) {
		sqlSession.insert("insertCommentsInfo",vo);
	}

	@Override
	public void deleteComments(int com_no) {
		sqlSession.update("deleteComments",com_no);
	}

	@Override
	public int getComSequence() {
		return sqlSession.selectOne("getComSequence");
	}

	@Override
	public void updateComments(CommentsVO vo) {
		sqlSession.update("updateComments",vo);
	}
	
	@Override
	public void deletePostComments(int post_no) {
		sqlSession.delete("deletePostComments",post_no);
	}

}
