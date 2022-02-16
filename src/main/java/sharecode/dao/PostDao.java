package sharecode.dao;



import sharecode.vo.PostVO;

public interface PostDao {
	public void insertPost(PostVO vo);
	public PostVO selectPostInfo(int post_no);
	public void updatePostHit(int post_no);
	public void updatePostInfo(PostVO vo);
}
