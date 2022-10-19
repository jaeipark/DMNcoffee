package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dto.CategoryDTO;
import com.dto.ProductDTO;
import com.service.CartService;
import com.service.CategoryService;
import com.service.ProductService;

@Controller
public class MainController {
	
	@Autowired
	CategoryService cservice;
	@Autowired
	ProductService pservice; 
	@Autowired
	CartService ctservice;
	
	@RequestMapping(value = "/")
	public String Main() {
		ctservice.cartDelAll();
		return "Main";
	}
	
	@RequestMapping(value = "/Main")
	public String Home() {
		ctservice.cartDelAll();
		return "Main";
	}
	
	@RequestMapping(value = "/Menu")
	public ModelAndView TakeOutWheter() {
		
		List<CategoryDTO> list = cservice.categorySelectAll();
		ModelAndView mav = new ModelAndView();
		mav.addObject("clist", list);
		mav.setViewName("Menu");
		return mav;
	}
	
	@RequestMapping(value = "/TakeOutWheter")
	public ModelAndView TakeOutWheter(String ordertakeout, HttpSession session) {
		
		session.setAttribute("ordertakeout", ordertakeout);
		List<CategoryDTO> list = cservice.categorySelectAll();
		ModelAndView mav = new ModelAndView();
		mav.addObject("clist", list);
		mav.setViewName("Menu");
		return mav;
	}
	
//	@RequestMapping(value = "/Category")
//	public ModelAndView Category() {
//		List<CategoryDTO> list = cservice.categorySelectAll();
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("clist", list);
//		mav.setViewName("common/category");
//		return mav;
//	}
	
	
	@RequestMapping(value = "/CategoryRetrieve")
	public ModelAndView CategoryRetrieve(HttpServletRequest request) {
		
		int ctno = Integer.parseInt(request.getParameter("ctno"));
		List<ProductDTO> list = pservice.selectCTNO(ctno);
		CategoryDTO cdto = cservice.selectCTNM(ctno);
		ModelAndView mav = new ModelAndView();
		mav.addObject("ProductList", list);
		mav.addObject("CategoryInfo", cdto);
		mav.setViewName("html/MenuBoard");
		return mav;
	}
	
	
	@RequestMapping(value = "/DefaultMenuBord")
	public ModelAndView DefaultMenuBord() {
		List<ProductDTO> list = pservice.productSelectAll(6);
		ModelAndView mav = new ModelAndView();
		mav.addObject("ProductList", list);
		mav.setViewName("html/Default");
		return mav;
	}
	
	
}
