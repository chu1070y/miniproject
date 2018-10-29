package org.salem.service;

import java.util.List;

import org.salem.domain.BoardVO;
import org.salem.mapper.Boardmapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;

@Service
public class BoardserviceImp implements Boardservice{
	
	@Setter(onMethod_ = @Autowired)
	Boardmapper mapper;

	@Override
	public List<BoardVO> getList() {
		
		return mapper.select();
	}

	@Override
	public int register(BoardVO vo) {
		
		return mapper.register(vo);
	}

	@Override
	public BoardVO read(int bno) {
		
		return mapper.read(bno);
	}

	@Override
	public int delete(int bno) {
		
		return mapper.delete(bno);
	}

	@Override
	public int update(BoardVO vo) {
		
		return mapper.update(vo);
	}

}
