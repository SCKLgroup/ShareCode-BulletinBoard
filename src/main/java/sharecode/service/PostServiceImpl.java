package sharecode.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sharecode.dao.PostDao;
import sharecode.vo.PostVO;

@Service
public class PostServiceImpl implements PostService{
	@Autowired
	PostDao dao;
	
	@Override
	public void postInsertAction(PostVO vo) {
		dao.insertPost(vo);
	}

	@Override
	public PostVO postInfoSelect(int post_no) {
		dao.updatePostHit(post_no);
		return dao.selectPostInfo(post_no);
	}

	@Override
	public void postInfoUpdate(PostVO vo) {
		// TODO Auto-generated method stub
		dao.updatePostInfo(vo);
		
	}

}
