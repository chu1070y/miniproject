package org.salem.service;

import java.util.List;

import org.salem.domain.BoardAttachVO;
import org.salem.domain.BoardVO;
import org.salem.domain.PageDTO;
import org.salem.mapper.BoardAttachMapper;
import org.salem.mapper.Boardmapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BoardserviceImp implements Boardservice{
	
	@Setter(onMethod_ = @Autowired)
	private Boardmapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardAttachMapper attachMapper;

	@Override
	public List<BoardVO> getList(PageDTO pageDTO) {
		
		return mapper.select(pageDTO);
	}

	@Transactional
	@Override
	public int register(BoardVO vo) {
		
		log.info("register...." + vo);

		if(vo.getAttachList() == null || vo.getAttachList().size() <= 0) {
			return mapper.register(vo);
		}
		
		int result = mapper.register(vo);
		
		vo.getAttachList().forEach(attach -> {
			attach.setBno(mapper.key());
			attachMapper.insert(attach);
		});
		
		return result;
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

	@Override
	public List<BoardAttachVO> getAttachList(int bno) {
		
		return attachMapper.findByBno(bno);
	}

}
