package sharecode.service;


import java.util.List;

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
	public List<PostVO> postInfoSelect(int no) {
		dao.updatePostHit(no);
		return dao.selectPostInfo(no);
	}

	@Override
	public void postInfoUpdate(int no) {
		// TODO Auto-generated method stub
		dao.updatePostInfo(no);
		
	}

}
