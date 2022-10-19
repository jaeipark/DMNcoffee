package com.dto;

public class StateDTO {
	
	
	int y;
	int n;
	int yn;
	
	
	public StateDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StateDTO(int y, int n, int yn) {
		super();
		this.y = y;
		this.n = n;
		this.yn = yn;
	}
	
	
	public int getY() {
		return y;
	}
	public void setY(int y) {
		this.y = y;
	}
	public int getN() {
		return n;
	}
	public void setN(int n) {
		this.n = n;
	}
	public int getYn() {
		return yn;
	}
	public void setYn(int yn) {
		this.yn = yn;
	}
	
	
	@Override
	public String toString() {
		return "StateDTO [y=" + y + ", n=" + n + ", yn=" + yn + "]";
	}
	
}
