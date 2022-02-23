package sharecode.dao;


import java.util.HashMap;
import java.util.List;

import sharecode.vo.PostVO;

public interface PostDao {
	public void insertPost(PostVO vo);
	public PostVO selectPostInfo(int post_no);
	public void updatePostHit(int post_no);
	public void updatePostInfo(PostVO vo);
	public List<PostVO> selectLangCategory(String category);
	public List<PostVO> selectLangAllCategory();
	public void deletePost(int post_no);
	public List<PostVO> ajaxSelectCategory(HashMap<String, Object> jobs);
	public List<PostVO> ajaxallSelectCategory(HashMap<String, Object> jobs);
}
