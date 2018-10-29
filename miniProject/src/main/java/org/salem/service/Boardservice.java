package org.salem.service;

import java.util.List;

import org.salem.domain.BoardVO;

public interface Boardservice {

	public List<BoardVO> getList();
	
	public int register(BoardVO vo);
	
	public BoardVO read(int bno);
	
	public int delete(int bno);
	
	public int update(BoardVO vo);
}
