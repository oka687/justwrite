package org.mk.service;

import org.mk.domain.BookContent;
import org.mk.domain.BookInfo;
import org.mk.domain.ChapCount;
import org.mk.domain.Login;
import org.mk.domain.UserInfo;

public interface WriteRequestService {
	
	
	public UserInfo idCheck(String id);
	
	public UserInfo nickCheck(String nick);
	
	public Login loginc(Login login);
	
	public UserInfo takeUser(String id);
	
	public void novelMake(BookInfo binfo);
	
	public BookInfo novelNameCheck(String bookCode);
	
	public void bookCount(String ucode);
	
	public void bookWrite(BookContent novel);
	
	public BookContent checkChap(String check, String checkChap);
	
	public void novelUpdate(BookContent novel);
	
	public void realWriteUpdate(BookContent novel);
	
	public void deleteChap(String bookCode, String chapName);
	
	public int chapCount(String bookCode);
	
	public void updateCount(String bookCode, int bookCount);
	
	public void fixCount(String bookCode, int bookCount);
	
	public String nullCheck(String bookCode);
	
	public void deleteBookInfo(String ucode, String bookCode);
	
	public void deleteBookChap(String bookCode);
	
	public void bookCode(String bookCode);
	
}
