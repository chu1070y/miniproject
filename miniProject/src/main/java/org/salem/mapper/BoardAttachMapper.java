package org.salem.mapper;

import java.util.List;

import org.salem.domain.BoardAttachVO;

public interface BoardAttachMapper {
	
	public void insert(BoardAttachVO vo);
	
	public void delete(String uuid);
	
	public List<BoardAttachVO> findByBno(int bno);
	
	public void deleteAll(int bno);
	
}
