package com.test.aaa;


import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.VO.subscribeVO;
import com.test.services.IF_subscribeService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Inject
	IF_subscribeService sservice;
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		
		
		return "redirect:/index";
	}
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) throws Exception {
		List<subscribeVO> subList= sservice.subscribeList();
		System.out.println(subList.size());
		model.addAttribute("subList", subList);
		return "index";
	}
	@RequestMapping(value = "/index2", method = RequestMethod.GET)
	public String index2(Locale locale, Model model) {
	
		
		return "index2";
	}
	
}
