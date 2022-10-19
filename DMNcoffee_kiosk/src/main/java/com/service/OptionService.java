package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.OptionDAO;
import com.dto.OptionDTO;
@Service
public class OptionService {
	@Autowired
	OptionDAO dao;
	
	public List<OptionDTO> selectOPTFree(int ctno) {
		List<OptionDTO> list = dao.selectOPTFree(ctno);
		return list;
	}

	public List<OptionDTO> selectOPTPay(int ctno) {
		List<OptionDTO> list = dao.selectOPTPay(ctno);
		return list;
	}

}
