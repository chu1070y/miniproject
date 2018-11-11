package org.salem.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.salem.domain.BoardVO;
import org.salem.domain.PageDTO;
import org.salem.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class DataSourceTests {

	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Test
	public void test1() {
		log.info("111111");
		PageDTO pageDTO = new PageDTO();
		pageDTO.setSkip(0);
		pageDTO.setDisplay(10);
		log.info(mapper.select(pageDTO));
	}
	
	@Test
	public void test2() {
		log.info("22222222");
		
		BoardVO vo = new BoardVO();
		vo.setTitle("Á×±â»ì±â");
		vo.setId("salem");
		vo.setContent("1!23213");
		
		log.info(mapper.register(vo));
	}
	
	@Test
	public void test3() {
		log.info("3333333333");
		
		PageDTO pageDTO = new PageDTO();
		pageDTO.setBno(3);
		log.info(mapper.read(pageDTO));
	}

	@Test
	public void test4() {
		log.info("44444444444");
		PageDTO pageDTO = new PageDTO();
		pageDTO.setBno(821);
		log.info(mapper.delete(pageDTO));
	}
	
	@Test
	public void test5() {
		log.info("555555555555");
		
		BoardVO vo = new BoardVO();
		vo.setTitle("°¡¾Ç°¡¾Ç");
		vo.setBno(1017);
		vo.setContent("1!23213");
		log.info(mapper.update(vo));
	}
	
	@Test
	public void test6() {
		log.info("6666666666666");
		PageDTO pageDTO = new PageDTO();
		log.info(mapper.count(pageDTO));
	}
	
	@Test
	public void test7() {
		log.info("7777777777777");
		
		PageDTO pageDTO = new PageDTO();
//		pageDTO.setKeyword("a");
//		pageDTO.setType("tw");
		
		log.info(mapper.search(pageDTO));
	}
	

}
