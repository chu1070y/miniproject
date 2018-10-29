package org.salem.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private int bno,mno,del,view,good,bad;
	private String title,writer,content;
	private Date regdate, updatedate;

}
