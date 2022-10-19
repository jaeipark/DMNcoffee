package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.CategoryDAO;
import com.dto.CategoryDTO;

@Service
public class CategoryService {
	@Autowired
	CategoryDAO dao;
	
	public List<CategoryDTO> categorySelectAll() {
		List<CategoryDTO> list = dao.categorySelectAll();
		return list;
	}
	
	public CategoryDTO selectCTNM(int ctno) {
		CategoryDTO dto = dao.selectCTNM(ctno);
		return dto;
	}

}
