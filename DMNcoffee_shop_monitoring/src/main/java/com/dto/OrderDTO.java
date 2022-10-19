package com.dto;

public class OrderDTO {
	
	private String oderdate;
	private int orderseq;
	private int pdnum;
	private String pdnm;
	private String opt;
	private int amount;
	private int price;
	private String ordertakeout;
	private String complete_yn;
	
	public OrderDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderDTO(String oderdate, int orderseq, int pdnum, String pdnm, String opt, int amount, int price,
			String ordertakeout, String complete_yn) {
		super();
		this.oderdate = oderdate;
		this.orderseq = orderseq;
		this.pdnum = pdnum;
		this.pdnm = pdnm;
		this.opt = opt;
		this.amount = amount;
		this.price = price;
		this.ordertakeout = ordertakeout;
		this.complete_yn = complete_yn;
	}

	public String getOderdate() {
		return oderdate;
	}

	public void setOderdate(String oderdate) {
		this.oderdate = oderdate;
	}

	public int getOrderseq() {
		return orderseq;
	}

	public void setOrderseq(int orderseq) {
		this.orderseq = orderseq;
	}

	public int getPdnum() {
		return pdnum;
	}

	public void setPdnum(int pdnum) {
		this.pdnum = pdnum;
	}

	public String getPdnm() {
		return pdnm;
	}

	public void setPdnm(String pdnm) {
		this.pdnm = pdnm;
	}

	public String getOpt() {
		return opt;
	}

	public void setOpt(String opt) {
		this.opt = opt;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getOrdertakeout() {
		return ordertakeout;
	}

	public void setOrdertakeout(String ordertakeout) {
		this.ordertakeout = ordertakeout;
	}

	public String getComplete_yn() {
		return complete_yn;
	}

	public void setComplete_yn(String complete_yn) {
		this.complete_yn = complete_yn;
	}

	@Override
	public String toString() {
		return "OrderDTO [oderdate=" + oderdate + ", orderseq=" + orderseq + ", pdnum=" + pdnum + ", pdnm=" + pdnm
				+ ", opt=" + opt + ", amount=" + amount + ", price=" + price + ", ordertakeout=" + ordertakeout
				+ ", complete_yn=" + complete_yn + "]";
	}
		
}
