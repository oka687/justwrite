package org.mk.service;

import org.mk.domain.Login;
import org.mk.domain.UserInfo;
import org.mk.mapper.RequestMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class WriteRequestServiceImp implements WriteRequestService {

	
	private RequestMapper mapper;
	
	@Override
	public UserInfo idCheck(String id) {
		
			
			System.out.println("서비스에 id값들어옴: "+id);
			
		return mapper.idCheck(id);
	}

	@Override
	public UserInfo nickCheck(String nick) {
		
		System.out.println("서비스에 nick값들어옴: "+nick);
		
		
		return mapper.nickCheck(nick);
	}
	
	
	@Override
	public Login loginc(Login login) {
		
		return mapper.loginc(login);
	}

	@Override
	public UserInfo takeUser(String id) {
		
		return mapper.takeUser(id);
	}
	

}
