package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.CategoryDTO;

@Repository
public class CategoryDAO {
	@Autowired
	SqlSessionTemplate template;
	
	
	public CategoryDTO selectCTNM(int ctno) {
		CategoryDTO dto = template.selectOne("selectCTNM",ctno);
		return dto;
	}


	public List<CategoryDTO> categorySelectAll() {
		List<CategoryDTO> list = template.selectList("categorySelectAll");
		return list;
	}

}
