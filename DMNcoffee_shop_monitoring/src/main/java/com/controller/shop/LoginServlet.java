package com.controller.shop;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.EmpDTO;
import com.service.EmpService;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String userid = request.getParameter("userid");
	String passwd = request.getParameter("passwd");
	HashMap<String, String> map = new HashMap<>();
	map.put("userid", userid);
	map.put("passwd", passwd);
	
	EmpService service = new EmpService();
	EmpDTO dto = service.login(map);
	
	String nextPage=null;
	
	if (dto!=null) {
		nextPage = "SaleListServlet";
		HttpSession session = request.getSession();
		session.setAttribute("login", userid);
		session.setMaxInactiveInterval(60*60*24);
	}else {
		nextPage = "LoginUIServlet";
	}
	response.sendRedirect(nextPage);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
