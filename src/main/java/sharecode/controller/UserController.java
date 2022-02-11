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
	
	@RequestMapping(value = "/sharecode/signup.do")
	public String userSignUpAction(UserVO vo) {
		dao.signupUser(vo);
		return "";
	}

}
