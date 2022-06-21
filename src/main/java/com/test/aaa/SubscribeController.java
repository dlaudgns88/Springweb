package com.test.aaa;


import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;


import com.test.VO.subscribeVO;
import com.test.services.IF_subscribeService;
import com.test.util.FileDataUtil;


@Controller
public class SubscribeController {
	@Inject
	IF_subscribeService sservice;
	@Inject
	FileDataUtil fileDataUtil;
	
	@RequestMapping(value = "/addSubscribe", method = RequestMethod.GET)
	public String addSubscribe(Locale locale, Model model) throws Exception {
		
		return "addSub";
	}
	@RequestMapping(value = "/subinsert", method = RequestMethod.POST)
	public String addsub(MultipartFile file, Locale locale, Model model,@ModelAttribute subscribeVO svo) throws Exception {
		if(file.getOriginalFilename()=="") {
			//첨부파일이 없는경우
			svo.setFname("notadd");
		}else {
			String[] fname=fileDataUtil.fileUpload(file);
			svo.setFname(fname[0]);
		}
		System.out.println("등록url : "+svo.getR_url());
		System.out.println("등록img : "+svo.getFname());
		sservice.insert(svo);
		
		return "close";
	}
}

