package org.salem.mapper;

import java.util.List;

import org.salem.domain.ReplyVO;

public interface ReplyMapper {

	public int replyInsert(ReplyVO reply);
	
	public List<ReplyVO> getreplyList(int bno);
	
	public int replyDelete(int rno);
	
	public int replyUpdate(ReplyVO reply);
	
	public List<ReplyVO> getListWithPaging(int bno);
	
}