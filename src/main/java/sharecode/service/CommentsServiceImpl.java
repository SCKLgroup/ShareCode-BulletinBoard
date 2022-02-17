package sharecode.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sharecode.dao.CommentsDao;
import sharecode.vo.CommentsVO;
@Service
public class CommentsServiceImpl implements CommentsService{

	@Autowired
	CommentsDao dao;
	
	@Override
	public List<CommentsVO> commentsList(int post_no) {
		return dao.selectCommentsList(post_no);
	}

	@Override
	public void commentsInsert(CommentsVO vo) {
		// TODO Auto-generated method stub
		dao.insertCommentsInfo(vo);
	}

}
