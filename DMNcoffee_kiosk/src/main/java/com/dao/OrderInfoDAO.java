package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.OrderInfoDTO;
@Repository
public class OrderInfoDAO {
	@Autowired
	SqlSessionTemplate template;
	
	public List<OrderInfoDTO> selectOrderAll() {
		List<OrderInfoDTO> list = template.selectList("selectOrderAll");
		return list;
	}

	public void orderAdd(OrderInfoDTO dto) {
		template.insert("orderAdd",dto);
	}

	public List<OrderInfoDTO> selectOrderSeq(int orderseq) {
		List<OrderInfoDTO> list = template.selectList("selectOrderSeq",orderseq);
		return list;
	}

	public String selectOrderLastDate() {
		String lastDate = template.selectOne("selectOrderLastDate");
		return lastDate;
	}

	public List<OrderInfoDTO> selectOrderDate(String date) {
		List<OrderInfoDTO> list = template.selectList("selectOrderDate",date);
		return list;
	}

}
