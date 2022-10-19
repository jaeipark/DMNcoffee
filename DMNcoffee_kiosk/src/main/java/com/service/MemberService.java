package com.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.MemberDAO;
import com.dto.MemberDTO;
@Service
public class MemberService {
	@Autowired
	MemberDAO dao;
	
	
	public MemberDTO selectMember(Map<String, Object> phoneNum) {
		MemberDTO mdto = dao.selectMember(phoneNum);
		return mdto;
	}


	public void updateMember(Map<String, Object> memberInfo) {
		dao.updateMember(memberInfo);
		
	}


	public void memberAdd(MemberDTO mdto) {
		dao.memberAdd(mdto);
	}

}
