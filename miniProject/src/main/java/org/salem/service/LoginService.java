package org.salem.service;

import org.salem.domain.AuthVO;
import org.salem.domain.MemberVO;

public interface LoginService {
	
	public int checkId(MemberVO vo); 
	
	public int insertMember(MemberVO vo);
	
	public int insertAuth(AuthVO auth);
}
