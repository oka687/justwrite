package org.mk.controller;


import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.servlet.ModelAndView;
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
	
	@GetMapping("/check")
	public ModelAndView check(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();	
		 request.getSession().getAttribute("id");
		 
		 
		   	System.out.println(request.getSession().getAttribute("id"));
		   if( request.getSession().getAttribute("id") != null) {
				System.out.println("널아님");
				
				String msg = "이미 로그인 중입니다.";
				response.sendRedirect("http://localhost:8080/justwrites/firstPage");
				mav.addObject(msg);		
			   return mav;
		   }else {
			   mav.setViewName("/login");
		   }
		   		return mav;
	}
	
	
	@GetMapping("/firstPage")
	public void firstPage() {
		  
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
