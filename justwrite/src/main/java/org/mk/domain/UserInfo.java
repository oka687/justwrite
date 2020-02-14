package org.mk.domain;

import java.util.Date;


import lombok.Data;


@Data
public class UserInfo {
	
	
	private String userCode;
	private String id;
	private String pw;
	private String nickName;
	private String eMail;
	private int bookCount;
	private Date reDate;
	private String bookCode;
	

}
