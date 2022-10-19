package com.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.OrderDAO;
import com.dao.StateDAO;
import com.dto.OrderDTO;
import com.dto.StateDTO;

public class StateService {

	public StateDTO curStateSelect() {
		
		SqlSession session = MySqlSessionFactory.getSession();
		StateDTO dto = null;
		try {
			  StateDAO dao = new StateDAO();
			  dto = dao.curStateSelect(session);
		      }finally {
				session.close();
		      }
		      return dto;
	}// end select()
	
}
