package com.controller.shop;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.OrderDTO;
import com.dto.StateDTO;
import com.service.OrderService;
import com.service.StateService;

/**
 * Servlet implementation class SaleListServlet
 */
@WebServlet("/SaleListServlet")
public class SaleListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaleListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  HttpSession session = request.getSession(); 
	      String nextPage = null;
	      OrderService service = new OrderService();
	      
	      System.out.println("YN::::::::" + request.getParameter("YN"));
	      String yn = request.getParameter("YN");
	      
	     session.setAttribute("mode", yn);
	      
	      List<OrderDTO> list= service.saleList(yn);
	      
		StateService stService = new StateService();
		StateDTO stDto= new StateDTO();
		stDto = stService.curStateSelect();
		
		if(stDto == null) stDto=new StateDTO(0,0,0);
		System.out.println(stDto);
	      
		  
	      
	      request.setAttribute("curState", stDto);
	      request.setAttribute("orderList", list);
	      nextPage = "shopMonitor.jsp";
	      
//	      for (int i = 0; i < list.size(); i++) {
//	    	  SaleDTO sdto = list.get(i);
//	    	  int saleno = sdto.getSaleno();
//	    	  String product = sdto.getProduct();
//	    	  String salecomplete = sdto.getSalecomplete();
//	    	System.out.println("주문번호 : "+saleno+"  상품 : "+product+"  완료여부 : "+salecomplete);
//		}
			RequestDispatcher dis = request.getRequestDispatcher(nextPage);
			dis.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
