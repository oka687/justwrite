package org.mk.service;

import org.mk.domain.UserInfo;
import org.mk.mapper.RequestMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class WriteRequestServiceImp implements WriteRequestService {

	
	private RequestMapper mapper;
	
	@Override
	public UserInfo idCheck(UserInfo info) {
		
		
		
		
		return null;
	}

}
