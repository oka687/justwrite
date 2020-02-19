package org.mk.service;

import java.util.List;

import org.mk.domain.BookInfo;
import org.mk.domain.Login;
import org.mk.domain.UserInfo;
import org.mk.mapper.WriteMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;

@Service

public class WriteServiceImpl implements WriteService {
	
    @Setter(onMethod = @__({ @Autowired }))
	private WriteMapper mapper;

	
	@Override
	public void userRegist(UserInfo info) {
		System.out.println("서비스 쪽 시작"+info);
		
		
		mapper.userRegist(info);
		System.out.println("서비스 쪽 매퍼 지나옴"+info);
		
	}


	@Override
	public UserInfo readUser(String id) {
		
		return mapper.readUser(id);
	}


	@Override
	public UserInfo takeBookCount(String ucode) {
		
		return mapper.takeBookCount(ucode);
	}


	@Override
	public List<BookInfo> getList(String ucode) {
		
		return mapper.getList(ucode);
	}

	@Override
	public BookInfo getFind(String bookCode) {
		System.out.println("서비스 들어옴");
		System.out.println(bookCode);

		return mapper.getFind(bookCode);
	}
	



	

}
