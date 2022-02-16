package sharecode.service;


import java.util.List;

import sharecode.vo.PostVO;

public interface PostService {
	public void postInsertAction(PostVO vo);
	public List<PostVO> postInfoSelect(int no);
	public void postInfoUpdate(int no);
	public List<PostVO> listAction(String category);
}
