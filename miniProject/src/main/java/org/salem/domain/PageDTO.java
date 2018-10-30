package org.salem.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;
import lombok.extern.log4j.Log4j;

@Log4j
@Data
public class PageDTO {
	
	private int page, skip, display, start, end, total,bno;
	private boolean prev, next;
	
	private String keyword;
	private String type;
	private String[] typeArr;
	
	public PageDTO() {
		this.keyword="";
		this.type="";
		this.prev = true;
		this.next = true;
		this.page = 1;
		this.display = 10;
		this.total = 0;
	}
	
	public int getSkip() {
		
		return (this.page - 1) * this.display;
	}
	
	public void setTotal(int total) {
		this.total = total;
		this.end = (int) (Math.ceil(this.page/10.0) * 10);
		this.start = this.end - 9;
		
		log.info("total: "+ total);

		
		if((this.end * this.display) > this.total) {
			this.end = (int) Math.ceil(this.total/(double)this.display);
			this.next = false;
		}
		
		if(this.start == 1) {
			this.prev = false;
		}
		
	}
	
	public String[] getTypeArr() {
		
		this.typeArr = new String[this.type.length()];
		
		for(int i = 0 ; i < this.type.length() ; i++) {
			this.typeArr[i] = this.type.substring(i, i+1);
		}
		
		return this.typeArr;
	}
	
	public String getLink(String path) {
		
		return UriComponentsBuilder.fromPath(path)
				.queryParam("bno", this.bno)
				.queryParam("page", this.page)
				.queryParam("type", this.type)
				.queryParam("display", this.display)
				.queryParam("keyword", this.keyword)
				.toUriString();
	}
	
	

}



