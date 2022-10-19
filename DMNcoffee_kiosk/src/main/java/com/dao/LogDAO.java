package com.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.LogDTO;
@Repository
public class LogDAO {
	@Autowired
	SqlSessionTemplate template;
	
	public void logAdd(LogDTO dto) {
		template.insert("logAdd",dto);
	}

	public List<LogDTO> selectLog(Map<String, Object> phoneNum) {
		List<LogDTO> list = template.selectList("selectLog",phoneNum);
		return list;
	}

}
