package org.mk.service;
import java.util.List;

import org.mk.domain.BookContent;
import org.mk.domain.BookInfo;
import org.mk.domain.UserInfo;

public interface WriteService {
	
//		public void write(BookInfo book);
//
//		public boolean delete(String BookCode);
//		
//		public boolean update(BookInfo book);
//		
		public UserInfo readUser(String id);
		
		public BookInfo getFind(String bookCode);
		
		public List<BookContent> getChap(String bookCode);
	
		public UserInfo takeBookCount(String ucode);
//		
		public List<BookInfo> getList(String ucode);
//		
		public void userRegist(UserInfo info);
		
		public BookContent editNovel(String bookCode,String chapName);

}
