package sharecode.service;

import javax.servlet.http.HttpSession;

import sharecode.vo.LoginVO;

public interface LoginService {
	public String loginCheck(LoginVO vo, HttpSession session);
	public void logout(HttpSession sesssion);
}
