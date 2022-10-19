package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("CartDTO")
public class CartDTO {
	
	private String pdno;
	private String pdnm;
	private int amount;
	private int totalprice;
	private String opt;
	private String ctnm;
	private int pdnum;
	
	public CartDTO() {
		super();
	}
	public CartDTO(String pdno, String pdnm, int amount, int totalprice, String opt, String ctnm, int pdnum) {
		super();
		this.pdno = pdno;
		this.pdnm = pdnm;
		this.amount = amount;
		this.totalprice = totalprice;
		this.opt = opt;
		this.ctnm = ctnm;
		this.pdnum = pdnum;
	}
	public CartDTO(String pdno, String pdnm, int amount, int totalprice, String opt, String ctnm) {
		super();
		this.pdno = pdno;
		this.pdnm = pdnm;
		this.amount = amount;
		this.totalprice = totalprice;
		this.opt = opt;
		this.ctnm = ctnm;
	}
	public String getPdno() {
		return pdno;
	}
	public void setPdno(String pdno) {
		this.pdno = pdno;
	}
	public String getPdnm() {
		return pdnm;
	}
	public void setPdnm(String pdnm) {
		this.pdnm = pdnm;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public String getOpt() {
		return opt;
	}
	public void setOpt(String opt) {
		this.opt = opt;
	}
	public String getCtnm() {
		return ctnm;
	}
	public void setCtnm(String ctnm) {
		this.ctnm = ctnm;
	}
	public int getPdnum() {
		return pdnum;
	}
	public void setPdnum(int pdnum) {
		this.pdnum = pdnum;
	}
	
	@Override
	public String toString() {
		return "CartDTO [pdno=" + pdno + ", pdnm=" + pdnm + ", amount=" + amount + ", totalprice=" + totalprice
				+ ", opt=" + opt + ", ctnm=" + ctnm + ", pdnum=" + pdnum + "]";
	}
	
}
