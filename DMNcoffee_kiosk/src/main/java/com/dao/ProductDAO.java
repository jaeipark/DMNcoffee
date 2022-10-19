package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.ProductDTO;

@Repository
public class ProductDAO {
	
	@Autowired
	SqlSessionTemplate template;
	
	public List<ProductDTO> productSelectAll(int ctno) {
		List<ProductDTO> list = template.selectList("productSelectAll",ctno);
		return list;
	}

	public List<ProductDTO> selectCTNO(int ctno) {
		List<ProductDTO> list = template.selectList("selectCTNO",ctno);
		return list;
	}

	public ProductDTO selectPDNO(int pdno) {
		ProductDTO dto = template.selectOne("selectPDNO",pdno);
		return dto;
	}

}
