<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.*"%>
<%@page import="com.service.*"%>
<%
	List<ProductDTO> list = (List<ProductDTO>)request.getAttribute("ProductList");
	
	int pageCount = 0;
	int index=0;
	int column=0;
	
	pageCount = list.size() / 6;
	if(list.size()  % 6 != 0){
		pageCount++;
	}
%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$(".menu_image").on("click",function(){
		var pdno = $(this).attr("data-xxx");
		$("#pdno").val(pdno);
		
		window.name="Menu";
		openWin = window.open("Option","option","width=450,height=700,resizable=no,scrollbars=no,top=200,left=740");
		/* 노트북 자식창 사이즈 : "width=300,height=650,resizable=no,scrollbars=no,top=200,left=500" */
		/* 데스크톱 자식창 사이즈 : "width=450,height=700,resizable=no,scrollbars=no,top=200,left=740" */
	});
})	
</script>
<!-- -------------------------------------------- MenuBoard --------------------------------------------- -->
<%
	if(pageCount==1){
%>
<div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
<!-- ---------------------------------------------- 1페이지 ----------------------------------------------- -->

<!-- ----------------------------------------------- 1-1 ------------------------------------------------ -->
<!-- 1페이지 첫번째줄(상품의 개수가 3개보다 작을때) -->
<table>
	<tr>
<%
	if(list.size()<3){//상품의 개수가 3개보다 작을때
		for(int i =1;i<=list.size();i++){
			ProductDTO dto = list.get(i-1);
			String pdnm = dto.getPdnm();
			int pdno = dto.getPdno();
%>
	<td><img class="menu_image" src="image/menu/커피(ICE)/<%=pdnm%>.png" data-xxx="<%=pdno%>"></td>
<%
	}//for image
%>
	</tr>
	<tr>
<%
	for(int i=1;i<=list.size();i++){
		ProductDTO dto = list.get(i-1);
		String pdnm = dto.getPdnm();
		int pdprice = dto.getPdprice();
%>
	<td><div class="menu_info"><%=pdnm %><br>￦<%=pdprice %></div></td>
<%
	}//for info
%>
	</tr>
</table>
<%
	}else{
%>
<!-- 1페이지 첫번째줄 -->
<table>
	<tr>
<%
	for(int i =1;i<=3;i++){
		ProductDTO dto = list.get(i-1);
		String pdnm = dto.getPdnm();
		int pdno = dto.getPdno();
%>
	<td><img class="menu_image" src="image/menu/커피(ICE)/<%=pdnm%>.png" data-xxx="<%=pdno%>"></td>
<%
	}//for image
%>
	</tr>
	<tr>
<%
	for(int i=1;i<=3;i++){
	ProductDTO dto = list.get(i-1);
	String pdnm = dto.getPdnm();
	int pdprice = dto.getPdprice();
%>
	<td><div class="menu_info"><%=pdnm %><br>￦<%=pdprice %></div></td>
<%
	}//for info
%>
	</tr>
</table>
<%
	}//else
%>
<!-- ----------------------------------------------- 1-2 ------------------------------------------------ -->
<%
	if(list.size()>3){
%>
<!-- 1페이지 두번째줄 -->
<table>
	<tr>
<%
	column=list.size()%3;
	if(list.size()>=6){column=3;}
	index = 4;
	
	for(int i=index;i<index+column;i++){
	ProductDTO dto = list.get(i-1);
	String pdnm = dto.getPdnm();
	int pdno = dto.getPdno();
%>
	<td><img class="menu_image" src="image/menu/커피(ICE)/<%=pdnm%>.png" data-xxx="<%=pdno%>"></td>
<%
	}//for image
%>
	</tr>
	<tr>
<%
	for(int i=index;i<index+column;i++){
	ProductDTO dto = list.get(i-1);
	String pdnm = dto.getPdnm();
	int pdprice = dto.getPdprice();
%>
	<td><div class="menu_info"><%=pdnm %><br>￦<%=pdprice %></div></td>
<%
	}//for info
%>
	</tr>
</table>
<%
	}
%>
    </div>
  </div>
</div>
<%
	}else if(pageCount==2){
%>
<div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
<!-- ---------------------------------------------- 1페이지 ----------------------------------------------- -->

<!-- ----------------------------------------------- 1-1 ------------------------------------------------ -->
<!-- 1페이지 첫번째줄(상품의 개수가 3개보다 작을때) -->
<table>
	<tr>
<%
	if(list.size()<3){//상품의 개수가 3개보다 작을때
		for(int i =1;i<=list.size();i++){
			ProductDTO dto = list.get(i-1);
			String pdnm = dto.getPdnm();
			int pdno = dto.getPdno();
%>
	<td><img class="menu_image" src="image/menu/커피(ICE)/<%=pdnm%>.png" data-xxx="<%=pdno%>"></td>
<%
	}//for image
%>
	</tr>
	<tr>
<%
	for(int i=1;i<=list.size();i++){
		ProductDTO dto = list.get(i-1);
		String pdnm = dto.getPdnm();
		int pdprice = dto.getPdprice();
%>
	<td><div class="menu_info"><%=pdnm %><br>￦<%=pdprice %></div></td>
<%
	}//for info
%>
	</tr>
</table>
<%
	}else{
%>
<!-- 1페이지 첫번째줄 -->
<table>
	<tr>
<%
	for(int i =1;i<=3;i++){
		ProductDTO dto = list.get(i-1);
		String pdnm = dto.getPdnm();
		int pdno = dto.getPdno();
%>
	<td><img class="menu_image" src="image/menu/커피(ICE)/<%=pdnm%>.png" data-xxx="<%=pdno%>"></td>
<%
	}//for image
%>
	</tr>
	<tr>
<%
	for(int i=1;i<=3;i++){
	ProductDTO dto = list.get(i-1);
	String pdnm = dto.getPdnm();
	int pdprice = dto.getPdprice();
%>
	<td><div class="menu_info"><%=pdnm %><br>￦<%=pdprice %></div></td>
<%
	}//for info
%>
	</tr>
</table>
<%
	}//else
%>
<!-- ----------------------------------------------- 1-2 ------------------------------------------------ -->
<%
	if(list.size()>3){
%>
<!-- 1페이지 두번째줄 -->
<table>
	<tr>
<%
	column=list.size()%3;
	if(list.size()>=6){column=3;}
	index = 4;
	
	for(int i=index;i<index+column;i++){
	ProductDTO dto = list.get(i-1);
	String pdnm = dto.getPdnm();
	int pdno = dto.getPdno();
%>
	<td><img class="menu_image" src="image/menu/커피(ICE)/<%=pdnm%>.png" data-xxx="<%=pdno%>"></td>
<%
	}//for image
%>
	</tr>
	<tr>
<%
	for(int i=index;i<index+column;i++){
	ProductDTO dto = list.get(i-1);
	String pdnm = dto.getPdnm();
	int pdprice = dto.getPdprice();
%>
	<td><div class="menu_info"><%=pdnm %><br>￦<%=pdprice %></div></td>
<%
	}//for info
%>
	</tr>
</table>
<%
	}
%>
    </div>
    <div class="carousel-item">
<!-- ---------------------------------------------- 2페이지 ----------------------------------------------- -->

<!-- ----------------------------------------------- 2-1 ------------------------------------------------ -->
<%
	if(list.size()>6){
%>
<!-- 2페이지 첫번째줄 -->
<table>
	<tr>
<%
	column=list.size()%3;
	if(list.size()>=9){column=3;}
	index = 7;
	
	for(int i=index;i<index+column;i++){
	ProductDTO dto = list.get(i-1);
	String pdnm = dto.getPdnm();
	int pdno = dto.getPdno();
%>
	<td><img class="menu_image" src="image/menu/커피(ICE)/<%=pdnm%>.png" data-xxx="<%=pdno%>"></td>
<%
	}//for image
%>
	</tr>
	<tr>
<%
	for(int i=index;i<index+column;i++){
	ProductDTO dto = list.get(i-1);
	String pdnm = dto.getPdnm();
	int pdprice = dto.getPdprice();
%>
	<td><div class="menu_info"><%=pdnm %><br>￦<%=pdprice %></div></td>
<%
	}//for info
%>
	</tr>
</table>
<%
	}
%>
<!-- ----------------------------------------------- 2-2 ------------------------------------------------ -->
<%
	if(list.size()>9){
%>
<!-- 2페이지 두번째줄 -->
<table>
	<tr>
<%
	column=list.size()%3;
	if(list.size()>=12){column=3;}
	index = 10;
	
	for(int i=index;i<index+column;i++){
	ProductDTO dto = list.get(i-1);
	String pdnm = dto.getPdnm();
	int pdno = dto.getPdno();
%>
	<td><img class="menu_image" src="image/menu/커피(ICE)/<%=pdnm%>.png" data-xxx="<%=pdno%>"></td>
<%
	}//for image
%>
	</tr>
	<tr>
<%
	for(int i=index;i<index+column;i++){
	ProductDTO dto = list.get(i-1);
	String pdnm = dto.getPdnm();
	int pdprice = dto.getPdprice();
%>
	<td><div class="menu_info"><%=pdnm %><br>￦<%=pdprice %></div></td>
<%
	}//for info
%>
	</tr>
</table>
<%
	}
%>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
<%
	}else{
%>
<div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
<!-- ---------------------------------------------- 1페이지 ----------------------------------------------- -->

<!-- ----------------------------------------------- 1-1 ------------------------------------------------ -->
<!-- 1페이지 첫번째줄(상품의 개수가 3개보다 작을때) -->
<table>
	<tr>
<%
	if(list.size()<3){//상품의 개수가 3개보다 작을때
		for(int i =1;i<=list.size();i++){
			ProductDTO dto = list.get(i-1);
			String pdnm = dto.getPdnm();
			int pdno = dto.getPdno();
%>
	<td><img class="menu_image" src="image/menu/커피(ICE)/<%=pdnm%>.png" data-xxx="<%=pdno%>"></td>
<%
	}//for image
%>
	</tr>
	<tr>
<%
	for(int i=1;i<=list.size();i++){
		ProductDTO dto = list.get(i-1);
		String pdnm = dto.getPdnm();
		int pdprice = dto.getPdprice();
%>
	<td><div class="menu_info"><%=pdnm %><br>￦<%=pdprice %></div></td>
<%
	}//for info
%>
	</tr>
</table>
<%
	}else{
%>
<!-- 1페이지 첫번째줄 -->
<table>
	<tr>
<%
	for(int i =1;i<=3;i++){
		ProductDTO dto = list.get(i-1);
		String pdnm = dto.getPdnm();
		int pdno = dto.getPdno();
%>
	<td><img class="menu_image" src="image/menu/커피(ICE)/<%=pdnm%>.png" data-xxx="<%=pdno%>"></td>
<%
	}//for image
%>
	</tr>
	<tr>
<%
	for(int i=1;i<=3;i++){
	ProductDTO dto = list.get(i-1);
	String pdnm = dto.getPdnm();
	int pdprice = dto.getPdprice();
%>
	<td><div class="menu_info"><%=pdnm %><br>￦<%=pdprice %></div></td>
<%
	}//for info
%>
	</tr>
</table>
<%
	}//else
%>
<!-- ----------------------------------------------- 1-2 ------------------------------------------------ -->
<%
	if(list.size()>3){
%>
<!-- 1페이지 두번째줄 -->
<table>
	<tr>
<%
	column=list.size()%3;
	if(list.size()>=6){column=3;}
	index = 4;
	
	for(int i=index;i<index+column;i++){
	ProductDTO dto = list.get(i-1);
	String pdnm = dto.getPdnm();
	int pdno = dto.getPdno();
%>
	<td><img class="menu_image" src="image/menu/커피(ICE)/<%=pdnm%>.png" data-xxx="<%=pdno%>"></td>
<%
	}//for image
%>
	</tr>
	<tr>
<%
	for(int i=index;i<index+column;i++){
	ProductDTO dto = list.get(i-1);
	String pdnm = dto.getPdnm();
	int pdprice = dto.getPdprice();
%>
	<td><div class="menu_info"><%=pdnm %><br>￦<%=pdprice %></div></td>
<%
	}//for info
%>
	</tr>
</table>
<%
	}
%>
    </div>
    <div class="carousel-item">
<!-- ---------------------------------------------- 2페이지 ----------------------------------------------- -->

<!-- ----------------------------------------------- 2-1 ------------------------------------------------ -->
<%
	if(list.size()>6){
%>
<!-- 2페이지 첫번째줄 -->
<table>
	<tr>
<%
	column=list.size()%3;
	if(list.size()>=9){column=3;}
	index = 7;
	
	for(int i=index;i<index+column;i++){
	ProductDTO dto = list.get(i-1);
	String pdnm = dto.getPdnm();
	int pdno = dto.getPdno();
%>
	<td><img class="menu_image" src="image/menu/커피(ICE)/<%=pdnm%>.png" data-xxx="<%=pdno%>"></td>
<%
	}//for image
%>
	</tr>
	<tr>
<%
	for(int i=index;i<index+column;i++){
	ProductDTO dto = list.get(i-1);
	String pdnm = dto.getPdnm();
	int pdprice = dto.getPdprice();
%>
	<td><div class="menu_info"><%=pdnm %><br>￦<%=pdprice %></div></td>
<%
	}//for info
%>
	</tr>
</table>
<%
	}
%>
<!-- ----------------------------------------------- 2-2 ------------------------------------------------ -->
<%
	if(list.size()>9){
%>
<!-- 2페이지 두번째줄 -->
<table>
	<tr>
<%
	column=list.size()%3;
	if(list.size()>=12){column=3;}
	index = 10;
	
	for(int i=index;i<index+column;i++){
	ProductDTO dto = list.get(i-1);
	String pdnm = dto.getPdnm();
	int pdno = dto.getPdno();
%>
	<td><img class="menu_image" src="image/menu/커피(ICE)/<%=pdnm%>.png" data-xxx="<%=pdno%>"></td>
<%
	}//for image
%>
	</tr>
	<tr>
<%
	for(int i=index;i<index+column;i++){
	ProductDTO dto = list.get(i-1);
	String pdnm = dto.getPdnm();
	int pdprice = dto.getPdprice();
%>
	<td><div class="menu_info"><%=pdnm %><br>￦<%=pdprice %></div></td>
<%
	}//for info
%>
	</tr>
</table>
<%
	}
%>
    </div>
    <div class="carousel-item">
<!-- ---------------------------------------------- 3페이지 ----------------------------------------------- -->

<!-- ----------------------------------------------- 3-1 ------------------------------------------------ -->
<%
	if(list.size()>12){
%>
<!-- 3페이지 첫번째줄 -->
<table>
	<tr>
<%
	column=list.size()%3;
	if(list.size()>=15){column=3;}
	index = 13;
	
	for(int i=index;i<index+column;i++){
	ProductDTO dto = list.get(i-1);
	String pdnm = dto.getPdnm();
	int pdno = dto.getPdno();
%>
	<td><img class="menu_image" src="image/menu/커피(ICE)/<%=pdnm%>.png" data-xxx="<%=pdno%>"></td>
<%
	}//for image
%>
	</tr>
	<tr>
<%
	for(int i=index;i<index+column;i++){
	ProductDTO dto = list.get(i-1);
	String pdnm = dto.getPdnm();
	int pdprice = dto.getPdprice();
%>
	<td><div class="menu_info"><%=pdnm %><br>￦<%=pdprice %></div></td>
<%
	}//for info
%>
	</tr>
</table>
<%
	}
%>
<!-- ----------------------------------------------- 3-2 ------------------------------------------------ -->
<%
	if(list.size()>15){
%>
<!-- 3페이지 두번째줄 -->
<table>
	<tr>
<%
	column=list.size()%3;
	if(list.size()>=18){column=3;}
	index = 16;
	
	for(int i=index;i<index+column;i++){
	ProductDTO dto = list.get(i-1);
	String pdnm = dto.getPdnm();
	int pdno = dto.getPdno();
%>
	<td><img class="menu_image" src="image/menu/커피(ICE)/<%=pdnm%>.png" data-xxx="<%=pdno%>"></td>
<%
	}//for image
%>
	</tr>
	<tr>
<%
	for(int i=index;i<index+column;i++){
	ProductDTO dto = list.get(i-1);
	String pdnm = dto.getPdnm();
	int pdprice = dto.getPdprice();
%>
	<td><div class="menu_info"><%=pdnm %><br>￦<%=pdprice %></div></td>
<%
	}//for info
%>
	</tr>
</table>
<%
	}
%>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
<%
	}
%>
<input type="hidden" id="pdno">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>