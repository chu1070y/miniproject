package org.salem.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {

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
	
	@GetMapping("/login/logout")
	public void logoutGET() {
		log.info("logout");
	}
	
	@PostMapping("/login/logout")
	public void logoutPOST() {
		log.info("logout POST");
	}

}
