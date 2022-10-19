package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("LogDTO")
public class LogDTO {
	
	private String phone2;
	private String phone3;
	private String datelog;
	private String status;
	private String pointlog;
	
	public LogDTO() {
		super();
	}
	public LogDTO(String phone2, String phone3, String datelog, String status, String pointlog) {
		super();
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.datelog = datelog;
		this.status = status;
		this.pointlog = pointlog;
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
	public String getDatelog() {
		return datelog;
	}
	public void setDatelog(String datelog) {
		this.datelog = datelog;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPointlog() {
		return pointlog;
	}
	public void setPointlog(String pointlog) {
		this.pointlog = pointlog;
	}
	
	@Override
	public String toString() {
		return "LogDTO [phone2=" + phone2 + ", phone3=" + phone3 + ", datelog=" + datelog + ", status=" + status
				+ ", pointlog=" + pointlog + "]";
	}
	
}
