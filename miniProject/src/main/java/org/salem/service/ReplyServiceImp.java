package org.salem.service;

import java.util.List;

import org.salem.domain.ReplyPageDTO;
import org.salem.domain.ReplyVO;
import org.salem.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ReplyServiceImp implements ReplyService{

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Override
	public int replyInsert(ReplyVO reply) {
		// TODO Auto-generated method stub
		return mapper.replyInsert(reply);
	}

	@Override
	public List<ReplyVO> getreplyList(int bno) {
		// TODO Auto-generated method stub
		return mapper.getreplyList(bno);
	}

	@Override
	public int replyDelete(int rno) {
		// TODO Auto-generated method stub
		return mapper.replyDelete(rno);
	}

	@Override
	public int replyUpdate(ReplyVO reply) {
		// TODO Auto-generated method stub
		return mapper.replyUpdate(reply);
	}

	@Override
	public List<ReplyVO> getListWithPaging(ReplyPageDTO dto) {
		// TODO Auto-generated method stub
		return mapper.getListWithPaging(dto);
	}

	@Override
	public ReplyVO replyRead(int rno) {
		// TODO Auto-generated method stub
		return mapper.replyRead(rno);
	}

	@Override
	public int getCountByBno(int bno) {
		// TODO Auto-generated method stub
		return mapper.getCountByBno(bno);
	}
	
}
