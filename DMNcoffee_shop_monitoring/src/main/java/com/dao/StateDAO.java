package com.dao;

import org.apache.ibatis.session.SqlSession;

import com.dto.StateDTO;

public class StateDAO {

	public StateDTO curStateSelect(SqlSession session) {
		StateDTO dto=null;
		dto = session.selectOne("OrderMapper.curStateSelect");
		System.out.println("stdao curStateSelect ::: "+dto);
		return dto;
	}

}
