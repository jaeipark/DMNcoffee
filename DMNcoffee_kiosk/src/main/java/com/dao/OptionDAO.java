package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.OptionDTO;
@Repository
public class OptionDAO {
	
	@Autowired
	SqlSessionTemplate template;
	
	public List<OptionDTO> selectOPTFree(int ctno) {
		List<OptionDTO> list = template.selectList("selectOPTFree",ctno);
		return list;
	}

	public List<OptionDTO> selectOPTPay(int ctno) {
		List<OptionDTO> list = template.selectList("selectOPTPay",ctno);
		return list;
	}

}
