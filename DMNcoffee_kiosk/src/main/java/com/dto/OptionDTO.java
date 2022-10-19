package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("OptionDTO")
public class OptionDTO {
	
	private int optno;
	private String optnm;
	private int optprice;
	private int ctno;
	
	public OptionDTO() {
		super();
	}
	public OptionDTO(int optno, String optnm, int optprice, int ctno) {
		super();
		this.optno = optno;
		this.optnm = optnm;
		this.optprice = optprice;
		this.ctno = ctno;
	}
	
	public int getOptno() {
		return optno;
	}
	public void setOptno(int optno) {
		this.optno = optno;
	}
	public String getOptnm() {
		return optnm;
	}
	public void setOptnm(String optnm) {
		this.optnm = optnm;
	}
	public int getOptprice() {
		return optprice;
	}
	public void setOptprice(int optprice) {
		this.optprice = optprice;
	}
	public int getCtno() {
		return ctno;
	}
	public void setCtno(int ctno) {
		this.ctno = ctno;
	}
	
	@Override
	public String toString() {
		return "OptionDTO [optno=" + optno + ", optnm=" + optnm + ", optprice=" + optprice + ", ctno=" + ctno + "]";
	}
	
}
