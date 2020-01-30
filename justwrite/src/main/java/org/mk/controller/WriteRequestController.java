package org.mk.controller;
import org.mk.service.WriteRequestService;
import org.springframework.http.MediaType;
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
	
	@PostMapping(value = "/idcheck",produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	  public String readUser(@RequestBody String id) {
		System.out.println("값");
		System.out.println(id);
		
		
			System.out.println("<-----컨트롤러------>");
		String check = service.idCheck(id).getId();

		if(check == null) {
			return "아이디 있음";
		}else {
			return "아이이 없음";
		}
	
	}

}
