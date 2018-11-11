package org.salem.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.salem.domain.MemberVO;
import org.salem.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
@Log4j
public class MemberTests {
	
	@Setter(onMethod_ = @Autowired)
	private DataSource ds;
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Test
	public void testRead() {
		
		MemberVO vo = mapper.read("salem");
		log.info(vo);
		vo.getAuthList().forEach(authVO -> log.info(authVO));
	}
	
	@Test
	public void testInsertMember() {
		String sql = "insert into member(id,pw,name) values(?,?,?)";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, "admin");
			pstmt.setString(2, pwencoder.encode("admin"));
			pstmt.setString(3, "°ü¸®ÀÚ");
			
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {try{pstmt.close();}catch(Exception e){}}
			if(con != null) {try{con.close();}catch(Exception e){}}
		}
	}
	
	@Test
	public void testInsertAuth() {
		String sql = "insert into member_auth(id,auth) values(?,?)";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, "admin");
			pstmt.setString(2, "ROLE_MEMBER");
			
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {try{pstmt.close();}catch(Exception e){}}
			if(con != null) {try{con.close();}catch(Exception e){}}
		}
	}
}
