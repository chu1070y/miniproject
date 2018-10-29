package org.salem.mapper;

import java.util.List;

import org.salem.domain.BoardVO;

public interface Boardmapper {
	
	public List<BoardVO> select();
	
	public int register(BoardVO vo);
	
	public BoardVO read(int bno);
	
	public int delete(int bno);
	
	public int update(BoardVO vo);
	
	
}
