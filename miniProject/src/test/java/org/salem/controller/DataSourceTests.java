package org.salem.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.salem.domain.BoardVO;
import org.salem.mapper.Boardmapper;
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
	private Boardmapper mapper;
	
	@Test
	public void test1() {
		log.info("111111");
		log.info(mapper.select());
	}
	
	@Test
	public void test2() {
		log.info("22222222");
		
		BoardVO vo = new BoardVO();
		vo.setTitle("陛學陛學");
		vo.setMno(1);
		vo.setWriter("陛鼠億");
		vo.setContent("1!23213");
		
		log.info(mapper.register(vo));
	}
	
	@Test
	public void test3() {
		log.info("3333333333");
		log.info(mapper.read(3));
	}

	@Test
	public void test4() {
		log.info("44444444444");
		log.info(mapper.delete(824));
	}
	
	@Test
	public void test5() {
		log.info("555555555555");
		
		BoardVO vo = new BoardVO();
		vo.setTitle("陛學陛學");
		vo.setBno(1017);
		vo.setContent("1!23213");
		log.info(mapper.update(vo));
	}
	

}
