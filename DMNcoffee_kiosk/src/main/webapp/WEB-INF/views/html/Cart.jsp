<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dto.*" %>
<%@ page import="com.service.*" %>
<%@ page import="java.util.List" %>
<%
	List<CartDTO> list = (List<CartDTO>)request.getAttribute("CartList");
	
	int pageCount = 0;
	pageCount = list.size() / 2;
	
	if(list.size() % 2 != 0){
		pageCount++;
	}
	int index = 0;
	int column = 0;
%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<%
	if(list.size()==0){
%>
	<img id="basket" src="image/utility/장바구니.png">
<%
	}else if(pageCount==1){
%>
	<div class="opacity-25"><img id="basket" src="image/utility/장바구니.png"></div>
	<table class="cart">
		<tr>
			<%
				for(int i=0;i<list.size();i++){
					CartDTO dto = list.get(i);
					String ctnm = dto.getCtnm();
					String pdnm = dto.getPdnm();
			%>
			<td><img class="cart-image" src="image/menu/<%=ctnm %>/<%=pdnm %>.png"></td>
			<%
				}
			%>
			</tr>
	</table>
<%
	}else if(pageCount==2){
%>
	<div class="opacity-25"><img id="basket" src="image/utility/장바구니.png"></div>
	<div class="wrap">
		<div class="imgBox">
			<table class="img on">
				<tr>
					<%
						column=list.size()%2;
						if(list.size()>=2){column=2;}
						index=0;
						
						for(int i=index;i<index+column;i++){
							CartDTO dto = list.get(i);
							String ctnm = dto.getCtnm();
							String pdnm = dto.getPdnm();
					%>
					<td><img class="cart-image" src="image/menu/<%=ctnm %>/<%=pdnm %>.png"></td>
					<%
						}
					%>
				</tr>
			</table>
			<table class="img">
				<tr>
					<%
						column=list.size()%2;
						if(list.size()>=4){column=2;}
						index=2;
						
						for(int i=index;i<index+column;i++){
						CartDTO dto = list.get(i);
						String ctnm = dto.getCtnm();
						String pdnm = dto.getPdnm();
					%>
					<td><img class="cart-image" src="image/menu/<%=ctnm %>/<%=pdnm %>.png"></td>
					<%
						}
					%>
				</tr>
			</table>
		</div>
		<button class="prev"><img class="control" src="image/utility/left.png"></button>
		<button class="next"><img class="control" src="image/utility/right.png"></button>
	</div>
<%
	}else if(pageCount == 3){
%>
	<div class="opacity-25"><img id="basket" src="image/utility/장바구니.png"></div>
	<div class="wrap">
		<div class="imgBox">
			<table class="img on">
				<tr>
					<%
						column=list.size()%2;
						if(list.size()>=2){column=2;}
						index=0;
						
						for(int i=index;i<index+column;i++){
							CartDTO dto = list.get(i);
							String ctnm = dto.getCtnm();
							String pdnm = dto.getPdnm();
					%>
					<td><img class="cart-image" src="image/menu/<%=ctnm %>/<%=pdnm %>.png"></td>
					<%
						}
					%>
				</tr>
			</table>
			<table class="img">
				<tr>
					<%
						column=list.size()%2;
						if(list.size()>=4){column=2;}
						index=2;
						
						for(int i=index;i<index+column;i++){
						CartDTO dto = list.get(i);
						String ctnm = dto.getCtnm();
						String pdnm = dto.getPdnm();
					%>
					<td><img class="cart-image" src="image/menu/<%=ctnm %>/<%=pdnm %>.png"></td>
					<%
						}
					%>
				</tr>
			</table>
			<table class="img">
				<tr>
					<%
						column=list.size()%2;
						if(list.size()>=6){column=2;}
						index=4;
						
						for(int i=index;i<index+column;i++){
						CartDTO dto = list.get(i);
						String ctnm = dto.getCtnm();
						String pdnm = dto.getPdnm();
					%>
					<td><img class="cart-image" src="image/menu/<%=ctnm %>/<%=pdnm %>.png"></td>
					<%
						}
					%>
				</tr>
			</table>
		</div>
		<button class="prev"><img class="control" src="image/utility/left.png"></button>
		<button class="next"><img class="control" src="image/utility/right.png"></button>
	</div>
<%
	}else if(pageCount == 4){
%>
	<div class="opacity-25"><img id="basket" src="image/utility/장바구니.png"></div>
	<div class="wrap">
		<div class="imgBox">
			<table class="img on">
				<tr>
					<%
						column=list.size()%2;
						if(list.size()>=2){column=2;}
						index=0;
						
						for(int i=index;i<index+column;i++){
							CartDTO dto = list.get(i);
							String ctnm = dto.getCtnm();
							String pdnm = dto.getPdnm();
					%>
					<td><img class="cart-image" src="image/menu/<%=ctnm %>/<%=pdnm %>.png"></td>
					<%
						}
					%>
				</tr>
			</table>
			<table class="img">
				<tr>
					<%
						column=list.size()%2;
						if(list.size()>=4){column=2;}
						index=2;
						
						for(int i=index;i<index+column;i++){
						CartDTO dto = list.get(i);
						String ctnm = dto.getCtnm();
						String pdnm = dto.getPdnm();
					%>
					<td><img class="cart-image" src="image/menu/<%=ctnm %>/<%=pdnm %>.png"></td>
					<%
						}
					%>
				</tr>
			</table>
			<table class="img">
				<tr>
					<%
						column=list.size()%2;
						if(list.size()>=6){column=2;}
						index=4;
						
						for(int i=index;i<index+column;i++){
						CartDTO dto = list.get(i);
						String ctnm = dto.getCtnm();
						String pdnm = dto.getPdnm();
					%>
					<td><img class="cart-image" src="image/menu/<%=ctnm %>/<%=pdnm %>.png"></td>
					<%
						}
					%>
				</tr>
			</table>
			<table class="img">
				<tr>
					<%
						column=list.size()%2;
						if(list.size()>=8){column=2;}
						index=6;
						
						for(int i=index;i<index+column;i++){
						CartDTO dto = list.get(i);
						String ctnm = dto.getCtnm();
						String pdnm = dto.getPdnm();
					%>
					<td><img class="cart-image" src="image/menu/<%=ctnm %>/<%=pdnm %>.png"></td>
					<%
						}
					%>
				</tr>
			</table>
		</div>
		<button class="prev"><img class="control" src="image/utility/left.png"></button>
		<button class="next"><img class="control" src="image/utility/right.png"></button>
	</div>
<%
	}else{
%>
	<div class="opacity-25"><img id="basket" src="image/utility/장바구니.png"></div>
	<div class="wrap">
		<div class="imgBox">
			<table class="img on">
				<tr>
					<%
						column=list.size()%2;
						if(list.size()>=2){column=2;}
						index=0;
						
						for(int i=index;i<index+column;i++){
							CartDTO dto = list.get(i);
							String ctnm = dto.getCtnm();
							String pdnm = dto.getPdnm();
					%>
					<td><img class="cart-image" src="image/menu/<%=ctnm %>/<%=pdnm %>.png"></td>
					<%
						}
					%>
				</tr>
			</table>
			<table class="img">
				<tr>
					<%
						column=list.size()%2;
						if(list.size()>=4){column=2;}
						index=2;
						
						for(int i=index;i<index+column;i++){
						CartDTO dto = list.get(i);
						String ctnm = dto.getCtnm();
						String pdnm = dto.getPdnm();
					%>
					<td><img class="cart-image" src="image/menu/<%=ctnm %>/<%=pdnm %>.png"></td>
					<%
						}
					%>
				</tr>
			</table>
			<table class="img">
				<tr>
					<%
						column=list.size()%2;
						if(list.size()>=6){column=2;}
						index=4;
						
						for(int i=index;i<index+column;i++){
						CartDTO dto = list.get(i);
						String ctnm = dto.getCtnm();
						String pdnm = dto.getPdnm();
					%>
					<td><img class="cart-image" src="image/menu/<%=ctnm %>/<%=pdnm %>.png"></td>
					<%
						}
					%>
				</tr>
			</table>
			<table class="img">
				<tr>
					<%
						column=list.size()%2;
						if(list.size()>=8){column=2;}
						index=6;
						
						for(int i=index;i<index+column;i++){
						CartDTO dto = list.get(i);
						String ctnm = dto.getCtnm();
						String pdnm = dto.getPdnm();
					%>
					<td><img class="cart-image" src="image/menu/<%=ctnm %>/<%=pdnm %>.png"></td>
					<%
						}
					%>
				</tr>
			</table>
			<table class="img">
				<tr>
					<%
						column=list.size()%2;
						if(list.size()>=10){column=2;}
						index=8;
						
						for(int i=index;i<index+column;i++){
						CartDTO dto = list.get(i);
						String ctnm = dto.getCtnm();
						String pdnm = dto.getPdnm();
					%>
					<td><img class="cart-image" src="image/menu/<%=ctnm %>/<%=pdnm %>.png"></td>
					<%
						}
					%>
				</tr>
			</table>
		</div>
		<button class="prev"><img class="control" src="image/utility/left.png"></button>
		<button class="next"><img class="control" src="image/utility/right.png"></button>
	</div>
<%
	}
%>
<script src="js/slideShow.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/Cart.css?ver=1"/><!-- css 링크 -->