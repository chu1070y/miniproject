package org.salem.service;

import org.salem.domain.AuthVO;
import org.salem.domain.MemberVO;
import org.salem.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;

@Service
public class LoginServiceImp implements LoginService{

	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Override
	public int checkId(MemberVO vo) {
		
		return mapper.checkId(vo);
	}

	@Override
	public int insertMember(MemberVO vo) {
		
		return mapper.insertMember(vo);
	}

	@Override
	public int insertAuth(AuthVO auth) {
		
		return mapper.insertAuth(auth);
	}

}
