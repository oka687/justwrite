package org.mk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mk.domain.BookContent;
import org.mk.domain.BookInfo;
import org.mk.domain.BookList;
import org.mk.domain.Login;
import org.mk.domain.UserInfo;

public interface WriteMapper {
	
	

	

	
	public List<BookInfo> getList(String ucode);
	

	
	public void userRegist(UserInfo info);
	
	public UserInfo readUser(String id);
	
	public Login loginc(Login login);
	
	public BookInfo getFind(String bookCode);
	
	public List<BookContent> getChap(String bookCode);

	public UserInfo takeBookCount(String ucode);
	
	public BookContent editNovel(@Param("bookCode")String bookCode,@Param("chapName")String chapName);
	
	public List<BookList> bookList(String ucode);

	public int chapCount(@Param("bookCode")String bookCode);
	
}
