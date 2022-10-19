<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dto.*" %>
<%@ page import="java.util.List" %>
<%
	List<CartDTO> list = (List<CartDTO>)request.getAttribute("list");
	
	int orderprice = 0;
	for(int i =0;i<list.size();i++){
		CartDTO dto = list.get(i);
		orderprice += dto.getTotalprice();
	}

%>    
<!DOCTYPE html>
<link rel="stylesheet" href="css/PaymentHistory.css?ver=1"/><!-- css 링크 -->
<div class="pay">
		<table class="pay-table">
			<tr>
				<td class="left">주문금액</td>
				<td class="right"><input type="text" class="orderprice" readonly value="<%=orderprice %>">원</td>
			</tr>
			<tr>
				<td class="left"><input class="blank" type="text" value=""></td>
				<td class="right"><input class="blank" type="text" value=""></td>
			</tr>
			<tr>
				<td colspan="2"><hr></td>
			</tr>
			<tr>
				<td class="left">결제금액</td>
				<td class="right"><input type="text" class="orderprice" readonly value="<%=orderprice %>"><a>원</a></td>
			</tr>
		</table>
	</div>