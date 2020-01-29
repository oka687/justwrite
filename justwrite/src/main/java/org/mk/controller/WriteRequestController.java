package org.mk.controller;
import org.mk.domain.UserInfo;
import org.mk.service.WriteRequestService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;

@RequestMapping("/request")
@RestController
@AllArgsConstructor

public class WriteRequestController {
	
	
	private WriteRequestService service;
	
	@GetMapping(value = "/idcheck")
	  public void readUser(@RequestBody UserInfo info) {
		
		service.idCheck(info);
		
		
		 
	 //   return "redirect:/justwrite/login";
	  }
	
	
	

}
