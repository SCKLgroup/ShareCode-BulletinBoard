package sharecode.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import sharecode.dao.LoginDAO;
import sharecode.vo.LoginVO;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Inject
	LoginDAO loginDao;
	
	@Override
	public String loginCheck(LoginVO vo, HttpSession session) {
		String user_id = loginDao.loginCheck(vo);
		if(user_id != null) {
			session.setAttribute("user_id", vo.getUSER_ID());
//			session.setAttribute("user_pw", vo.getUSER_PW());
		}
		return user_id;
	}
	
	@Override
	public void logout(HttpSession session) {
		session.invalidate(); // 세션 초기화
	}
}
