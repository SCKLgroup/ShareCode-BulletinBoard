package sharecode.dao;

import java.util.List;

import sharecode.vo.PostVO;

public interface PostDao {
	public void insertPost(PostVO vo);

	public List<PostVO> selectPostInfo(int no);

	public void updatePostHit(int no);

	public void updatePostInfo(int no);

	public List<PostVO> selectPost(String category);

	public List<PostVO> selectLangCategory(String category);
}
