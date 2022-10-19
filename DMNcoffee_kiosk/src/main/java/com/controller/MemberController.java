package com.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dto.CartDTO;
import com.dto.LogDTO;
import com.dto.MemberDTO;
import com.service.CartService;
import com.service.LogService;
import com.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService mservice;
	@Autowired
	LogService lservice;
	@Autowired
	CartService cservice;
	
	
	@RequestMapping(value = "/MemberAddorSelect")
	public ModelAndView MemberAddorSelect(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		
		Map<String,Object> phoneNum = new HashMap<String,Object>();
		phoneNum.put("phone2",phone2);
		phoneNum.put("phone3",phone3);
		
		MemberDTO mdto = mservice.selectMember(phoneNum);
		
		if(mdto == null) {
			int mempoint = 0;
			mdto = new MemberDTO(phone1,phone2,phone3,mempoint,"false");
			mservice.memberAdd(mdto);
			mdto = mservice.selectMember(phoneNum);
		}
		
		mav.addObject("memberInfo",mdto);
		mav.setViewName("Step2_Member");
		
		return mav;
	}
	
	
	@RequestMapping(value = "/StampEvent")
	public String StampEvent(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		
		
		return "StampEvent";
	}
	
	
	@RequestMapping(value = "/StampEvent2")
	public ModelAndView StampEvent2(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		
		Map<String,Object> phoneNum = new HashMap<String,Object>();
		phoneNum.put("phone2",phone2);
		phoneNum.put("phone3",phone3);
		
		MemberDTO mdto = mservice.selectMember(phoneNum);
		
		mav.addObject("memberInfo",mdto);
		mav.setViewName("StampCheck");
		
		return mav;
	}
	
	
	@RequestMapping(value = "/StampCheck")
	public ModelAndView StampCheck(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		
		Map<String,Object> phoneNum = new HashMap<String,Object>();
		phoneNum.put("phone2",phone2);
		phoneNum.put("phone3",phone3);
		
		MemberDTO mdto = mservice.selectMember(phoneNum);
		mdto.setMempoint(mdto.getMempoint()-10);
		
		Map<String,Object> memberInfo = new HashMap<String,Object>();
		memberInfo.put("memno", mdto.getMemno());
		memberInfo.put("mempoint", mdto.getMempoint());
		memberInfo.put("stampcheck", "true");
		
		mservice.updateMember(memberInfo);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		String date = sdf.format(Calendar.getInstance().getTime());

		lservice.logAdd(new LogDTO(phone2,phone3,date,"사용","-10"));
		
		List<CartDTO> list = cservice.cartSelectAll();
		
		mav.addObject("list", list);
		mav.setViewName("html/PaymentHistory_Member");
		
		return mav;
	}
	
	@RequestMapping(value = "/MemberHistorySelect")
	public ModelAndView MemberHistorySelect(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		
		Map<String,Object> phoneNum = new HashMap<String,Object>();
		phoneNum.put("phone2",phone2);
		phoneNum.put("phone3",phone3);
		
		List<LogDTO> log = lservice.selectLog(phoneNum);
		
		mav.addObject("log",log);
		mav.setViewName("common/history");
		
		return mav;
	}
	
	
	@RequestMapping(value = "/common/benefits")
	public String Benefits() {
		return "common/benefits";
	}
	
}
