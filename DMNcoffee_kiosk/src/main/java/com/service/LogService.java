package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.LogDAO;
import com.dto.LogDTO;
@Service
public class LogService {
	@Autowired
	LogDAO dao;
	
	public void logAdd(LogDTO dto) {
		dao.logAdd(dto);
	}

	public List<LogDTO> selectLog(Map<String, Object> phoneNum) {
		List<LogDTO> list = dao.selectLog(phoneNum);
		return list;
	}

}
