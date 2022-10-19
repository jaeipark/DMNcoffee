package com.dto;

public class EmpDTO {
	
	String userid;
	String passwd;
	String username;
	String phone1;
	String phone2;
	String phone3;
	String bday1;
	String bday2;
	String bday3;
	String email1;
	String email;
	String grade;
	
	public EmpDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public EmpDTO(String userid, String passwd, String username, String phone1, String phone2, String phone3,
			String bday1, String bday2, String bday3, String email1, String email, String grade) {
		super();
		this.userid = userid;
		this.passwd = passwd;
		this.username = username;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.bday1 = bday1;
		this.bday2 = bday2;
		this.bday3 = bday3;
		this.email1 = email1;
		this.email = email;
		this.grade = grade;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
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

	public String getBday1() {
		return bday1;
	}

	public void setBday1(String bday1) {
		this.bday1 = bday1;
	}

	public String getBday2() {
		return bday2;
	}

	public void setBday2(String bday2) {
		this.bday2 = bday2;
	}

	public String getBday3() {
		return bday3;
	}

	public void setBday3(String bday3) {
		this.bday3 = bday3;
	}

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "EmpDTO [userid=" + userid + ", passwd=" + passwd + ", username=" + username + ", phone1=" + phone1
				+ ", phone2=" + phone2 + ", phone3=" + phone3 + ", bday1=" + bday1 + ", bday2=" + bday2 + ", bday3="
				+ bday3 + ", email1=" + email1 + ", email=" + email + ", grade=" + grade + "]";
	}
	

}
