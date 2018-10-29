package org.salem.controller;

import org.salem.domain.BoardVO;
import org.salem.service.Boardservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mini/*")
public class BoardController {

	@Setter(onMethod_ = @Autowired)
	Boardservice service;
	
	@GetMapping("/list")
	public void boardList(Model model) {
		log.info("list page~~~~~~~~~~~~~~~");
		model.addAttribute("list", service.getList());
	}
	
	@GetMapping("/register")
	public void register() {
		log.info("register page~~~~~~~~~~~~~~~");
	}
	
	@PostMapping("/register")
	public String registerPOST(BoardVO vo,RedirectAttributes rttr) {
		log.info("register post.....................");
		
		log.info(vo.getMno());
		
		int count = service.register(vo);
		
		rttr.addFlashAttribute("result",count==1?"success":"fail");
		
		return "redirect:/mini/list";
	}
	
	@GetMapping({"/read","/modify"})
	public void read(int bno, Model model) {
		log.info("read or modify page~~~~~~~~~~~~~~~");
		
		model.addAttribute("read", service.read(bno));
	}
	
	@PostMapping("/delete")
	public String delete(BoardVO vo, RedirectAttributes rttr) {
		log.info("delete................running");
		
		int count = service.delete(vo.getBno());
		log.info("---------------------------"+count);
		
		rttr.addFlashAttribute("result",count==1?"success":"fail");
		
		return "redirect:/mini/list";
	}
	
	@PostMapping("/modify")
	public String update(BoardVO vo, RedirectAttributes rttr) {
		log.info("update ................ running");
		
		int count = service.update(vo);

		log.info("---------------------------"+count);
		
		rttr.addFlashAttribute("result",count==1?"success":"fail");
		
		return "redirect:/mini/read?bno="+vo.getBno();
	}
	
	
}
