package org.mk.controller;
import java.io.File;
import java.io.IOException;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mk.domain.BookInfo;
import org.mk.domain.Login;
import org.mk.domain.UserInfo;
import org.mk.service.MakeFolder;
import org.mk.service.PwEnc;
import org.mk.service.WriteRequestService;
import org.mk.service.WriteService;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;

@RequestMapping("/request/")
@RestController
@AllArgsConstructor

public class WriteRequestController {
	
	private PwEnc enc;
	
	
	private WriteRequestService service;
	
	
	
	
	@PostMapping(value = "/idcheck", produces = "application/text; charset=UTF-8")
	  public String readUser(@RequestBody String id) {

		System.out.println(id);
	
		String[] splitid = id.split("=");
		
		String check = splitid[1];
	
			
		
			System.out.println("<-----컨트롤러------>");
		UserInfo recheck = service.idCheck(check);

		if(recheck == null) {
			System.out.println("success");
			
			return "success";
		}else {
			System.out.println("fail");
			return "fail";
		}
		
	}
	
	@PostMapping(value = "/nickcheck", produces = "application/text; charset=UTF-8")
	  public String readNick(@RequestBody String nick) {

		System.out.println(nick);
	
		String[] splitnic = nick.split("=");
		
		String nickch = splitnic[1];
	
			System.out.println("<-----컨트롤러------>");
		UserInfo nickRecheck = service.nickCheck(nickch);

		if(nickRecheck == null) {
			System.out.println("success");
			
			return "success";
		}else {
			System.out.println("fail");
			return "fail";
		} 
		
	}
	
	
	@PostMapping(value = "/loginp", produces = "application/json; charset=UTF-8")
	public String loginp(@RequestBody Login login, HttpServletRequest request, Model model) {
		
		String pw = login.getPw();
		
		String pwenc = enc.enc(pw);	
		login.setPw(pwenc);
		
		Login result = service.loginc(login);
		System.out.println(result);
		if(result != null) {
			System.out.println("로그인 성공");
			
			
			HttpSession session = request.getSession(true);
			
		
			
				UserInfo ucode = service.takeUser(login.getId());
			
				
			   session.setAttribute("ucode", ucode.getUserCode());
			   session.setAttribute("nick", ucode.getNickName());
	
			  
			return "success";
		}else {
			System.out.println("fail");
			return "fail";
		}
		
		
	}
	
	
	@Transactional
	@PostMapping(value = "/novelWrite",  produces = "application/text; charset=UTF-8")
	  public String novelWrite(@SessionAttribute("ucode") String ucode, MultipartFile[] uploadFile, BookInfo binfo, Model model) {
	
		
		String upload = "C:/Users/oka68/git/justwrite/justwrite/src/main/webapp/resources/imgstore/"+ucode;
			MakeFolder makefolder = new MakeFolder();
			
			makefolder.making(upload);
		
			System.out.println(binfo);
		String bookCode = binfo.getBookName()+ucode;
		binfo.setBookCode(bookCode);
		
		binfo.setUserCode(ucode);
		
		System.out.println(bookCode);
		
		 BookInfo checker = service.novelNameCheck(bookCode);
		


		

		
		

		if(checker == null) {
			
			
		if(uploadFile.length != 0) {
		
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
			System.out.println("저장소 :"+upload+"/"+multipartFile.getOriginalFilename());
		}
			
		}else {
			System.out.println("사진 없음!");
			binfo.setBookCover("\"C:/Users/oka68/git/justwrite/justwrite/src/main/webapp/resources/imgstore/gibon.png");
		}
		
		
			service.novelMake(binfo);
			return "redirect:/justwrites/findPage";
		}
		
		return "fail";
	  }
	
	
	
	
	
	
	
	
	
	
}
