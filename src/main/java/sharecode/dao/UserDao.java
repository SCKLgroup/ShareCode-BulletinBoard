package sharecode.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Repository;

import sharecode.vo.UserVO;

@Repository
@ComponentScan(value="sharecode.dao")
public class UserDao extends SqlSessionDaoSupport {
	
	public void signupUser(UserVO vo) { //회원정보추가
		this.getSqlSession().insert("singUpUser",vo);
	}
}
