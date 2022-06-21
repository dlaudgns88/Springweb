package com.test.aaa;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ShopCotroller {

	@RequestMapping(value = "/shop", method = RequestMethod.GET)
	public String board(Locale locale, Model model) {
	
		
		return "shop";
	}	
}
