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
	private String userCode;
	private String bookName;
	private String bookGenre;
	private String bookEx;
	private String bookCover;
	private Date dateDate;
	
	

}
