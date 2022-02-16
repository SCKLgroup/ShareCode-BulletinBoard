package sharecode.dao;


import java.util.List;

import sharecode.vo.PostVO;

public interface PostDao {
	public void insertPost(PostVO vo);
	public PostVO selectPostInfo(int post_no);
	public void updatePostHit(int post_no);
	public void updatePostInfo(PostVO vo);
	public List<PostVO> selectLangCategory(String category);
	public void deletePost(int post_no);
}
