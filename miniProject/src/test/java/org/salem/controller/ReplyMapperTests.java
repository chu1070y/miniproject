package org.salem.controller;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.salem.domain.ReplyPageDTO;
import org.salem.domain.ReplyVO;
import org.salem.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Test
	public void testMapper() {
		log.info(mapper);
	}
	
	@Test
	public void testCreate() {
		
		ReplyVO reply = new ReplyVO();
		reply.setBno(6);
		reply.setId("salem");
		reply.setReply("댓글만들기 시작2");
		
		mapper.replyInsert(reply);
	}
	
	@Test
	public void testRead() {
		int targetBno = 6;
		List<ReplyVO> reply = mapper.getreplyList(targetBno);
		
		log.info(reply);
	}
	
	@Test
	public void testDelete() {
		int targetRno = 3;
		mapper.replyDelete(targetRno);
	}
	
	@Test
	public void testUpdate() {
		
		ReplyVO reply = new ReplyVO();
		reply.setRno(2);
		reply.setReply("즈기여");
		
		mapper.replyUpdate(reply);
		
	}
	
	@Test
	public void testList2() {
		ReplyPageDTO dto = new ReplyPageDTO();
		dto.setBno(6);
		dto.setPage(1);
		
		List<ReplyVO> replyList = mapper.getListWithPaging(dto);
		
		replyList.forEach(reply -> log.info(reply));
	}
	
}
