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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">	
	<link rel="stylesheet" href="/resources/css/toolbar.css" />
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
	
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>	
		<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
   				
	<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
       body{	
		      color: #FBFCFE ;		  
			  background-color: #062038;
			  margin-top: 50px;				
			  font-family: 'Nanum Gothic', sans-serif;
		}
		a{
			color: #FBFCFE ;	
		}
		hr{
			border: 1px groove white;
		}
		.list-group-item{
			  margin-left:50px;	
			  color: #FBFCFE ;
			  border: 1px groove white;		  
			  background-color: #062038;
		}
		.col-2{
		}	
		.col-lg-3{			
			margin-bottom: 20px;
		}
		.row.in{
			margin-left:50px;
			margin-right: 50px;
		}
		.border{
			padding-top: 20px;
			background-color: #193147;
		}
		section{
			margin-left: 100px;
		}
		#inputGroupSelect01, nav{
			background: rgba(4, 22, 37, 0.75);
			color: #c0c5c9;
		} 
		#tgetHeader{
			margin-top:30px;
		   color: #FBFCFE;	
	       padding-top: 30px;
	       padding-bottom: 70px;
	       margin-bottom: 30px;
	       		background: url(/resources/images/pic05.jpg) no-repeat center center fixed; 
				  -webkit-background-size: cover;
				  -moz-background-size: cover;
				  -o-background-size: cover;
				  background-size: cover;	
       } 
       #footer{
			background-color: #1B1B1F;
		}
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

	</script>		
    
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->

			
		  
		  <script type="text/javascript">

		  $(function() {
			  
			  var rand = "";
			  
				
				$("button:contains('����')").on("click" , function() {
					alert("������ȣ ����");
					
					$.ajax({ 
						
						   url: "/user/json/sendSms",
						   data: { 
							   receiver: $("#phone").val() 
							   }, 
							   type: "post", 
							   dataType:"json", 
	
							   
							   success : function(JSONData){
									console.log(JSONData);   
					
									rand = JSONData.rand;
						   
						   }  
					
					
						});
					
					});
			   
			  
					
				$("button:contains('����')").on("click" ,function(){ 
				   
				 
					var phone = document.getElementById("phone");
					
					var code = $("#sms").val();
					
						//alert("����");
					
		
					   
					   if (rand == code) { 
						   
						   alert("���� ����");
						   
							phone.readOnly = true;
						
					   btn.disabled = false;

					   
					   } else
				  		 { 
					   alert("���� ����"); 
				  	 	} 
				 	   
				   });
			   });
				
			   $( function() {
					
					$("#userName").focus();
					
					//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$("button:contains('ã��')").on("click" , function() {
						
					//	alert("������");
						
					
						
						 $.ajax({ 
							   url: "/user/json/finduserId",
						   data: { 
							
							   userName: $("#userName").val(), 
							   phone: $("#phone").val(), 
							   }, 
							   type: "post", 
							   dataType:"json", 
							   
							   
							   success : function(JSONData){
									console.log(JSONData);   
							   
							   if(JSONData.msg== "no"){
								   
								   alert("�Է��Ͻ� ������ ȸ�������� �����ϴ�");
							   }
							   else if(JSONData.msg== "yes"){
								   
							   
								   alert(JSONData.Id);
							   }
						   }
							   });
				});	
					});
				
			   
				$(function() {
					$("input[name='userName']").on('keyup',function() {

						
						  if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				               var inputVal = $(this).val();
				               $(this).val(inputVal.replace(/[^(��-��a-zA-Z)]/gi, ''));
				            }
				         });
				 });

				$(function() {
					$("input[name='phone']").on('keyup',function() {

						
				 $(this).val($(this).val().replace(/[^0-9]/g,""));
				 //alert("���ڸ� �Է��ϼž� �մϴ�.");
				 
					});
				   });

			   
			   
			   
		     </script>
				
		  <form class="form-horizontal">
		  <h4 align="center">���̵� ã��</h4>
			<hr/><br/>
			<div class="text-center">
		<div>
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">�̸�</label>
		    <div class="text-center">
		      <input type="text" id="userName" name="userName" placeholder="ȸ���̸�">
		    </div>
		  </div>
		
		
		  <br/>
		  <div>
		    <label for="phone" class="col-sm-offset-1 col-sm-3 control-label">�޴���ȭ</label>
		    <div class="text-center">
		      <input type="text" id="phone" name="phone" placeholder="'-' ���� �Է����ּ���."><button type="button" class="btn btn-outline-primary">����</button>
		       
		    </div>
		  </div>
		  <br/>
		  <div id = "injj">
		    <label for="sms" class="col-sm-offset-1 col-sm-3 control-label">������ȣ</label>
		    <div class="text-center">
		      <input type="text" class="text-center" id="sms" name="sms" placeholder="������ȣ">
		      <button type="button" class="btn btn-outline-primary">����</button>
		    </div>
		  </div>
		  
	<br/><br/><br/>
	<br/>
		  <div>
		    <div class="text-center">
		     
		      <button type="button" id ="btn" class="btn btn-outline-primary" disabled="disabled">ã��</button> 
		      
		  			  <a class="btn btn-outline-primary btn" href="#" role="button">�� ��</a>
			 
			  
		    </div>
 			 </div>
		  
		  
		</div>	
		</form>
		
</body>

</html>