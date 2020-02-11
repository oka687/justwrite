package org.mk.controller;


import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.mk.domain.BookInfo;
import org.mk.domain.UserInfo;
import org.mk.service.PwEnc;
import org.mk.service.WriteService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
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
	@GetMapping("/findPage")
	public void findPage() {
		
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
	
	
	@PostMapping("/novelWrite")
	  public String novelWrite(@SessionAttribute("ucode") String ucode, MultipartFile[] uploadFile, BookInfo binfo, Model model) {
		
			
		String bookCode = binfo.getBookName()+ucode;
		binfo.setBookCode(bookCode);
		
		binfo.setUserCode(ucode);
		
		System.out.println(bookCode);
		
		String upload = "C:/Users/oka68/git/justwrite/justwrite/src/main/webapp/resources/imgstore";
		
		if(uploadFile != null) {
		
			System.out.println("사진 있음!");
		for(MultipartFile multipartFile : uploadFile) {
			System.out.println("---------");
			System.out.println("업로드 파일 이름 :"+multipartFile.getOriginalFilename());
			System.out.println("업로드 파일 사이즈 :"+multipartFile.getSize());
		
			File saveFile = new File(upload, multipartFile.getOriginalFilename());
		
			try {
				multipartFile.transferTo(saveFile);
			} catch (IllegalStateException | IOException e) {
				
				e.printStackTrace();
			}
			binfo.setBookCover(upload+"/"+multipartFile.getOriginalFilename());
			System.out.println("저장소 :"+upload+multipartFile.getOriginalFilename());
		}
			
		}else {
			System.out.println("사진 없음!");
			binfo.setBookCover(upload+"/gibon.png");
		}
		
			service.novelMake(binfo);
			return "redirect:/justwrites/findPage";
	  }
	
	
	
	
	
	@GetMapping("/editor")
	public void editor() {
		
	}
	
	

}
