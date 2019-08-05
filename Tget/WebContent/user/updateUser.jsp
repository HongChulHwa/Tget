<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
	
	var ch = 0;
	
	var cch = 0;
	
		  $(function() {
			 
		 		var rand = "";
			
				
				$("button:contains('����')").on("click" , function() {
					alert("������ȣ ����");
					
			
					
					
					$("#inj").show();
				
					
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
				
						var join = document.getElementById('join');
		
						var phone = document.getElementById("phone");
						
						var code = $("#sms").val();
			
						
					   if (rand == code) { 
				   
					   alert("���� ����");
					   
					   $("#inj").hide();
						phone.style.border = "3px solid gold";
						phone.readOnly = true;
						$("#pij").hide();
					   	cch = 1;
						
				   } else
				  		 { 
					   alert("���� ����"); 
				  	 	} 
				 	   
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
				
				$("button:contains('�ּ�ã��')").on("click" ,function(){
				    
			     	new daum.Postcode({
			            oncomplete: function(data) {
			                var address = '';

			                if (data.userSelectedType === 'R') {
			                	addresss = data.roadAddress;
			                } else { 
			                	address = data.jibunAddress;
			                }				
			               
			                $("#address").val(address);
			            }
			        }).open(); 
			 	
			 		});
				});
	     
			
			 $(function() {

					$("input[name='nickName']").on('keyup',function() {

						var inputed = $("input[name='nickName']").val();
										

						$.ajax({
						url : "/user/json/checknickNameDuplication",
						method : "POST",
						dataType : "json",
							headers : {
								"Accept" : "application/json",
							"Content-Type" : "application/json"
										},
									data : JSON.stringify({
										nickName : inputed,
										}),

									success : function(JSONData) {
														//alert(JSONData); 
														//alert(typeof(JSONData));

										if (JSONData && inputed != "") {
											$("#check").children("strong")
												.remove();
													$("#check")
														.append(
														"<strong class=\"text-success\">��� �����մϴ�.</strong>");
												} else {
													$("#check").children("strong")
															.remove();
													$("#check")
														.append(
														"<strong  class=\"text-danger\">������ �г��� �Է����ּ���.</strong>");
												}
								
											}

										});
									});

									});
	
	
	
	
	
	
	
	
	
		//============= "����"  Event ���� =============
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$("button:contains('����')").on("click" , function() {
				
						fncUpdateUser();
			});
		});	
		
		
		//============= "���"  Event ó�� ��  ���� =============
 
			   $(function() {
			   $("button:contains('���')").on("click" , function() {
				  
			   		self.close();
			   
			   });
			   });

		///////////////////////////////////////////////////////////////////////
		function fncUpdateUser() {
		
			var pwd1=$("#password").val();
            var pwd2=$("#password2").val();
        	var address1=$("input[name='address']").val();
			var address2=$("input[name='address2']").val();
			
			
			if(pwd1 != pwd2){
				
				alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");	
				return;
			}
			
			var address = address1+address2;
			
			
			
		 	$("input[name='address']").val(address); 
			
				
			$("form").attr("method" , "POST").attr("action" , "/user/updateUser").submit();
		}
	
	</script>
	
</head>

<body>

	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	
		<div class="page-header text-center">
	       <h3 class=" text-info">ȸ����������</h3>
	       
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
	    
	     <div class="login-card" style="margin-left:400px; margin-right: 400px; color:black;">
                    <div class="card form" id="form1">
                        <div class="card-header" align="center" style="background-color: Lime;">
                            <h3><i class="fas fa-user-edit"></i><br/></h3>
                            
                        </div>
			 <div class="text-center" style="background-color: white;"><br/><br/>
					<div class="row">	
					<div class="col-md-3" style="margin-left: 10px;">
					<span style="color: black;"><Strong>���̵�</Strong> </span>
					<br/><br/><br/>
					<span id= "h1" style="color: black; display: none;" >������ȣ<br/><br/><br/><br/></span>
					
					<span style="color: black;"><Strong>��й�ȣ</Strong> </span>
					<br/><br/><br/><br/><br/><br/>
					<span style="color: black;"><Strong>�̸�</Strong> </span>
				<br/><br/><br/>
					<span style="color: black;"><Strong>�г���</Strong> </span>
				<br/><br/><br/>
					<span style="color: black;"><Strong>�޴���ȭ</Strong> </span>
						<br/><br/><br/><br/>
					<span id= "h2" style="color: black;  display: none;" >������ȣ<br/><br/><br/><br/></span>
		
					<span style="color: black;"><Strong>�ּ�</Strong> </span>
				</div>
					
					<div class="col-md-8">
							
							
					
						<form class="form-horizontal">
						
						   <div class="form-group" >
							    <div class="input-group-prepend">
							<input type="text" class="form-control col-md-5" name="userId" id="userId01" maxlength="15" style="width:23%" > 
    							<span class="input-group-text" id="addon-wrapping">@</span>
  
							 <select class="custom-select col-md-3" name="userId2" id="userId02" style="width:23%" >
							      <option  id = "ig" value="@naver.com">naver.com</option>
							      <option  id = "ig" value="@daum.net">daum.net</option>
							      <option  id = "ig" value="@nate.com">nate.com</option>
							      <option id = "ig"  value="@gmail.com">gmail.com</option>
							      <option id = "ih" value="">�����Է�</option>							     
							  </select>
							     ��<button id="injb" type="button" class="btn btn-outline-primary">�� ��</button><i id="sm1" class="far fa-grin fa-2x" style="color:Green; display:none;"></i>
							    <div id="loading"></div>
									</div>

							    </div>
							    
							     <div class="form-group">
							     <div class="input-group-prepend">
							        <div id="divemail" style="display:none;">������ȣ
							      <input type="text"  class="form-control" id="emailcode" name="emailcode" placeholder="������ȣ"><button type="button" class="btn btn-outline-primary">Ȯ��</button>
							    </div>
							  </div>
							  </div>
							    
							  
							  	  <div class="form-group">
							  	  <div class="input-group-prepend">
					
							      <input type="password" class="form-control col-md-10"  id="password01" name="password" placeholder="��й�ȣ">
							    </div>
							  </div>
							  
							  
							  
							  <div class="form-group">
						 <div class="input-group-prepend">
							      <input type="password"  class="form-control col-md-10"   id="password02" name="password2" placeholder="��й�ȣ Ȯ��">
							      
							  </div>
							  </div>
							 
							  <div class="form-group">
							  <label for="password3"></label>
							<!--   <div class="col-sm-4" id="alert-success">��й�ȣ�� ��ġ�մϴ�.</div> -->
							
							  <span id = "alert-success"><Strong class="text-success">��й�ȣ�� ��ġ�մϴ�.</Strong>
							      </span>
								<!-- <div class="col-sm-4" id="alert-danger">��й�ȣ�� ��ġ���� �ʽ��ϴ�.</div> -->
								<span id = "alert-danger"><Strong class= "text-danger">��й�ȣ�� ��ġ���� �ʽ��ϴ�.</Strong>
							      </span>
							</div>
								
							    <div class="form-group">
							      <div class="input-group-prepend">
							    <label for="userName"></label>
					
							      <input type="text" class="form-control col-md-10"  id="userName" name="userName" placeholder="ȸ���̸�">
							   </div>
							  </div>
							  
							  <div class="form-group">
							  <div class="input-group-prepend">
							  
							  
							    <label for="nickName"></label>
							      <input type="text" class="form-control col-md-10"   id="nickName" name="nickName" placeholder="�г���"><br>
							     
							
							  </div>
							   <span id = "check"><Strong>�г����� �Է����ּ���</Strong>
							      </span>
							    </div>
						
							  
							
							  
							  <div class="form-group"> 
							  <div class="input-group-prepend">
							
							    
					
							      <input class="form-control col-md-10"   type="text" id="phone" name="phone" placeholder="'-' ���� �Է����ּ���.">��<button id="pij" type="button" class="btn btn-outline-primary">����</button>
							      <i id="sm2" class="far fa-grin fa-2x" style="color:Green; display:none;"></i>
							  
							  </div>
							   </div>
							 <div class="form-group">
							   <div class="input-group-prepend">
							    <label for="ssn"></label>
							   <div id="inj" class="text-center" style="display:none">  ������ȣ
							      <input type="text" class="form-control"  id="sms" name="sms" placeholder="������ȣ�� �Է����ּ���.">
							      <button id="injb2" type="button" class="btn btn-outline-primary">����</button>
							    </div>
							  </div>
							  </div>
							  <div id="emailSend" style="display: none;"> ������.... </div>		 
							  <div>
							    <label for="ssn"></label>
					 
								<input class="form-control col-md-10"  type="text" id="address" name="address" >
	<button type="button" class="btn btn-link">�ּ�ã��</button>
							      </div><br>
								<input class="form-control col-md-10"  type="text" id="address2" name="address2" >
							        <div class="form-group">
							        <br>
							        
							    <label for="ssn">	<span style="color: black;"><Strong>��ġ���� ����</Strong> </span></label>
							    <div>
							    
							     <input type="radio" id= "local" name="local" value="1" checked="checked" /> ����
							     <input type="radio" id= "local" name="local" value="2" /> ����
							    </div>
							  </div>
							  
						
							  <div class="form-group">
							   <!--  disabled="disabled" -->
							      <button id= "join" type="button" class="btn btn-outline-primary" title="�ݵ�� �޴��� ���������� �ϼ���.">�� ��</button>
								  <a class="btn btn-outline-danger btn" href="#" role="button">�� ��</a>
								
					 			 </div>
					 			
					 			 
							
		
	
	<br/>
	<br/>
	
						  
							</form>
						
							</div>
							</div>
							</div>
							</div>
						</div>	
						
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
			 <%-- <div class="text-center">���̵�
							  <form class="form-horizontal">
						   <div class="form-group" >
							   
						   
									${user.userId}
							    </div>
							     <input type="hidden" class="col-sm-2" id="userId" name="userId" value="${user.userId}" >
							     <div class="form-group">
							        <div id="divemail" style="display:none;">������ȣ
							      <input type="text"  id="emailcode" name="emailcode" placeholder="������ȣ"><button type="button" class="btn btn-primary">Ȯ��</button>
							    </div>
							  </div>
							    
							  
							  ��й�ȣ
							  	  <div class="form-group">
							  	  
					
							      <input type="password" class="col-sm-2" id="password" name="password" placeholder="��й�ȣ">
							    
							  </div>
							  ��й�ȣȮ��
							  <div class="form-group">
						
							      <input type="password" class="col-sm-2" id="password2" name="password2" placeholder="��й�ȣ Ȯ��">
							      
							  
							  </div>
							 
							  
							  
							  <div class="form-group">
							  <label for="password3"></label>
							<!--   <div class="col-sm-4" id="alert-success">��й�ȣ�� ��ġ�մϴ�.</div> -->
							  <span id = "alert-success"><Strong class="text-success">��й�ȣ�� ��ġ�մϴ�.</Strong>
							      </span>
								<!-- <div class="col-sm-4" id="alert-danger">��й�ȣ�� ��ġ���� �ʽ��ϴ�.</div> -->
								<span id = "alert-danger"><Strong class= "text-danger">��й�ȣ�� ��ġ���� �ʽ��ϴ�.</Strong>
							      </span>
							</div>
								
							    �̸�<div class="form-group">
							    <label for="userName"></label>
								<input type="hidden" class="col-sm-2" id="userName" name="userName" value="${user.userName}" >
							     ${user.userName}
							 
							  </div>
							  
							  �г���<div class="form-group">
							  
							    <label for="nickName"></label>
							    
					
							      <input type="text" class="col-sm-2" id="nickName" name="nickName" value="${user.nickName}"><br>
							      <span id = "check"><Strong></Strong>
							      </span>
							
							  </div>
							  
						
							  
							
							  
							  �޴���ȭ<div class="form-group">
							 
							    <label for="phonee"></label>
							    
					
							      <input value="${user.phone}" class="col-sm-2" type="text" id="phone" name="phone" placeholder="'-' ���� �Է����ּ���."><button id="pij" type="button" class="btn btn-primary">����</button>
							  
							  </div>
							  
							 <div class="form-group">
							    <label for="ssn"></label>
							   <div id="inj" style="display:none">  ������ȣ
							      <input type="text" id="sms" name="sms" placeholder="������ȣ�� �Է����ּ���.">
							      <button id="injb2" type="button" class="btn btn-primary">����</button>
							    </div>
							  </div>
							  
							  �ּ�<div id="emailSend" style="display: none;"> ������.... </div>		 
							  <div>
							    <label for="ssn"></label>
					 
							    �� ��������<input class="col-sm-3" type="text" id="address" name="address" value="${user.address}" >
							      <button type="button" class="btn btn-link">�ּ�ã��</button>
							 
							      </div>���ּ�<br>
							      <input class="col-sm-3" type="text" id="address2" name="address2" >
							        <div class="form-group">
							        <br>
							    <label for="ssn">��ġ��������</label>
							    <div>
							    
							     <input type="radio" id= "local" name="local" value="1" checked="checked" /> ����
							     <input type="radio" id= "local" name="local" value="2" /> ����
							    </div>
							  </div>
							  
						
							  <div class="form-group">
							   <!--  disabled="disabled" -->
							      <button id= "join" type="button" class="btn btn-primary">����</button>
								  <button id= "cancel" type="button" class="btn btn-primary">���</button>
								
					 			 </div>
							
							  
							  
							
							</form>
							
						</div>	 --%>
</body>

</html>