package org.mk.controller;


import org.mk.domain.UserInfo;
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
	
	
	@GetMapping("/userSearch")
	public void search(@RequestParam("id") String id, Model model) {
		
		System.out.println("id값 :"+id);
		
		
		model.addAttribute("user", service.readUser(id));
		
	
	}
	
	
	@GetMapping("/login")
	public void login() {
		
	}
	
	@PostMapping("/regist")
	  public String registUser(UserInfo info, RedirectAttributes rttr) {
				
	
		
		
		 service.userRegist(info);
		 
		 rttr.addFlashAttribute("result", info.getId());
		 return "redirect:/justwrites/login";
	  }
	

}
