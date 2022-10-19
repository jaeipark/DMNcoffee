<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.service.*"%>
<%@page import="com.dto.*"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	CategoryService cservice = new CategoryService();
	List<CategoryDTO> cdto = (List<CategoryDTO>)request.getAttribute("clist");
%>

<%-- <table class="category">
	<tr>
	<c:forEach var="dto" begin="0" end="2" step="1" items="${clist }" varStatus="status">
		<td><button class="categoryBTN" data-xxx="${dto.ctno }">${dto.ctnm }</button></td>
	</c:forEach>
	</tr>
	<tr>
	<c:forEach var="dto" begin="3" end="5" step="1" items="${clist }" varStatus="status">
		<td><button class="categoryBTN" data-xxx="${dto.ctno }">${dto.ctnm }</button></td>
	</c:forEach>
	</tr>
	
</table>
<input type="hidden" id="ctno"> --%>
<table class="category">
	<tr>
		<td><button class="categoryBTN" data-xxx="<%= cdto.get(5).getCtno() %>"><%= cdto.get(5).getCtnm() %></button></td>
		<td><button class="categoryBTN" data-xxx="<%= cdto.get(4).getCtno() %>"><%= cdto.get(4).getCtnm() %></button></td>
		<td><button class="categoryBTN" data-xxx="<%= cdto.get(3).getCtno() %>"><%= cdto.get(3).getCtnm() %></button></td>
	</tr>
	<tr>
		<td><button class="categoryBTN" data-xxx="<%= cdto.get(2).getCtno() %>"><%= cdto.get(2).getCtnm() %></button></td>
		<td><button class="categoryBTN" data-xxx="<%= cdto.get(1).getCtno() %>"><%= cdto.get(1).getCtnm() %></button></td>
		<td><button class="categoryBTN" data-xxx="<%= cdto.get(0).getCtno() %>"><%= cdto.get(0).getCtnm() %></button></td>
	</tr>
</table>
<input type="hidden" id="ctno">
