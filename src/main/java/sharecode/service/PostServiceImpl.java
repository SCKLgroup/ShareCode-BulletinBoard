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
		// TODO Auto-generated method stub
		dao.insertPost(vo);
	}

}
