package com.test.aaa;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.VO.memberVO;
import com.test.services.IF_MemberService;

@Controller
public class LoginController {
	@Inject
	IF_MemberService mservice;
		
	
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signup(Locale locale, Model model ,@ModelAttribute memberVO mvo) throws Exception {
		System.out.println(mvo.getId());
		System.out.println(mvo.getPw());
		System.out.println(mvo.getTel());
		System.out.println(mvo.getAddr());
		mservice.insert(mvo);
		System.out.println("디비저장완료");
		
		return "redirect:/";
	}
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Locale locale, Model model ,@ModelAttribute memberVO mvo, HttpSession session) throws Exception {
		System.out.println("로그인아이디 :"+mvo.getId() );
		System.out.println("로그인 비밀번호 :"+mvo.getPw());
		memberVO nowuser =mservice.selectone(mvo);
		if(nowuser !=null) {
			session.setAttribute("loginuser", mvo);
			session.setAttribute("grade",nowuser.getGrade() );
			System.out.println(nowuser.getGrade());
			System.out.println(nowuser.getPoint());
			System.out.println("로그인세션 등록 성공");
		}
		
		
		
		return "redirect:/";
	}
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup(Locale locale, Model model ) throws Exception {
		
		
		
		return "signup";
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Locale locale, Model model ,@ModelAttribute memberVO mvo, HttpSession session) throws Exception {
		session.invalidate();
		
		
		return "redirect:/";
	}
	
}
