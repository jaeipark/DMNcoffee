package com.controller.shop;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.StateDTO;
import com.service.OrderService;
import com.service.StateService;

/**
 * Servlet implementation class SaleCompleteServlet
 */
@WebServlet("/SaleCancelServlet")
public class SaleCancelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaleCancelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String scan = request.getParameter("saleCancel");
		System.out.println(scan);
		String [] scanNum = scan.split(",");
		System.out.println(scanNum);
		OrderService service = new OrderService();
		for (int i = 0; i < scanNum.length; i++) {
			System.out.println(i);
			service.saleCancel(scanNum[i]);
		}
		

		RequestDispatcher dis = request.getRequestDispatcher("SaleListServlet");
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
