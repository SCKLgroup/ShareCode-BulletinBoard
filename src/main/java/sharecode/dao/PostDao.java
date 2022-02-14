package sharecode.dao;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Repository;

import sharecode.vo.PostVO;

@Repository
@ComponentScan(value = "shareCode.dao")
public class PostDao extends SqlSessionDaoSupport {

	@Resource(name = "sqlSessionTemplate")
	@Inject
	protected void initDao(SqlSessionTemplate st) throws Exception {
		this.setSqlSessionTemplate(st);
	}
	
	public void insertPost(PostVO vo) {
		this.getSqlSession().insert("insertPost",vo);
	}
}
