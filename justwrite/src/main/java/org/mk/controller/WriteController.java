package org.mk.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mk.domain.UserInfo;
import org.mk.service.PwEnc;
import org.mk.service.WriteService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;




@Controller
@RequestMapping("/justwrites/*")
@AllArgsConstructor
public class WriteController {

	
	private WriteService service;
	private PwEnc enc;
	
	@GetMapping("/userSearch")
	public void search(@RequestParam("id") String id, Model model) {
		
		System.out.println("id값 :"+id);
		model.addAttribute("user", service.readUser(id));
		
	
	}
	
	
	@GetMapping("/login")
	public void login() {
		
	}
	
	@GetMapping("/firstPage")
	public String firstPage(HttpServletRequest request) {
		   HttpSession session = request.getSession();
		   	System.out.println(session);
		   if(session == null) {
			   System.out.println("null입니다!!!");
			   return "redirect:/justwrites/login";
		   }
		   	
		   return "redirect:/justwrites/login";
	}
	
	
	@PostMapping("/regist")
	  public String registUser(UserInfo info, RedirectAttributes rttr) {
			
			String pwcode = info.getPw();
				
			String encode = enc.enc(pwcode);
			System.out.println(encode);
			
				info.setPw(encode);
			
				System.out.println("<---문자열 변환----->");
				System.out.println(info);
				 service.userRegist(info);
				 
				 rttr.addFlashAttribute("result", info.getId());
				 return "redirect:/justwrites/login";
			
	  }
	
	
	

}
