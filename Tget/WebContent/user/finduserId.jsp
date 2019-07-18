<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta http-equiv="X-UA-Compatible" content="ie=edge" />
	
 
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
		<script src="/resources/javascript/common.js" ></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

	</script>		
    
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>

		  
		  <script type="text/javascript">
		   $(function() {
			
			   $("button:contains('����')").on("click" , function() {
					alert("������ȣ ����");
					$.ajax({ 
						   url: "/user/sendSms",
						   data: { 
							   receiver: $("#phone").val() 
							   }, 
							   type: "post", 
							
				   success: function(result) { 
					
					   if (result == "true") { 
						   console.log(result);
						   }  else { 
							   alert("������ȣ ���� ����");
							   } 
					   }
						 }); 
					
						});
					});
			   
			   $(function() {
					
					$("button:contains('����')").on("click" ,function(){ 
						//alert("����");
					
				   $.ajax({ 
					   url: "/user/json/smsCheck",
				   data: { 
					   code: $("#sms").val() 
					   }, 
					   type: "post", 
				   success: function(result){ 
					   console.log(result);
					   
					   
					   
					   if (result == "true") { 
				   
					   alert("���� ����");
					   
				   } else if (result == "false")
				  		 { 
					   alert("���� ����"); 
				  	 	} 
				 	  } 
				   })
			   })
			   });
		     </script>
				
		  <form class="form-horizontal">
		  
	
		<div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">�̸�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userName" name="userName" placeholder="ȸ���̸�">
		    </div>
		  </div>
		
		
		  
		  <div class="form-group">
		    <label for="phone" class="col-sm-offset-1 col-sm-3 control-label">�޴���ȭ</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="phone" name="phone" placeholder="'-' ���� �Է����ּ���."><button type="button" class="btn btn-primary">����</button>
		       
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="sms" class="col-sm-offset-1 col-sm-3 control-label">������ȣ</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="sms" name="sms" placeholder="������ȣ">
		      <button type="button" class="btn btn-primary">����</button>
		    </div>
		  </div>
		  
	
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary">ã��</button>
			  <a class="btn btn-primary btn" href="#" role="button">�� ��</a>
			 
			  
		    </div>
 			 </div>
		  
		  
		
		</form>
		
 	
	
</body>

</html>