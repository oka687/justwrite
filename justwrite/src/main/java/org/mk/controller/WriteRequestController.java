package org.mk.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mk.domain.Login;
import org.mk.domain.UserInfo;
import org.mk.service.PwEnc;
import org.mk.service.WriteRequestService;
import org.mk.service.WriteService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;

@RequestMapping("/request/")
@RestController
@AllArgsConstructor

public class WriteRequestController {
	
	private PwEnc enc;
	
	
	private WriteRequestService service;
	private WriteService writeService;
	
	
	
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
	public String loginp(@RequestBody Login login, HttpServletRequest request) {
		
		String pw = login.getPw();
		
		String pwenc = enc.enc(pw);	
		login.setPw(pwenc);
		
		Login result = service.loginc(login);
		System.out.println(result);
		if(result != null) {
			System.out.println("로그인 성공");
			
			
			HttpSession session = request.getSession(true);
			
			UserInfo info = writeService.readUser(login.getId());
			
			String nick = info.getNickName();
			
			   session.setAttribute("id", login.getId());
			   session.setAttribute("nick", nick);
			  
			return "success";
		}else {
			System.out.println("fail");
			return "fail";
		}
		
		
	}
	
	
}
