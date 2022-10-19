package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.CartDAO;
import com.dto.CartDTO;

@Service
public class CartService {
	@Autowired
	CartDAO dao;
	
	public List<CartDTO> cartSelectAll() {
		List<CartDTO> list = dao.cartSelectAll();
		return list;
	}

	public void cartDelAll() {
		dao.cartDelAll();
	}

	public void cartAdd(CartDTO cdto) {
		dao.cartAdd(cdto);
	}

	public CartDTO cartSelect(int pdnum) {
		CartDTO dto = dao.cartSelect(pdnum);
		return dto;
	}

	public void cartUpdate(Map<String, Integer> cartInfo) {
		dao.cartUpdate(cartInfo);
	}

	public void cartDel(int pdnum) {
		dao.cartDel(pdnum);
	}

}
