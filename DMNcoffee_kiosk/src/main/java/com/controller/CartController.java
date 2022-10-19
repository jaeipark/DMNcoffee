package com.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dto.CartDTO;
import com.service.CartService;
import net.sf.json.JSONObject;

@Controller
public class CartController {
	
	@Autowired
	CartService cservice;
	
	@RequestMapping(value = "/CartSelect")
	public ModelAndView CartSelect() {
		ModelAndView mav = new ModelAndView();
		List<CartDTO> list = cservice.cartSelectAll();
		mav.addObject("CartList", list);
		mav.setViewName("html/Cart");
		
		return mav;
	}
	
	@RequestMapping(value = "/CartDelAll")
	public String CartDelAll(HttpServletRequest request) {
		cservice.cartDelAll();
		List<CartDTO> list = cservice.cartSelectAll();
		
		request.setAttribute("CartList", list);
		return "html/Cart";
	}
	
	@RequestMapping(value = "/CartSelectAll")
	public void CartSelectAll(HttpServletResponse response) {
		JSONObject jobj = new JSONObject();
		
		List<CartDTO> list = cservice.cartSelectAll();
		
		int size = list.size();
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("size", size);
		 
		jobj.put("map", map);
		
		response.setContentType("application/x-json; charset=utf-8");
		try {
			response.getWriter().print(jobj);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // 전송이 되는 부분
	}
	
	@RequestMapping(value = "/CartUpdate")
	public void CartUpdate(HttpServletRequest request, HttpServletResponse response) {
		int pdnum = Integer.parseInt(request.getParameter("pdnum"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		String status = (String)request.getParameter("status");
		
		CartDTO dto = new CartDTO();
		dto = cservice.cartSelect(pdnum);
		
		int totalprice=0;
		
		if(status.equals("plus")) {
			 totalprice = (dto.getTotalprice() / (amount-1)) * amount;
		}else {
			 totalprice = (dto.getTotalprice() / (amount+1)) * amount ;
		}
		
		Map<String,Integer> cartInfo = new HashMap<String,Integer>();
		cartInfo.put("pdnum", pdnum);
		cartInfo.put("amount",amount);
		cartInfo.put("totalprice",totalprice);
		
		cservice.cartUpdate(cartInfo);
		
		dto = cservice.cartSelect(pdnum);
		amount = dto.getAmount();
		totalprice = dto.getTotalprice();
		
		JSONObject jobj = new JSONObject();
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("amount",amount);
		map.put("totalprice",totalprice);
		
		jobj.put("map", map);
		
		response.setContentType("application/x-json; charset=utf-8");
		try {
			response.getWriter().print(jobj);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // 전송이 되는 부분
	}
	
	@RequestMapping(value = "/CartDel")
	public ModelAndView CartDel(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int pdnum = Integer.parseInt(request.getParameter("pdnum"));
		
		cservice.cartDel(pdnum);
		List<CartDTO> list = cservice.cartSelectAll();
		
		mav.addObject("CartList",list);
		mav.setViewName("html/OrderHistory");
		return mav;
	}
	
	
	
	
}
