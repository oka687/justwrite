package org.mk.service;

import org.mk.domain.BookContent;
import org.mk.domain.BookInfo;
import org.mk.domain.ChapCount;
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
	
	@Override
	public void novelMake(BookInfo binfo) {
		
		mapper.novelMake(binfo);
		
	}

	@Override
	public BookInfo novelNameCheck(String bookCode) {
		
		
		
		return mapper.novelNameCheck(bookCode);
	}

	@Override
	public void bookCount(String ucode) {
		
		mapper.bookCount(ucode);
		
	}

	@Override
	public void bookWrite(BookContent novel) {
		
		mapper.bookWrite(novel);
		
	}


	@Override
	public BookContent checkChap(String check, String checkChap) {
		// TODO Auto-generated method stub
		return mapper.checkChap(check,checkChap);
	}

	@Override
	public void novelUpdate(BookContent novel) {
		
		mapper.novelUpdate(novel);
		
	}

	@Override
	public void deleteChap(String bookCode, String chapName) {
		
		mapper.deleteChap(bookCode,chapName);
		
	}

	@Override
	public void realWriteUpdate(BookContent novel) {
		
		mapper.realWriteUpdate(novel);
		
	}

	@Override
	public int chapCount(String bookCode) {
		
		return mapper.chapCount(bookCode);
	}

	@Override
	public void updateCount(String bookCode, int bookCount) {

		
		mapper.updateCount(bookCode, bookCount);
		
	}

	@Override
	public void fixCount(String bookCode, int bookCount) {
		
		mapper.fixCount(bookCode,bookCount);
		
	}

	@Override
	public String nullCheck(String bookCode) {
		
		return mapper.nullCheck(bookCode);
	}

	@Override
	public void deleteBookInfo(String ucode, String bookCode) {
		
		mapper.deleteBookInfo(ucode, bookCode);
		
	}

	@Override
	public void bookCode(String bookCode) {
		
		mapper.deleteBookChap(bookCode);
		
	}

	@Override
	public void deleteBookChap(String bookCode) {
		
		mapper.deleteBookChap(bookCode);
		
	}
	
	



}
