<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/main.css" rel="stylesheet" type="text/css">
<title>매장용 페이지 로그인</title>
</head>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	
	 $("form").on("submit",function(event){		
		 var userid = $("#userid").val();
		 var passwd = $("#passwd").val();
	    		if(userid.length==0){
	    			alert("ID를 입력해주세요!")
	    			$("#userid").focus();
	    			event.preventDefault();
	    		}else if(passwd.length==0){
	    			alert("PASSWORD를 입력해 주세요!")
	    			$("#passwd").focus();
	    			event.preventDefault();
	    		}else{
	    		/* alert("[ "+$("#userid").val()+" ]님 계정으로 매장용페이지 로그인 합니다 ~ : )"); */
	    			swal("Good job!", "You clicked the button!", "error");	
	    		}
	    	});
	
})//end document

</script>

<body>
<div class="outline">
<div class="init">

<table>
<tr>
<td colspan="2">
<div class="toplogo"></div>
</td>
</tr>

<tr>
<td colspan="2"><div id = "toptitle">[ SHOP MONITORING ]</div></td>
</tr>

<tr>
<td>
   <form action="LoginServlet" method="post">
   <div class="id">
   &nbsp;&nbsp;&nbsp;아이디<br><br>
   <input type="text" class="input_text" name="userid" id="userid">
   </div>
   <div class="id">
   &nbsp;&nbsp;&nbsp;비밀번호<br><br>
   <input type="password" class="input_text" name="passwd" id="passwd">
   </div>
   <div class="login">
   <a href="LoginUIServlet"><input type="submit" value=" 로그인" id="manager"></a>
   </div>
   </form>
</td>

<td><div id="leftlogo"></div></td>

</tr>
</table>
</div>
</div>
</body>

</html>