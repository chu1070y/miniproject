package org.salem.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	
	private String id;
	private String pw;
	private String name;
	
	private Date regdate;
	private Date updatedate;
	private List<AuthVO> authList;
}
