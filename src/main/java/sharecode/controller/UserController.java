package sharecode.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import sharecode.dao.UserDao;
import sharecode.vo.UserVO;

@Controller
public class UserController {
	
	@Autowired
	private UserDao dao;
	
<<<<<<< HEAD
	@RequestMapping(value = "/shareCode/signup.do")
	public String userSignUpAction(UserVO vo) {
		System.out.println("컨트롤러 실행");
		dao.signupUser(vo);
		return "sharecode/signup_success";
=======
	@RequestMapping(value = "/sharecode/signup.do")
	public String userSignUpAction(UserVO vo) {
		dao.signupUser(vo);
		return "";
>>>>>>> branch 'master' of https://github.com/shareCodeProject/shareCode.git
	}

}
