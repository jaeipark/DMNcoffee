package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("MemberDTO")
public class MemberDTO {
	
	private int memno;
	private String phone1;
	private String phone2;
	private String phone3;
	private int mempoint;
	private String stampcheck;
	
	public MemberDTO() {
		super();
	}
	public MemberDTO(int memno, String phone1, String phone2, String phone3, int mempoint, String stampcheck) {
		super();
		this.memno = memno;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.mempoint = mempoint;
		this.stampcheck = stampcheck;
	}
	
	public MemberDTO(String phone1, String phone2, String phone3, int mempoint, String stampcheck) {
		super();
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.mempoint = mempoint;
		this.stampcheck = stampcheck;
	}
	public int getMemno() {
		return memno;
	}
	public void setMemno(int memno) {
		this.memno = memno;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public int getMempoint() {
		return mempoint;
	}
	public void setMempoint(int mempoint) {
		this.mempoint = mempoint;
	}
	public String getStampcheck() {
		return stampcheck;
	}
	public void setStampcheck(String stampcheck) {
		this.stampcheck = stampcheck;
	}
	
	@Override
	public String toString() {
		return "MemberDTO [memno=" + memno + ", phone1=" + phone1 + ", phone2=" + phone2 + ", phone3=" + phone3
				+ ", mempoint=" + mempoint + ", stampcheck=" + stampcheck + "]";
	}
	
}
