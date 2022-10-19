<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dto.*" %>
<%@ page import="java.util.List" %>
<%
	ProductDTO pdto = (ProductDTO)request.getAttribute("ProductRetrieve");
	CategoryDTO cdto = (CategoryDTO)request.getAttribute("CategoryRetrieve");
	List<OptionDTO> freelist = (List<OptionDTO>)request.getAttribute("freelist");
	List<OptionDTO> paylist = (List<OptionDTO>)request.getAttribute("paylist");
	
	String pdnm = pdto.getPdnm();
	int pdprice = pdto.getPdprice();
	int pdno = pdto.getPdno();
	int ctno = pdto.getCtno();
	
	String ctnm = cdto.getCtnm();
	
	int i=0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 페이지</title>
<link rel="shortcut icon" type="image/x-icon" href="image/utility/버튼.png"><!-- 타이틀 이미지 링크 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap" rel="stylesheet"><!-- 폰트 링크 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">	
$(document).ready(function() {
		
		$("#cartbtn").on("click",function(){
			var num=[];
			var num2=[];
			
			$(".btn-check:checked").each(function(idx,ele){
				num[idx]= $(this).attr("value1");
				num2[idx]= $(this).attr("value");
			});
			
			var opt="";
			var oprice="";
			
			for (var i = 0; i < num.length; i++) {
				opt += num[i]+" ";
			}
			for (var i = 0; i < num2.length; i++) {
				oprice += num2[i]+" ";
			}
			
			$.ajax({
				url : "OptionSelect",
				type: "get",
				data : {
					pdno: $(this).attr("data-xxx"),opt: opt,oprice : oprice
				},
				success: function(result){
					$("#cart",opener.document).html(result);
					window.close();
				}
			});
		});
		
});
</script>
</head>
<body>
	<header>
		<img class="logo"src="image/utility/로고.png">
		<h2>&nbsp;옵션 선택</h2>
		<hr>
	</header>
	<form name=form1> 
		<table>
			<tr>
				<td rowspan="2">
					<img class="menu-image" src="image/menu/<%=ctnm %>/<%=pdnm%>.png">
				</td>
				<td class="menu-name"><%= pdnm %></td>
			</tr>
			<tr>
				<td class="menu-price">
					￦<input class="input-menu-price" type="text" name="sum" id="sum" value="<%=pdprice%>" readonly="readonly">
				</td>
			</tr>
		</table>
		
		<div class="accordion" id="accordionPanelsStayOpenExample">
  			<div class="accordion-item">
    			<h2 class="accordion-header" id="panelsStayOpen-headingTwo">
      				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
        			무료옵션
      				</button>
    			</h2>
    			<div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo" style="position: absolute; overflow-x: auto;">
      				<div class="accordion-body" style="padding: 7px; height: 70px;">
      					<div class="btn-group btn-group-md" role="group" aria-label="Basic radio toggle button group">
      					<div style="display: none;">
      					<input type="checkbox" class="btn-check" name="btncheck" id="btncheck" autocomplete="off" value1="" value="0" checked onclick="sumchk(this);">
		 	 			<label class="btn btn-outline-primary" for="btncheck"  style="width: 130px; height: 50px; line-height: 130%;"><br></label>
	      				</div>
	      				<%  
	      					if(freelist.size() != 0){
	      						for(i=0;i<freelist.size();i++){
	      							OptionDTO dto = freelist.get(i);
	      							int optprice = dto.getOptprice();
	      							String optnm = dto.getOptnm();
      					%>
		  					<input type="checkbox" class="btn-check" name="btnradio" id="btnradio<%=i %>" autocomplete="off" value1="<%=optnm %>" value="<%=optprice%>">
		  					<label class="btn btn-outline-primary" for="btnradio<%=i %>" style="width: 130px; height: 50px; line-height: 130%;"><%=optnm%><br>(+￦<%=optprice%>)</label>
						<% 			
	      						}
	      					}
      					%>
						</div>
      				</div>
    			</div>
  			</div>
  			
  			<div class="accordion-item" style="margin-top: 60px; position: absolute; width: 100%; border-top: 1px outset;">
   			 	<h2 class="accordion-header" id="panelsStayOpen-headingThree">
      		 		<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
       				유료옵션
      				</button>
    			</h2>
    			<div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree"  style="overflow-x: auto;">
      				<div class="accordion-body" style="height:70px; padding: 7px;">
      					<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
		     				
		  					<%  
		  						if(paylist.size() != 0){
		  							for(i=0; i<paylist.size();i++) {
		  								OptionDTO dto = paylist.get(i);
		      							int optprice = dto.getOptprice();
		      							String optnm = dto.getOptnm();
		      							if(optprice!=0){
	      					%>
			 					<input type="checkbox" class="btn-check" name="btncheck" id="btncheck<%=i %>" autocomplete="off" value1="<%=optnm%>" value="<%=optprice%>" onclick="sumchk(this);">
		 	 					<label class="btn btn-outline-primary" for="btncheck<%=i%>" style="width: 130px; height: 50px; line-height: 130%;"><%=optnm%><br>(+￦<%=optprice%>)</label>
		  					<% 			}
	      							}
		  						}
	      					%>
						</div>
      				</div>
    			</div>
  			</div>
		</div>
		<div id='result'></div><br>
		<div id='result2'></div>
		<button type="button" class="btn btn-primary btn-lg" id="cartbtn" style="margin-top: 300px; margin-left: 50px; width: 165px; border:none; background-color: #6495ED; font-family: 'Noto Sans KR', sans-serif; font-size: 20px;" data-xxx="<%= pdno %>">장바구니 담기</button>
		<button type="button" class="btn btn-secondary btn-lg" style="margin-top: 300px; margin-left: 10px; width: 165px; color: black; background-color: #f1f3f5; font-family: 'Noto Sans KR', sans-serif; font-size: 20px;" onclick="window.close()">취소하기</button>
	</form>
<script>
	function sumchk(val){
		ans=document.form1.sum.value
		if (isNaN(ans)==true) {ans=""}
		if (val.checked==true){
		d=(ans/1)+(val.value/1)
		}else{
		d=(ans/1)-(val.value/1)
		}
		document.form1.sum.value=d
	}
</script>
<link rel="stylesheet" href="css/ProductRetrieve.css?ver=1">
</body>
</html>