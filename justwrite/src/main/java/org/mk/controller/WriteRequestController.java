package org.mk.controller;
import org.mk.domain.UserInfo;
import org.mk.service.WriteService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;

@RequestMapping("/idcheck")
@RestController
@AllArgsConstructor

public class WriteRequestController {
	
	
	private WriteService service;
	
	@GetMapping(value = "/regist")
	  public void readUser(@RequestBody UserInfo info) {
		System.out.println("dddd"+info);
		 service.userRegist(info);
		 
	 //   return "redirect:/justwrite/login";
	  }
	
	
	

}
