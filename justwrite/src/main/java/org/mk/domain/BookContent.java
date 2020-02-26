package org.mk.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data

public class BookContent {
	
	
	private String bookName;
	private String bookCode;
	private String content;
	private int chapNo;
	private String chapName;
	private String updateDate;
	private int textCount;
	

}
