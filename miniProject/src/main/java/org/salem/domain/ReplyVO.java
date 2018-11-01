package org.salem.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	
	private int rno;
	private int bno,gno,ord;
	
	private String reply;
	private String id;
	private Date regDate;
	private Date updateDate;
}
