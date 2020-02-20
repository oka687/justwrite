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
	private String chapNo;
	private String chapName;
	private Date updateDate;
	
	

}
