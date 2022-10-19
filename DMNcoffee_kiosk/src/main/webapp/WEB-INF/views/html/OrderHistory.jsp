<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dto.*" %>
<%@ page import="com.service.*" %>
<%@ page import="java.util.List" %>
<%
	List<CartDTO> list = (List<CartDTO>)request.getAttribute("CartList");

	int i=0;
%>
<!DOCTYPE html>
<div class="orderhistory">
		<% 
				for(i=0; i<list.size(); i++) { 
					CartDTO dto = list.get(i);
					String ctnm = dto.getCtnm();
					String pdnm = dto.getPdnm();
					String opt = dto.getOpt();
					int totalprice = dto.getTotalprice();
					int pdnum = dto.getPdnum();
					int amount = dto.getAmount();
		%>
		<table style="width: 100%;">
			<tr>
				<td rowspan="4" style="width: 150px; height: 150px;"><img src="image/menu/<%=ctnm%>/<%=pdnm%>.png" style="width: 150px; height: 150px;"></td>
				<td colspan="2" style="text-align: center; font-family: 'Noto Sans KR', sans-serif; font-size: 25px;"><%=pdnm%></td>
				<td rowspan="4"><button type="button" class="btn-close" id="singleDel"<%-- id="singleDel<%=i%>" --%> style="margin-right: 5px;" aria-label="Close" onclick="singleDel(<%=i%>)"></button></td>
			</tr>
			<tr>
				<td style="width: 70px; font-size: 16px; font-family: 'Noto Sans KR', sans-serif;">선택옵션 : </td>
				<td style="font-size: 16px; font-family: 'Noto Sans KR', sans-serif;"> <%=opt%></td>
			</tr>
			<tr>
				<td>가격 : </td>
				<td>￦<input id="price<%=i%>" style="border: 0;" readonly value="<%=totalprice%>">
				<input type="hidden" id="pri<%=i %>" value="<%=totalprice%>">
				<input type="hidden" id="num<%=i %>" value="<%=pdnum%>"></td>
			</tr>
			<tr>
				<td>수량 : </td>
				<td>
					<div id=<%=i%>>
		            	<button type="button" class="btn btn-primary btn-sm" onClick="minusBtn(<%=i%>)">-</button>
		                <input type="text" name="amount" style="width: 30px; border: 0; text-align: center;" value="<%=amount %>" id="amount<%=i%>" readonly="readonly">
		                <button type="button" class="btn btn-primary btn-sm" onClick="plusBtn(<%=i%>)">+</button>
					</div>
				</td>
			</tr>
		</table>
		<%		
			}
		%>
</div>