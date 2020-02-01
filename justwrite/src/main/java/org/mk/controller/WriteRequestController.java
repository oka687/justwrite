package org.mk.controller;
import org.mk.domain.UserInfo;
import org.mk.service.WriteRequestService;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;

@RequestMapping("/request/")
@RestController
@AllArgsConstructor

public class WriteRequestController {
	
	
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

}
