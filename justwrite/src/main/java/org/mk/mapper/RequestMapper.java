package org.mk.mapper;

import org.apache.ibatis.annotations.Param;
import org.mk.domain.BookContent;
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
	
	public void bookCount(String ucode);

	public void bookWrite(BookContent novel);
	
	public BookContent checkChap(@Param("check") String check, @Param("checkChap") String checkChap);
	
	public void novelUpdate(BookContent novelUpdate);
	
	public void deleteChap(@Param("bookCode")String bookCode, @Param("chapName")String chapName);

	public void realWriteUpdate(BookContent novel);
}
