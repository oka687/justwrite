package org.mk.mapper;

import org.mk.domain.BookInfo;
import org.mk.domain.Login;
import org.mk.domain.UserInfo;

public interface WriteMapper {
	
	

	
//	public BookInfo read(String bookinfo);
	
	//public List<BookInfo> getList(String id);
	
//	public void insert(BookInfo book);
	
//	public int delete(String bookCode);
//	
//	public int update(BookInfo book);
	
	public void userRegist(UserInfo info);
	
	public UserInfo readUser(String id);
	
	public Login loginc(Login login);

	public void novelMake(BookInfo binfo);
	
//	
//	public List<BoardVO> getListWithPaging(Criteria cri);
	
	
}
