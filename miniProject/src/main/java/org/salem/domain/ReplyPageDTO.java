package org.salem.domain;

import java.util.List;

import lombok.Data;
import lombok.extern.log4j.Log4j;

@Log4j
@Data
public class ReplyPageDTO {

	private int page, skip, start, end, total, bno;
	private boolean prev, next;
	
	private List<ReplyVO> list;
	
	
	public ReplyPageDTO() {
		this.prev = true;
		this.next = true;
		this.page = 1;
		this.total = 0;
	}
	
	public int getSkip() {
		
		return (this.page - 1) * 10;
	}
	
	public void setTotal(int total) {
		this.total = total;
		this.end = (int) (Math.ceil(this.page/10.0) * 10);
		this.start = this.end - 9;
		
		log.info("total: "+ total);

		
		if((this.end * 10) > this.total) {
			this.end = (int) Math.ceil(this.total/10.0);
			this.next = false;
		}
		
		if(this.start == 1) {
			this.prev = false;
		}
		
	}
}
