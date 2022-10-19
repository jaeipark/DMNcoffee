package com.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.OrderDAO;
import com.dto.OrderDTO;

public class OrderService {

	public List<OrderDTO> saleList(String yn) {
		
		SqlSession session = MySqlSessionFactory.getSession();
		List<OrderDTO> list = null;
		try {
			  OrderDAO dao = new OrderDAO();
		      list = dao.saleList(session, yn);
		      }finally {
				session.close();
		      }
		      return list;
	
	}
	
	public void saleCompleteY(String seq) {
		SqlSession session = MySqlSessionFactory.getSession();
		try {
		OrderDAO dao = new OrderDAO();
		dao.saleCompleteY(session, seq);
		session.commit();
		 }finally {session.close();
	      }
	}

	public void saleCancel(String scan) {
		SqlSession session = MySqlSessionFactory.getSession();
		OrderDAO dao = new OrderDAO();
		dao.saleCancel(session, scan);
		session.commit();
	}



}
