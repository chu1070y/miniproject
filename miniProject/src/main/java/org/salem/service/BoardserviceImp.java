package org.salem.service;

import java.util.List;

import org.salem.domain.BoardVO;
import org.salem.domain.PageDTO;
import org.salem.mapper.Boardmapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;

@Service
public class BoardserviceImp implements Boardservice{
	
	@Setter(onMethod_ = @Autowired)
	Boardmapper mapper;

	@Override
	public List<BoardVO> getList(PageDTO pageDTO) {
		
		return mapper.select(pageDTO);
	}

	@Override
	public int register(BoardVO vo) {
		
		return mapper.register(vo);
	}

	@Override
	public BoardVO read(PageDTO pageDTO) {
		
		return mapper.read(pageDTO);
	}

	@Override
	public int delete(PageDTO pageDTO) {
		
		return mapper.delete(pageDTO);
	}

	@Override
	public int update(BoardVO vo) {
		
		return mapper.update(vo);
	}

	@Override
	public int count(PageDTO pageDTO) {
		
		return mapper.count(pageDTO);
	}

	@Override
	public List<BoardVO> search(PageDTO pageDTO) {
		
		return mapper.search(pageDTO);
	}

}
