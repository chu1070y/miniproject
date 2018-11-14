package org.salem.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.Cookie;

import org.salem.domain.BoardAttachVO;
import org.salem.domain.BoardVO;
import org.salem.domain.PageDTO;
import org.salem.service.Boardservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mini/*")
public class BoardController {

	@Setter(onMethod_ = @Autowired)
	Boardservice service;

	
	@GetMapping(value="/getAttachList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(int bno){
		
		return new ResponseEntity<>(service.getAttachList(bno),HttpStatus.OK);
	}
	
	@GetMapping("/list")
	public void boardList(Model model,PageDTO pageDTO) {
		log.info("list page~~~~~~~~~~~~~~~");
		
		log.info(pageDTO.getKeyword());
		
		pageDTO.setTotal(service.count(pageDTO));
		
		
		model.addAttribute("page", pageDTO);
		model.addAttribute("list", service.search(pageDTO));
	}
	
	@GetMapping("/register")
//	@PreAuthorize("isAuthenticated()")
	public void register() {
		log.info("register page~~~~~~~~~~~~~~~");
	}
	
	@PostMapping("/register")
//	@PreAuthorize("isAuthenticated()")
	public String registerPOST(BoardVO vo,RedirectAttributes rttr) {
		log.info("register post.....................");
		
		if(vo.getAttachList() != null) {
			vo.getAttachList().forEach(attach -> log.info(attach));
		}
		
		int count = service.register(vo);
		
		rttr.addFlashAttribute("result",count==1?"success":"fail");

		return "redirect:/mini/list";
	}
	
	@GetMapping("/read")
	public void read(@ModelAttribute("page") PageDTO pageDTO, Model model, 
			@CookieValue(value="GiveMeCookies",required=false) String cookie) {
		log.info("read page~~~~~~~~~~~~~~~");
		
		BoardVO vo = service.read(pageDTO);
		
		log.info("cookie value: " + cookie);
		
		if(vo == null) {
			model.addAttribute("result", "none");
		}
		
		model.addAttribute("read", vo);
		
		
		//view 처리
		
		if(cookie != null) {
			
			String[] arr = cookie.split("_");
			
			for(String str : arr) {
				
				if(str.equals(String.valueOf(pageDTO.getBno()))) {
					return;
				}
			}
			
		}
		
		
		service.view(pageDTO);
	}
	
	@GetMapping("/modify")
	public void modify(@ModelAttribute("page") PageDTO pageDTO, Model model) {
		log.info("modify page~~~~~~~~~~~~~~~");
		
		BoardVO vo = service.read(pageDTO);
		
		if(vo == null) {
			model.addAttribute("result", "none");
		}
		
		model.addAttribute("read", vo);
	}
	
	@PostMapping("/delete")
	public String delete(PageDTO pageDTO, RedirectAttributes rttr) {
		
		List<BoardAttachVO> attachList = service.getAttachList(pageDTO.getBno());
		
		if(service.remove(pageDTO)) {
			//÷������ ����
			deleteFiles(attachList);
			rttr.addFlashAttribute("result","success");
		}
		
		return pageDTO.getLink("redirect:/mini/list");
	}
	
	@PostMapping("/modify")
	public String update(BoardVO vo, PageDTO pageDTO, RedirectAttributes rttr) {

		int count = service.update(vo);

		rttr.addFlashAttribute("result",count==1?"success":"fail");

		return pageDTO.getLink("redirect:/mini/read");
	}
	
	private void deleteFiles(List<BoardAttachVO> attachList) {
		
		if(attachList == null|| attachList.size()==0) {
			return;
		}
		
		log.info("delete attach files..............");
		log.info(attachList);
		
		attachList.forEach(attach->{
			
			try {
				Path file = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\"+attach.getUuid()+"_"+attach.getFileName());
			
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					
					Path thumbNail = Paths.get("C:\\upload\\" + attach.getUploadPath()+"\\s_"+attach.getUuid()+"_"+attach.getFileName());
					
					Files.delete(thumbNail);
					
				}
				
			} catch (Exception e) {
				log.info("delete file error");
				e.printStackTrace();
			}//end catch
			
		});//end foreach
		
	}
	
	
}
