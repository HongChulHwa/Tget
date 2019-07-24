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
						   url: "/user/json/sendSms",
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
					
				   var btn = document.getElementById('btn');
				   
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
					   
					 
					   btn.disabled = false;

					   
				   } else if (result == "false")
				  		 { 
					   alert("���� ����"); 
				  	 	} 
				 	  } 
				   })
			   })
			   });
			   
			   $( function() {
					
					$("#userName").focus();
					
					//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$("button:contains('ã��')").on("click" , function() {
						
						alert("������");
				
						 $.ajax({ 
							   url: "/user/json/findPassword",
						   data: { 
							   userId: $("#userId").val()
							   }, 
							   type: "post", 
							   
						   success: function(result){ 
							   console.log(result);
							   
							   if(result == "no"){
								   $('#findpassword').modal('hide');
								   alert("�Է��Ͻ� ������ ȸ�������� �����ϴ�");
								   
							   }
							  
						   }
							   });
				});	
					});
				
			   $(function(){
			         $("#alert-success").hide();
			         $("#alert-danger").hide();
			         $("input").keyup(function(){
			             var pwd1=$("#password").val();
			             var pwd2=$("#password2").val();
			             if(pwd1 != "" || pwd2 != ""){
			                 if(pwd1 == pwd2){
			                	 
			                 	$("#check1").show();
			                     $("#alert-success").show();
			                     $("#alert-danger").hide();
			                     $("#submit").removeAttr("disabled");
			                 }else{
			                	 
			                	 $("#check1").hide();	
			                     $("#alert-success").hide();
			                     $("#alert-danger").show();
			                     $("#submit").attr("disabled", "disabled");
			                 }    
			             }
			         });
			     });

			   $(function() {
					//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
							$("button:contains('����')").on("click" , function() {
			   
								$("form").attr("method" , "GET").attr("action" , "/user/updatePassword").submit();
				
							});
			   });
			   
		     </script>
				
		  <form class="form-horizontal">
		  <h4 align="center">��й�ȣ ã��</h4>
			<hr/>
		<div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">���̵�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" placeholder="���̵�">
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
		  
	
			
			<div class="form-group" align="center">
		      <button type="button" id= "btn" class="btn btn-primary" data-toggle="modal" data-target="#findpassword" disabled="disabled">ã��</button>
			  <a class="btn btn-danger btn" href="#" role="button" >��&nbsp;��</a>
		</div>
		
				
 
		<div class="modal fade" id="findpassword" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-lg" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="modalCenterTitle">������ ��й�ȣ ����</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					     <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="��й�ȣ">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <img src="/resources/images/check.jpg" width="25" height="25" id="check1" style="display:none;"/> <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ Ȯ��</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="��й�ȣ Ȯ��">
		      
		    </div>
		  </div>

		  <div class="form-group">
		  <label for="password3" class="col-sm-offset-1 col-sm-3 control-label"></label>
		<!--   <div class="col-sm-4" id="alert-success">��й�ȣ�� ��ġ�մϴ�.</div> -->
		  <span id = "alert-success"><Strong class="text-success">��й�ȣ�� ��ġ�մϴ�.</Strong>
		      </span>
			<!-- <div class="col-sm-4" id="alert-danger">��й�ȣ�� ��ġ���� �ʽ��ϴ�.</div> -->
			<span id = "alert-danger"><Strong class= "text-danger">��й�ȣ�� ��ġ���� �ʽ��ϴ�.</Strong>
		      </span>
		</div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">����</button>
					      </div>
					    </div>
					  </div>
	</div>	
	</form>			
 	
	</body>

</html>