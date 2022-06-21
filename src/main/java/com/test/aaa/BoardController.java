package com.test.aaa;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.test.VO.PageVO;
import com.test.VO.boardVO;
import com.test.VO.likeVO;
import com.test.VO.replyVO;
import com.test.services.IF_boardService;
import com.test.util.FileDataUtil;

@Controller
public class BoardController {
@Inject
IF_boardService bservice;
@Inject
FileDataUtil fileDataUtil;

	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String board(Locale locale, Model model,@ModelAttribute PageVO pagevo) throws Exception {
		if(pagevo.getPage()==null) {
			pagevo.setPage(1);
		}
		pagevo.setPerPageNum(10);
		pagevo.setTotalCount(bservice.boardcnt());
		//view는 startpage와 endpage를 이용하여 페이지 그룹을 출력한다.
		System.out.println("현재 페이지 번호 : "+ pagevo.getPage());
		System.out.println("현재 페이지그룹 시작번호 : "+pagevo.getStartPage());
		System.out.println("현재 페이지그룹 끝번호 : "+pagevo.getEndPage());
		System.out.println("현재 페이지 글 시작번호 : "+pagevo.getStartNo());
		System.out.println("현재 페이지 글 끝번호 : "+pagevo.getEndNo());
		model.addAttribute("pagevo", pagevo);
		//paging end
		//List<boardVO> boardlist = bservice.boardlist();
		List<boardVO> boardlist = bservice.boardlist2(pagevo);
		System.out.println(boardlist.size());
		model.addAttribute("boardlist",boardlist);
	
		return "board";
	}
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write(Locale locale, Model model) {
	
		
		return "write";
	}
	@RequestMapping(value = "/exit", method = RequestMethod.GET)
	public String exit(Locale locale, Model model) {
	
		
		return "redirect:/board";
	}
	@RequestMapping(value = "/delete", method = RequestMethod.GET )
	public String delete(Locale locale, Model model,  @RequestParam("no") int no) throws Exception {
		System.out.println("게시글번호 :"+no);
		bservice.delete(no);
		//System.out.println("삭제됬어?");
		return "redirect:/board";
	}
	@RequestMapping(value = "/boardwrite", method = RequestMethod.POST)
	public String boardwrite(MultipartFile file, Locale locale, Model model,@ModelAttribute boardVO bvo) throws Exception{
//		System.out.println("게시글 카테고리 : "+bvo.getCategory());
//		System.out.println("게시글 작성자 : "+bvo.getM_id());
//		System.out.println("게시글 제목 : "+bvo.getName());
//		System.out.println("게시글 메모 : "+bvo.getName());
//		System.out.println("게시글 체크여부 : "+bvo.getH_check());
		
//		//페이징 을 위 한 반복 실행
//		for(int i =0; i<100; i++)	{
//			if(file.getOriginalFilename()=="") {
//				//첨부파일이 없는경우
//				bvo.setFname("not add file");
//			}else {
//				String[] fname=fileDataUtil.fileUpload(file);
//				bvo.setFname(fname[0]); 
//			}
//			System.out.println(bvo.getFname());
//			if(bvo.getH_check() != null) {
//				//비밀글 체크시
//				bvo.setH_check("1");
//				bservice.insert(bvo);
//			}else {
//				//비밀글 체크 안했을 시 
//				bvo.setH_check("2");
//				bservice.insert(bvo);
//			}
//			System.out.println("디비저장완료");
//		
//		}
		if(file.getOriginalFilename()=="") {
			//첨부파일이 없는경우
			bvo.setFname("not add file");
		}else {
			String[] fname=fileDataUtil.fileUpload(file);
			bvo.setFname(fname[0]);
		}
		System.out.println(bvo.getFname());
		if(bvo.getH_check() != null) {
			//비밀글 체크시
			bvo.setH_check("1");
			bservice.insert(bvo);
		}else {
			//비밀글 체크 안했을 시 
			bvo.setH_check("2");
			bservice.insert(bvo);
		}
		System.out.println("디비저장완료");
	
		
		return "redirect:/board";
	}
	@RequestMapping(value = "/board/detail", method = RequestMethod.GET)
	public String detailboard(Locale locale, Model model, @RequestParam("no") int no,HttpSession session,RedirectAttributes rttr) throws Exception {
		//자세히보기로 해당 글의 번호를 넘겨줌
		
		boardVO selectboard = bservice.detail(no);
		model.addAttribute("selectboard", selectboard);
		List<replyVO> replyList = bservice.replylist(no);
		session.setAttribute("replylist", replyList);
//		System.out.println(replyList.size());
		model.addAttribute("replycount", replyList.size());
		List<likeVO> selectboard_like = bservice.selectboard(no);
		model.addAttribute("likeList", selectboard_like);
		model.addAttribute("likecount", selectboard_like.size());
		return "detailBoard";
		
	}
	@RequestMapping(value = "/reply", method = RequestMethod.POST)
	public String reply(Locale locale, Model model, @ModelAttribute replyVO rvo,RedirectAttributes rttr, HttpSession session) throws Exception {
		System.out.println("게시글번호 : "+rvo.getB_no());
		System.out.println("댓글등록아이디: "+rvo.getReg_id());
		System.out.println("댓글등록내용 : "+rvo.getR_memo());
		bservice.addreply(rvo);
		rttr.addAttribute("no", rvo.getB_no());
		
		return "redirect:/board/detail";
	}
	@RequestMapping(value = "/like", method = RequestMethod.POST)
	public String like(Locale locale, Model model, @ModelAttribute likeVO lvo,RedirectAttributes rttr, HttpSession session) throws Exception {
		System.out.println("게시글번호 : "+lvo.getB_no());
		System.out.println("좋아요 등록 아이디 : "+lvo.getId());
		System.out.println("좋아요 현재상태 : "+lvo.getOnoffcheck());
		bservice.like(lvo);
		likeVO selectone =bservice.selectone(lvo);
		session.setAttribute("selectone", selectone);
		rttr.addAttribute("no", lvo.getB_no());
		//좋아요의 수를 받아오기위해선 cnt값만 체크하면 됨.. 
		
		return "redirect:/board/detail";
	}
	
	@RequestMapping(value = "/ajaxtest", method = RequestMethod.POST)
	@ResponseBody
	public void test(replyVO rvo) throws Exception {
		//System.out.println("받아온 댓글번호" + rvo.getR_no());
		//System.out.println("받아온메모"+rvo.getR_memo());
		bservice.updatereply(rvo);

	}
	@RequestMapping(value = "/ajaxdelete", method = RequestMethod.POST)
	@ResponseBody
	public void delete(replyVO rvo) throws Exception {
		//System.out.println("받아온 댓글번호" + rvo.getR_no());
		
		bservice.deletereply(rvo);

	}
	@RequestMapping(value = "/modboard", method = RequestMethod.POST)
	@ResponseBody
	public void modboard(boardVO bvo) throws Exception {
		//System.out.println("받아온 댓글번호" + rvo.getR_no());
		System.out.println("게시글 번호 : "+bvo.getNo());
		System.out.println("게시글제목 : "+bvo.getName());
		System.out.println("게시글 내용 : "+bvo.getMemo());
		bservice.updateboard(bvo);

	}
	
}
