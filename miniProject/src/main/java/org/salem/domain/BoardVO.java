package org.salem.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	
	private int bno,del,view,good,bad;
	private String title,id,content;
	private Date regdate, updatedate;
	
	private int replyCnt;
	
	private List<BoardAttachVO> attachList;

}
