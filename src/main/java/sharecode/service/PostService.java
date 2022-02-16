package sharecode.service;



import sharecode.vo.PostVO;

public interface PostService {
	public void postInsertAction(PostVO vo);
	public PostVO postInfoSelect(int post_no);
	public void postInfoUpdate(PostVO vo);
}
