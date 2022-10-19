package com.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.EmpDAO;
import com.dto.EmpDTO;

public class EmpService {

	
	public int idCheck(String userid) {
		SqlSession session = MySqlSessionFactory.getSession();
		int count = 0;
		try {
			EmpDAO dao = new EmpDAO();
			count = dao.idCheck(session, userid);
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return count;
	}//end idCheck



	public EmpDTO login(HashMap<String, String> map) {
		SqlSession session = MySqlSessionFactory.getSession();
		EmpDTO dto = null;
		try {
			EmpDAO dao = new EmpDAO();
			dto = dao.login(session,map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return dto;
	}//end login





		  
}//end class
