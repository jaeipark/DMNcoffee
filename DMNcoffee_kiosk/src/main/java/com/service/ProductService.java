package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ProductDAO;
import com.dto.ProductDTO;

@Service
public class ProductService {
	@Autowired
	ProductDAO dao;
	
	
	public List<ProductDTO> productSelectAll(int ctno) {
		List<ProductDTO> list = dao.productSelectAll(ctno);
		return list;
	}


	public List<ProductDTO> selectCTNO(int ctno) {
		List<ProductDTO> list = dao.selectCTNO(ctno);
		return list;
	}


	public ProductDTO selectPDNO(int pdno) {
		ProductDTO dto = dao.selectPDNO(pdno);
		return dto;
	}

}
