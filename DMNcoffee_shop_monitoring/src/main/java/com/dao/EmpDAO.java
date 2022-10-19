package com.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.dto.EmpDTO;

public class EmpDAO {

	public int idCheck(SqlSession session, String userid) {
		int count = session.selectOne("EmpMapper.idCheck",userid);
		return count;
	}

	public EmpDTO login(SqlSession session, HashMap<String, String> map) {
		EmpDTO n = session.selectOne("EmpMapper.login",map);
		return n;
	}


}
