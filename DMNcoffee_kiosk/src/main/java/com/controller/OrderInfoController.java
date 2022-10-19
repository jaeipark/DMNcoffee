package com.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dto.CartDTO;
import com.dto.LogDTO;
import com.dto.MemberDTO;
import com.dto.OrderInfoDTO;
import com.service.CartService;
import com.service.LogService;
import com.service.MemberService;
import com.service.OrderInfoSerivce;

@Controller
public class OrderInfoController {
	@Autowired
	OrderInfoSerivce oservice;
	@Autowired
	CartService cservice;
	@Autowired
	MemberService mservice;
	@Autowired
	LogService lservice;
	
	@RequestMapping(value = "/Order")
	public String Order() {
		return "Order";
	}
	
	@RequestMapping(value = "/OrderHistory")
	public ModelAndView OrderHistory() {
		ModelAndView mav = new ModelAndView();
		List<CartDTO> list = cservice.cartSelectAll();
		mav.addObject("CartList", list);
		mav.setViewName("html/OrderHistory");
		return mav;
	}
	
	@RequestMapping(value = "/PaymentHistory")
	public ModelAndView PaymentHistory() {
		ModelAndView mav = new ModelAndView();
		List<CartDTO> list = cservice.cartSelectAll();
		mav.addObject("list",list);
		mav.setViewName("html/PaymentHistory");
		return mav;
	}
	
	@RequestMapping(value = "/Step1")
	public String Step1() {
		return "Step1";
	}
	
	@RequestMapping(value = "/Step2")
	public String Step2() {
		return "Step2";
	}
	
	@RequestMapping(value = "/MemberLookupAndJoin")
	public String MemberLookupAndJoin() {
		return "MemberLookupAndJoin";
	}
	
	@RequestMapping(value = "/Payment")
	public ModelAndView Payment(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		
		mav.addObject("phone2", phone2);
		mav.addObject("phone3", phone3);
		mav.setViewName("Payment");
		return mav;
	}
	
	@RequestMapping(value = "/OrderConfirmation")
	public ModelAndView OrderConfirmation(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		String ordertakeout = (String)session.getAttribute("ordertakeout");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		
		String url = "OrderConfirmation";
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		String date = sdf.format(Calendar.getInstance().getTime());
		
		List<CartDTO> cartlist = cservice.cartSelectAll();
		
		int totalamount = 0;
		
		for(int i=0;i<cartlist.size();i++) {
			CartDTO dto = cartlist.get(i);
			int amount = dto.getAmount();
			totalamount += amount;
		}
		
		if(phone2 != null && phone3 != null) {//회원가입을 진행하였을때
			url = "OrderConfirmation_Member";
			
			MemberDTO mdto = new MemberDTO();
			
			
			Map<String,Object> phoneNum = new HashMap<String,Object>();
			phoneNum.put("phone2",phone2);
			phoneNum.put("phone3",phone3);
			
			Map<String,Object> memberInfo = new HashMap<String,Object>();
			
			mdto = mservice.selectMember(phoneNum);
			
			lservice.logAdd(new LogDTO(phone2,phone3,date,"적립",String.valueOf(totalamount)));//쿠폰 적립 로그 
			
			if(mdto.getStampcheck().equals("false")) {//쿠폰 안쓴경우
				memberInfo.put("memno", mdto.getMemno());
				memberInfo.put("mempoint", mdto.getMempoint()+totalamount);
				memberInfo.put("stampcheck", "false");
				
				mservice.updateMember(memberInfo);
				mdto = mservice.selectMember(phoneNum);
				
				request.setAttribute("mdto", mdto);
			}else{//쿠폰 사용한경우
				memberInfo.put("memno", mdto.getMemno());
				memberInfo.put("mempoint", mdto.getMempoint()+totalamount-1);
				memberInfo.put("stampcheck", "true");
				
				mservice.updateMember(memberInfo);
				
				mdto = mservice.selectMember(phoneNum);
				
				request.setAttribute("mdto", mdto);
				
				memberInfo.put("memno", mdto.getMemno());
				memberInfo.put("mempoint", mdto.getMempoint());
				memberInfo.put("stampcheck", "false");
				
				mservice.updateMember(memberInfo);
			}//else
		}//회원가입을 진행하였을때
		
		cartlist = cservice.cartSelectAll();
		
		List<OrderInfoDTO> orderlist = oservice.selectOrderAll();
		
		int orderseq = 0;
		
		if(orderlist.size() == 0) {//처음 주문들어갈때 1번으로 들어가게
			
			orderseq = 1;
			
			for(int i=0;i<cartlist.size();i++) {
				CartDTO dto = cartlist.get(i);
				int pdnum = dto.getPdnum();
				String pdnm = dto.getPdnm();
				String opt = dto.getOpt();
				int amount = dto.getAmount();
				int price = dto.getTotalprice();
				String complete_yn = "N";
				
				oservice.orderAdd(new OrderInfoDTO(date,orderseq,pdnum,pdnm,opt,amount,price,ordertakeout,complete_yn));
			}
		}else {//처음주문 외
			String lastDate = oservice.selectOrderLastDate();
			
			if(lastDate.equals(date)) {//날짜가 같으면
				
				List<OrderInfoDTO> orderlistSameDate = oservice.selectOrderDate(date);
				
				int[] arr = new int[orderlistSameDate.size()];
				int max = arr[0];
				
				for(int i=0;i<orderlistSameDate.size();i++) {
					arr[i] = orderlistSameDate.get(i).getOrderseq();
					for(int j=0;j<orderlistSameDate.size();j++) {
						if(arr[i] > max) {
							max = arr[i];
						}
					}
				}
				
				orderseq = max+1;
				
				for(int i=0;i<cartlist.size();i++) {
					CartDTO cdto = cartlist.get(i);
					int pdnum = cdto.getPdnum();
					String pdnm = cdto.getPdnm();
					String opt = cdto.getOpt();
					int amount = cdto.getAmount();
					int price = cdto.getTotalprice();
					String complete_yn = "N";
					
					oservice.orderAdd(new OrderInfoDTO(date,orderseq,pdnum,pdnm,opt,amount,price,ordertakeout,complete_yn));
				}
			}else {//날짜가 다르면
				orderseq =1;
				
				for(int i=0;i<cartlist.size();i++) {
					CartDTO dto = cartlist.get(i);
					int pdnum = dto.getPdnum();
					String pdnm = dto.getPdnm();
					String opt = dto.getOpt();
					int amount = dto.getAmount();
					int price = dto.getTotalprice();
					String complete_yn = "N";
					
					oservice.orderAdd(new OrderInfoDTO(date,orderseq,pdnum,pdnm,opt,amount,price,ordertakeout,complete_yn));
				}
			}
		}
		
		cservice.cartDelAll();
		
		List<OrderInfoDTO> list = oservice.selectOrderSeq(orderseq);
		
		SimpleDateFormat stime = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss",Locale.KOREA);
		String time = stime.format(Calendar.getInstance().getTime());
		
		mav.addObject("list", list);
		mav.addObject("time", time);
		mav.setViewName(url);
		
		return mav;
	}
	
	@RequestMapping(value = "/OrderConfirmation_Member")
	public ModelAndView OrderConfirmation_Member(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		String ordertakeout = (String)session.getAttribute("ordertakeout");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		String date = sdf.format(Calendar.getInstance().getTime());
		
		MemberDTO mdto = new MemberDTO();
		
		Map<String,Object> phoneNum = new HashMap<String,Object>();
		phoneNum.put("phone2",phone2);
		phoneNum.put("phone3",phone3);
		
		mdto = mservice.selectMember(phoneNum);
		
		request.setAttribute("mdto", mdto);
		
		Map<String,Object> memberInfo = new HashMap<String,Object>();
		
		memberInfo.put("memno", mdto.getMemno());
		memberInfo.put("mempoint", mdto.getMempoint());
		memberInfo.put("stampcheck", "false");
		
		mservice.updateMember(memberInfo);
		
		List<CartDTO> cartlist = cservice.cartSelectAll();
		
		List<OrderInfoDTO> orderlist = oservice.selectOrderAll();
		
		int orderseq = 0;
		
		if(orderlist.size() == 0) {//처음 주문들어갈때 1번으로 들어가게
			
			orderseq = 1;
			
			for(int i=0;i<cartlist.size();i++) {
				CartDTO dto = cartlist.get(i);
				int pdnum = dto.getPdnum();
				String pdnm = dto.getPdnm();
				String opt = dto.getOpt();
				int amount = dto.getAmount();
				int price = dto.getTotalprice();
				String complete_yn = "N";
				
				oservice.orderAdd(new OrderInfoDTO(date,orderseq,pdnum,pdnm,opt,amount,price,ordertakeout,complete_yn));
			}
		}else {//처음주문 외
			String lastDate = oservice.selectOrderLastDate();
			
			if(lastDate.equals(date)) {//날짜가 같으면
				
				List<OrderInfoDTO> orderlistSameDate = oservice.selectOrderDate(date);
				
				int[] arr = new int[orderlistSameDate.size()];
				int max = arr[0];
				
				for(int i=0;i<orderlistSameDate.size();i++) {
					arr[i] = orderlistSameDate.get(i).getOrderseq();
					for(int j=0;j<orderlistSameDate.size();j++) {
						if(arr[i] > max) {
							max = arr[i];
						}
					}
				}
				
				orderseq = max+1;
				
				for(int i=0;i<cartlist.size();i++) {
					CartDTO cdto = cartlist.get(i);
					int pdnum = cdto.getPdnum();
					String pdnm = cdto.getPdnm();
					String opt = cdto.getOpt();
					int amount = cdto.getAmount();
					int price = cdto.getTotalprice();
					String complete_yn = "N";
					
					oservice.orderAdd(new OrderInfoDTO(date,orderseq,pdnum,pdnm,opt,amount,price,ordertakeout,complete_yn));
				}
			}else {//날짜가 다르면
				orderseq =1;
				
				for(int i=0;i<cartlist.size();i++) {
					CartDTO dto = cartlist.get(i);
					int pdnum = dto.getPdnum();
					String pdnm = dto.getPdnm();
					String opt = dto.getOpt();
					int amount = dto.getAmount();
					int price = dto.getTotalprice();
					String complete_yn = "N";
					
					oservice.orderAdd(new OrderInfoDTO(date,orderseq,pdnum,pdnm,opt,amount,price,ordertakeout,complete_yn));
				}
			}
		}
		
		cservice.cartDelAll();
		
		List<OrderInfoDTO> list = oservice.selectOrderSeq(orderseq);
		
		SimpleDateFormat stime = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss",Locale.KOREA);
		String time = stime.format(Calendar.getInstance().getTime());
		
		mav.addObject("list", list);
		mav.addObject("time", time);
		
		return mav;
	}
	
}
