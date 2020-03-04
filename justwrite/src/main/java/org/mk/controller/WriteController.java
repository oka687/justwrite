package org.mk.controller;




import java.net.URLEncoder;

import javax.servlet.http.HttpSession;

import org.mk.domain.UserInfo;
import org.mk.mapper.WriteMapper;
import org.mk.service.PwEnc;
import org.mk.service.WriteService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
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
	@GetMapping("/findPage")
	public void findPage(@RequestParam("bookcode") String bookCode,Model model, @SessionAttribute("ucode") String ucode) {
			System.out.println("---------파인드페이지");

			
			
		
		model.addAttribute("bookinfo",service.getFind(bookCode));
		
		System.out.println(service.chapCount(bookCode));
		model.addAttribute("counter",service.chapCount(bookCode));
		
		
		
		if(service.getChap(bookCode).isEmpty()) {
			System.out.println("널입니다.");
			model.addAttribute("chap","null");
		}else {
		
		
		model.addAttribute("chap",service.getChap(bookCode));

		}
		
	}
	
	
	@GetMapping("/login")
	public void login() {
		
	
		
		
	}

	@GetMapping("/makeNovel")
	public void makeNovel() {
		
	}

	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		System.out.println("로그아웃 완료");
		
		return "redirect:/justwrites/login";
	}
	
	@GetMapping("/updateEd")
	public void updateEd(@RequestParam("bookName") String bookName, @RequestParam("chapName") String chapName,@SessionAttribute("ucode") String ucode,Model model) {
		
		String bookCode = bookName+ucode;
		
		System.out.println(bookCode);
		System.out.println(chapName);
		
		System.out.println(service.editNovel(bookCode,chapName));
		
		model.addAttribute("content",service.editNovel(bookCode,chapName));
		
		
		
	}
	
	@GetMapping("/firstPage")
	public void firstPage(@SessionAttribute("ucode") String ucode,Model model) {
		
	
		
		model.addAttribute("bookCount", service.takeBookCount(ucode).getBookCount());
		
		
		model.addAttribute("bookList",service.getList(ucode));
		System.out.println(service.getList(ucode));
		 
		
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
	
	
	
	
	
	@GetMapping("/editor")
	public void editor(String bookName, @SessionAttribute("ucode") String ucode, Model model){
				System.out.println(bookName);
			
				service.getChap(bookName+ucode);
				
				model.addAttribute("chaptor", service.getChap(bookName+ucode));
		
	}
	
	
	
	@GetMapping("/check")
	public String check(String bookName){
		System.out.println(bookName);
				
		if(bookName == null) {
			return "redirect:/justwrites/firstPage";
		}
		
		@SuppressWarnings("deprecation")
		String encodeURL = URLEncoder.encode(bookName);
	
		
		String writeURL="redirect:/justwrites/editor?bookName="+encodeURL;
						
		System.out.println(writeURL);
		return writeURL;
	}
	
	@GetMapping("/bookList")
	public void bookList(@SessionAttribute("ucode") String ucode,Model model) {
		
	
	
		
		
		
		model.addAttribute("bookList",service.bookList(ucode));
		
		

		
		
	}
	
	

}
