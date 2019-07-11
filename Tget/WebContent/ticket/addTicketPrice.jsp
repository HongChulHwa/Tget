<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
	   body {
            padding-top : 50px;
        }
    
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">	
		
		
	function fncAddTicketPrice(){
		//Form ��ȿ�� ����
	 	var price = $("input[name='price']").val();
		
		if(price == null || price.length<1){
			alert("������ �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if(isNaN(price)==true) {
			alert("���ݿ� �����Է� �ٶ��ϴ�.");
			return;
		}
	
		$("form").attr("method" , "POST").attr("action" , "/ticket/addTicketPrice").submit();
	}		
	
	$(function(){
	    
	    $("button").on("click",function(){
	    	
	    	fncAddTicketPrice();
	    	
	    });
		
	    $("a[href='#']").on("click",function(){
	    	
	    	self.location = "/";
	    	
	    });
	    
	    $("input[name='price']").on("keyup", function(){
	    	
	    	var price = $(this).val();
	    	if(price == "" || isNaN(price)==true){
	    		return;
	    	}
	    	$.ajax(
					{
						url : "/ticket/rest/getTicketSellProb/"+price+"/${sellticketInfo.event.eventId}" ,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(data) {							
							var sellProb = data.sellProb.sellprob;
							if(sellProb == 0){
								$("#sellProb").html("�Ǹ�Ȯ���� �����ϴ�.")
							}else if(sellProb == 1){
								$("#sellProb").html("��հ��� �Դϴ�.")
							}else{
								$("#sellProb").html("�Ǹ�Ȯ���� �ſ� �����ϴ�.")
							}
						}							 
			});
	    	
	    });
	    
	});
	</script>		
    
</head>

<body>
	
	<div class="container">
	<br/>
		<h1 class="text-center">�ǸŰ��� ����  ${sellticketInfo.event.eventName}</h1>
				
		<form class="form-horizontal">				  
		<br/>
		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">��� ����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price" placeholder="�ǸŰ����Է�">
		    </div>
		  </div>
		  <div class="form-group">
		  <label for="lowPrice" class="col-sm-offset-1 col-sm-3 control-label">��� ������</label>
		  <div class="col-sm-4">
		  ${sellProb.lowPrice}
		  </div>
		  </div>
		  <div class="form-group">
		  <label for="highPrice" class="col-sm-offset-1 col-sm-3 control-label">��� �ְ�</label>
		  <div class="col-sm-4">
		   ${sellProb.highPrice}
		  </div>
		  </div>
		  <div class="form-group">
		  <label for="sellProb" class="col-sm-offset-1 col-sm-3 control-label">�Ǹ� Ȯ��</label>
		  <div class="col-sm-4">
		  	<span id="sellProb"></span>
		  </div>
		  </div>		  		
		<br/>
		   <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
			  <a class="btn btn-danger btn" href="#" role="button">�Խõ� &nbsp;�Ǹ���Ȳ &nbsp;����</a>
		    </div>
		  </div>
		 <br/>
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
		    </div>
		  </div>
		</form>
		
 	</div>
</body>

</html>