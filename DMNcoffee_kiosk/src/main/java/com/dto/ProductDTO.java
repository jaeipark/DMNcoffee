package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("ProductDTO")
public class ProductDTO {
	
	private int pdno;
	private String pdnm;
	private int pdprice;
	private int ctno;
	private String ctnm;
	
	public ProductDTO() {
		super();
	}
	public ProductDTO(int pdno, String pdnm, int pdprice, int ctno, String ctnm) {
		super();
		this.pdno = pdno;
		this.pdnm = pdnm;
		this.pdprice = pdprice;
		this.ctno = ctno;
		this.ctnm = ctnm;
	}
	
	public int getPdno() {
		return pdno;
	}
	public void setPdno(int pdno) {
		this.pdno = pdno;
	}
	public String getPdnm() {
		return pdnm;
	}
	public void setPdnm(String pdnm) {
		this.pdnm = pdnm;
	}
	public int getPdprice() {
		return pdprice;
	}
	public void setPdprice(int pdprice) {
		this.pdprice = pdprice;
	}
	public int getCtno() {
		return ctno;
	}
	public void setCtno(int ctno) {
		this.ctno = ctno;
	}
	public String getCtnm() {
		return ctnm;
	}
	public void setCtnm(String ctnm) {
		this.ctnm = ctnm;
	}
	
	@Override
	public String toString() {
		return "ProductDTO [pdno=" + pdno + ", pdnm=" + pdnm + ", pdprice=" + pdprice + ", ctno=" + ctno + ", ctnm="
				+ ctnm + "]";
	}
	
}
