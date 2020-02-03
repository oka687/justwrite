package org.mk.service;
import org.mk.domain.Login;
import org.mk.domain.UserInfo;

public interface WriteService {
	
//		public void write(BookInfo book);
//
//		public boolean delete(String BookCode);
//		
//		public boolean update(BookInfo book);
//		
		public UserInfo readUser(String id);
		

//		
//		public List<BookInfo> getList(String id);
//		
		public void userRegist(UserInfo info);

}
