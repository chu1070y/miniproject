package org.salem.controller;

import org.salem.domain.AuthVO;
import org.salem.domain.MemberVO;
import org.salem.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {
	
	@Setter(onMethod_ = @Autowired)
	private LoginService service;
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;

	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access Denied: " + auth);
	}
	
	@GetMapping("/login/login")
	public void login(String error, String logout, Model model) {
		
		log.info("error: " + error);
		log.info("logout: " + logout);
		
		if(error!= null) {
			model.addAttribute("error", "Login error Check ur Account");
		}
		
		if(logout != null) {
			model.addAttribute("logout", "logout!!");
		}
		
	}
	
	@GetMapping("/login/signup")
	public void signupGET() {
		log.info("signup");
	}
	
	@Transactional
	@PostMapping("/login/signup")
	public String signupPOST(MemberVO vo, RedirectAttributes rttr) {
		log.info("signup POST");
		log.info(vo);
		log.info("==================");
		
		if(vo.getId() == "" || vo.getPw() == "") {
			rttr.addFlashAttribute("result", "blank");
			return "redirect:/login/signup";
		}
		
		
		int result = service.checkId(vo);
		
		if (result > 0) {
			rttr.addFlashAttribute("result", "fail");
			return "redirect:/login/signup";
		}
		
		vo.setPw(pwencoder.encode(vo.getPw()));
		AuthVO authVO = new AuthVO();
		authVO.setId(vo.getId());
		authVO.setAuth("ROLE_MEMBER");
		
		service.insertMember(vo);
		service.insertAuth(authVO);
		
		log.info(vo);
		
		return "redirect:/login/login";
		
	}
	
	@GetMapping("/login/logout")
	public void logoutGET() {
		log.info("logout");
	}
	
	@PostMapping("/login/logout")
	public void logoutPOST() {
		log.info("logout POST");
	}

}
