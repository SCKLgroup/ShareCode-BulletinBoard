package sharecode.dao;

import java.util.List;

import sharecode.vo.CommentsVO;

public interface CommentsDao {
	public List<CommentsVO> selectCommentsList(int post_no);
	public void insertCommentsInfo(CommentsVO vo);
}
