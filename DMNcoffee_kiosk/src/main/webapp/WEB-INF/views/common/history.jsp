<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.dto.*"%>
<%@ page import="java.util.List"%>
<%
	List<LogDTO> list = (List<LogDTO>)request.getAttribute("log");
	
%>
<!DOCTYPE html>
<%
	for(int i=0;i<list.size();i++){
		LogDTO dto = list.get(i);
		String dateLog = dto.getDatelog();
		String status = dto.getStatus();
		int pointLog = Integer.parseInt(dto.getPointlog());
%>
	<table class="log">
		<tr>
			<td><%=dateLog %></td>
			<%
				if(status.equals("적립")){
			%>
				<td align="right" style="color: #6495ED;"><%=status %></td>
			<%
				}else{
			%>
				<td align="right" style="color: #CD2E57;"><%=status %></td>
			<%
				}
				if(pointLog>0){
			%>
				<td align="right" style="color: #6495ED;">&nbsp;+<%=pointLog %></td>
			<%
				}else{
			%>
				<td align="right" style="color: #CD2E57;"><%=pointLog %></td>
			<%
				}
			%>
		</tr>
	</table>
<%
	}
%>