package sharecode.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sharecode.dao.CommentsDao;
import sharecode.dao.PostDao;
import sharecode.vo.PostVO;

@Service
public class PostServiceImpl implements PostService {
	@Autowired
	PostDao dao;
	@Autowired
	CommentsDao comDao;

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
	public void postDelete(int post_no) {
		dao.deletePost(post_no);
		comDao.deletePostComments(post_no);
	}

	@Override
	public void postInfoUpdate(PostVO vo) {
		dao.updatePostInfo(vo);
	}


	@Override
	public List<PostVO> listAction(String category) {
		System.out.println("포스트서비스임플리먼트 실행");
		System.out.println(dao.selectLangCategory(category));
		return dao.selectLangCategory(category);
	}
	
	@Override
	public List<PostVO> alllistAction() {
		System.out.println("포스트서비스임플리먼트 실행");
		System.out.println(dao.selectLangAllCategory());
		return dao.selectLangAllCategory();
	}
	
	@Override
	public List<PostVO> ajaxlistAction(HashMap<String, Object> jobs){
		return dao.ajaxSelectCategory(jobs);
	}
	
	@Override
	public List<PostVO> ajaxalllistAction(HashMap<String, Object> jobs){
		return dao.ajaxallSelectCategory(jobs);
	}

	

}
