package org.salem.mapper;

import org.salem.domain.AuthVO;
import org.salem.domain.MemberVO;

public interface MemberMapper {

	public MemberVO read(String id);
	
	public int checkId(MemberVO vo); 
	
	public int insertMember(MemberVO vo);
	
	public int insertAuth(AuthVO auth);
}
