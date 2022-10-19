package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.OrderInfoDAO;
import com.dto.OrderInfoDTO;
@Service
public class OrderInfoSerivce {
	@Autowired
	OrderInfoDAO dao;
	
	public List<OrderInfoDTO> selectOrderAll() {
		List<OrderInfoDTO> list = dao.selectOrderAll();
		return list;
	}

	public void orderAdd(OrderInfoDTO dto) {
		dao.orderAdd(dto);
	}

	public List<OrderInfoDTO> selectOrderSeq(int orderseq) {
		List<OrderInfoDTO> list = dao.selectOrderSeq(orderseq);
		return list;
	}

	public String selectOrderLastDate() {
		String lastDate = dao.selectOrderLastDate();
		return lastDate;
	}

	public List<OrderInfoDTO> selectOrderDate(String date) {
		List<OrderInfoDTO> list = dao.selectOrderDate(date);
		return list;
	}

}
