package sharecode.service;



import java.util.HashMap;
import java.util.List;

import sharecode.vo.PostVO;

public interface PostService {
	public void postInsertAction(PostVO vo);
	public PostVO postInfoSelect(int post_no);
	public void postInfoUpdate(PostVO vo);
	public List<PostVO> listAction(String category);
	public List<PostVO> alllistAction();
	public void postDelete(int post_no);
	public List<PostVO> ajaxlistAction(HashMap<String, Object> jobs);
	public List<PostVO> ajaxalllistAction(HashMap<String, Object> jobs);
}
