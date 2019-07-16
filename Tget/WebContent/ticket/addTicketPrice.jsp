<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="/resources/javascript/common.js" ></script>
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
            background-color : whitesmoke;
        }
    
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">	
		
		
	function fncAddTicketPrice(){
		//Form ��ȿ�� ����
	 	var price = $("input[name='price']").val();
	 	var result = numberWithOutCommas(price);
	 	
		if(result == null || result.length<4){
			alert("������ 1,000�� �̻����� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if(isNaN(result)==true) {
			alert("���ݿ� �����Է� �ٶ��ϴ�. �Է� �� :"+result);
			return;
		}
		
		$("input[name='price']").val(result);
		$("form").attr("method" , "POST").attr("action" , "/ticket/addTicketPrice").submit();
	}		
	
	
	$(function(){
	    
		var lowPrice = numberWithCommas(${sellProb.lowPrice});
		$("#lowPrice").html(""+lowPrice);
		
		var highPrice = numberWithCommas(${sellProb.highPrice});
		$("#highPrice").html(""+highPrice);
		
		var avgPrice = numberWithCommas(${sellProb.avgPrice});
		$("#avgPrice").html(""+avgPrice);
		
	    $("button").on("click",function(){
	    	
	    	fncAddTicketPrice();
	    	
	    });
		
		$("a[href='#']:contains('��&nbsp;��')").on("click",function(){
	    	
	    	self.location = "/";
	    	
	    });
	    
	    $("input[name='price']").on("keyup", function(){
	    	
	    	var price = numberWithOutCommas($(this).val());
	    	
	    	if(price.length>9){
	    		$(this).val("999,999,999");
	    		return;
	    	}
	    	
	    	if(price == "" || isNaN(price)==true || price.length<4){
	    		$("#sellProb").html("");
	    		return;
	    	}else{
	    		var num = numberWithCommas(price);
	    		$(this).val(num);
	    	}	    	
	    	$.ajax(
					{
						url : "/ticket/rest/getTicketSellProb/"+price+"/${ticket.event.eventId}" ,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(data) {	
							var sellProb = data.sellprob;
							if(sellProb == 0){
								$("#sellProb").html("��õ���� : ������ �����Դϴ�. �ش� ������ Ƽ���� �Ǹ� Ȯ���� �� �����ϴ�.").css("color" , "blue");
							}else if(sellProb == 1){
								$("#sellProb").html("��հ��� : �ش� ������ Ƽ���� �Ǹ� Ȯ���� �����ϴ�.").css("color" , "green");
							}else if(sellProb == 2){
								$("#sellProb").html("�������� : �ش� ������ Ƽ���� �Ǹ� Ȯ���� �ſ� �����ϴ�.").css("color" , "orange");
							}else{
								$("#sellProb").html("�ְ��� : �����ϼ���! �ش� ������ Ƽ���� �Ǹ� Ȯ���� ����մϴ�.").css("color" , "red");
							}
						}							 
			});
	    	
	    });
	    
	});
	</script>		
    
</head>

<body>
	<jsp:include page="/layout/toolbar.jsp" />
	<div class="container">
	<br/>
		<h1 class="text-center">�ǸŰ��� ����  ${ticket.event.eventName}</h1>
				
		<form>
		<div class="text-center">				  
		<br/>
		  <div class="form-group">
		    <strong>��� ���� : </strong>
		     <input type="text" id="price" name="price" placeholder="�ǸŰ����Է�">
		  </div>
		  <div class="form-group">
		  <strong>��� ������ : </strong>
		  	<span id="lowPrice"></span>
		  </div>
		  <div class="form-group">		 
		  <strong>��� �ְ� : </strong>
		  	<span id="highPrice"></span>
		  </div>
		  <div class="form-group">
		  <strong>��� �� : </strong>
		  	<span id="avgPrice"></span>		  
		  </div>
		  <div class="form-group">
		  <strong>�Ǹ� Ȯ�� : </strong> 
		  	<span id="sellProb"></span>
		  </div>
		<br/>
		   <div class="form-group">
			  <a class="btn btn-danger btn" href="#" role="button">�Խõ� &nbsp;�Ǹ���Ȳ &nbsp;����</a>
		  </div>
		 <br/>
		  <div class="form-group">
		      <button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
		  </div>
		  </div>
		</form>
		
 	</div>
</body>

</html>