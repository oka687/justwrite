package org.mk.mapper;

import org.mk.domain.BookInfo;
import org.mk.domain.Login;
import org.mk.domain.UserInfo;

public interface RequestMapper {
	
	

	public UserInfo idCheck(String id);
	
	public UserInfo nickCheck(String nick);
	
	public Login loginc(Login login);
	
	public UserInfo takeUser(String id);
	
	public void novelMake(BookInfo binfo);
	
	public BookInfo novelNameCheck(String bookCode);
}
