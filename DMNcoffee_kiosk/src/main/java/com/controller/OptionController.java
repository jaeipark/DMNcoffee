package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dto.CartDTO;
import com.dto.CategoryDTO;
import com.dto.OptionDTO;
import com.dto.ProductDTO;
import com.service.CartService;
import com.service.CategoryService;
import com.service.OptionService;
import com.service.ProductService;

@Controller
public class OptionController {
	@Autowired
	ProductService pservice;
	@Autowired
	CategoryService cservice;
	@Autowired
	OptionService oservice;
	@Autowired
	CartService ctservice;
	
	@RequestMapping(value = "/Option")
	public String Option() {
		return "Option";
	}
	
	
	
	@RequestMapping(value = "/ProductRetrieve")
	public ModelAndView ProductRetrieve(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int pdno = Integer.parseInt(request.getParameter("pdno"));
		ProductDTO pdto = pservice.selectPDNO(pdno);
		CategoryDTO cdto = cservice.selectCTNM(pdto.getCtno());
		
		List<OptionDTO> freelist = oservice.selectOPTFree(pdto.getCtno());
		List<OptionDTO> paylist = oservice.selectOPTPay(pdto.getCtno());
		
		mav.addObject("ProductRetrieve", pdto);
		mav.addObject("CategoryRetrieve", cdto);
		mav.addObject("freelist", freelist);
		mav.addObject("paylist", paylist);
		
		mav.setViewName("ProductRetrieve");
		return mav;
	}
	
	@RequestMapping(value = "/OptionSelect")
	public ModelAndView OptionSelect(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		String pdno = request.getParameter("pdno");
		String opt = request.getParameter("opt");
		String oprice = request.getParameter("oprice");
		
		int total = 0;
		
		if(oprice != null) {
			String[] p = oprice.split(" ");
			for(int i=0; i< p.length;i++) {
				total += Integer.parseInt(p[i]);
			}
		}
		
		ProductDTO pdto = pservice.selectPDNO(Integer.parseInt(pdno));
		
		String pdnm = pdto.getPdnm();
		int amount = 1;
		int totalprice = pdto.getPdprice() + total;
		String ctnm = pdto.getCtnm();
		
		CartDTO cdto = new CartDTO(pdno,pdnm,amount,totalprice,opt,ctnm);
		
		ctservice.cartAdd(cdto);
		
		List<CartDTO> list = ctservice.cartSelectAll();
		
		mav.addObject("CartList", list);
		mav.setViewName("html/Cart");
		return mav;
	}
	
	
	
}
