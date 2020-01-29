package org.mk.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookInfo {
	
	
	private String bookCode;
	private String userInfo_userCode;
	private String bookName;
	private String bookCover;
	private Date dateDate;
	
	

}
