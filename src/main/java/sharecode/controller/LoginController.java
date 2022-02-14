package sharecode.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import sharecode.service.LoginService;
import sharecode.vo.LoginVO;

@Controller // 컨트롤러 빈으로 등록한다.
@RequestMapping("/ShareCode/*")
public class LoginController {

	@Inject // menu.do 클릭하면 shareCode/login.jsp로 이동 *******************
	LoginService loginService;

	@RequestMapping("login.do")
	public String login() {
		return "shareCode/login";
	}

	@RequestMapping("login_check.do")
	public ModelAndView login_check(@ModelAttribute LoginVO vo, HttpSession session) {
		String user_id = loginService.loginCheck(vo, session);
		ModelAndView mav = new ModelAndView();
		if (user_id != null) {
			mav.setViewName("list");
		} else {
			mav.setViewName("shareCode/login");
			mav.addObject("message", "error");
		}
		return mav;
	}

	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
		loginService.logout(session);
		mav.setViewName("shareCode/login");
		mav.addObject("message", "logout");
		return mav;

	}

}
