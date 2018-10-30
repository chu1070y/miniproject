package org.salem.mapper;

import java.util.List;

import org.salem.domain.BoardVO;
import org.salem.domain.PageDTO;

public interface Boardmapper {
	
	public List<BoardVO> select(PageDTO pageDTO);
	
	public int register(BoardVO vo);
	
	public BoardVO read(PageDTO pageDTO);
	
	public int delete(PageDTO pageDTO);
	
	public int update(BoardVO vo);
	
	public int count(PageDTO pageDTO);
	
	public List<BoardVO> search(PageDTO pageDTO);
}
