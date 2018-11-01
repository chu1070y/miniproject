package org.salem.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

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
	public void register() {
		log.info("register page~~~~~~~~~~~~~~~");
	}
	
	@PostMapping("/register")
	public String registerPOST(BoardVO vo,RedirectAttributes rttr) {
		log.info("register post.....................");
		
		if(vo.getId()==""||vo.getTitle()==""||vo.getContent()==""){
			rttr.addFlashAttribute("result","글자를 입력해주세여");
			return "redirect:/mini/read";
		}

		if(vo.getAttachList() != null) {
			vo.getAttachList().forEach(attach -> log.info(attach));
		}
		
		int count = service.register(vo);
		
		rttr.addFlashAttribute("result",count==1?"success":"fail");
		
		return "redirect:/mini/read";
	}
	
	@GetMapping({"/read","/modify"})
	public void read(@ModelAttribute("page") PageDTO pageDTO, Model model) {
		log.info("read or modify page~~~~~~~~~~~~~~~");
		
		model.addAttribute("read", service.read(pageDTO));
	}
	
	@PostMapping("/delete")
	public String delete(PageDTO pageDTO, RedirectAttributes rttr) {
		
		List<BoardAttachVO> attachList = service.getAttachList(pageDTO.getBno());
		
		if(service.remove(pageDTO)) {
			//첨부파일 삭제
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
