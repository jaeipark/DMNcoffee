package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.OrderDTO;


public class OrderDAO {

	public List<OrderDTO> saleList(SqlSession session, String yn) {
		HashMap<String, String> map = new HashMap<String, String>();
		// null 이면 로그인 초기상태, YN 
		System.out.println(yn);
		map.put("yn", yn == null ? "YN" : yn);
		System.out.println(map);
		List<OrderDTO> list 
				=  session.selectList("OrderMapper.saleList", map);
		return list;
	}
	
	public void saleCompleteY(SqlSession session, String seq) {
		session.update("OrderMapper.updateSaleCompleteY", seq);
	}

	public void saleCancel(SqlSession session, String scan) {
		session.delete("OrderMapper.saleCancel", scan);		
	}

}
