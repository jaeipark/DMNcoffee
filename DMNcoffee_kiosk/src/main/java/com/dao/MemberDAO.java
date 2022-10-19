package com.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.MemberDTO;
@Repository
public class MemberDAO {
	@Autowired
	SqlSessionTemplate template;
	
	public MemberDTO selectMember(Map<String, Object> phoneNum) {
		MemberDTO mdto = template.selectOne("selectMember",phoneNum);
		return mdto;
	}

	public void updateMember(Map<String, Object> memberInfo) {
		template.update("updateMember",memberInfo);
	}

	public void memberAdd(MemberDTO mdto) {
		template.insert("memberAdd",mdto);
	}

}
