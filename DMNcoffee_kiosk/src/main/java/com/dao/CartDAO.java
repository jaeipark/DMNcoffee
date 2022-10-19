package com.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.CartDTO;

@Repository
public class CartDAO {
	
	@Autowired
	SqlSessionTemplate template;
	
	public List<CartDTO> cartSelectAll() {
		List<CartDTO> list = template.selectList("cartSelectAll");
		return list;
	}

	public void cartDelAll() {
		template.delete("cartDelAll");
	}

	public void cartAdd(CartDTO cdto) {
		template.insert("cartAdd",cdto);
	}

	public CartDTO cartSelect(int pdnum) {
		CartDTO dto = template.selectOne("cartSelect",pdnum);
		return dto;
	}

	public void cartUpdate(Map<String, Integer> cartInfo) {
		template.update("cartUpdate",cartInfo);
	}

	public void cartDel(int pdnum) {
		template.delete("cartDel",pdnum);
	}

}
