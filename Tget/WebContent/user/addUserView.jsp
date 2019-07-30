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
						phone.disabled = true;
					   
			
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
						
						$("button:contains('�� ��')").on("click" , function() {
						//	alert("����");
						 fncAddUser(); 
						 
						
						});
					});	 
			     
			     
			     function fncAddUser() {
						
						var id=$("input[name='userId']").val();
						var id2=$("select[id='userId2']").val();
						var pw=$("input[name='password']").val();
						var pw_confirm=$("input[name='password2']").val();
						var name=$("input[name='userName']").val();
						var address1=$("input[name='address']").val();
						var address2=$("input[name='address2']").val();
						if(id == null || id.length <1){
							alert("���̵�� �ݵ�� �Է��ϼž� �մϴ�.");
							return;
						}
						if(pw == null || pw.length <1){
							alert("�н������  �ݵ�� �Է��ϼž� �մϴ�.");
							return;
						}
						if(pw_confirm == null || pw_confirm.length <1){
							alert("�н����� Ȯ����  �ݵ�� �Է��ϼž� �մϴ�.");
							return;
						}
						if(name == null || name.length <1){
							alert("�̸���  �ݵ�� �Է��ϼž� �մϴ�.");
							return;
						}
						
						if( pw != pw_confirm ) {				
							alert("��й�ȣ Ȯ���� ��ġ���� �ʽ��ϴ�.");
							$("input:text[name='password2']").focus();
							return;
						}
						
						var userId = id+id2;
						
			/* 			var address = address1+address2;
						
						$("input[name='userId']").val(userId); */
						
						$("input[name='address']").val(address);
						
						$("form").attr("method" , "POST").attr("action" , "/user/addUser").submit();
					}
			     
			     
			     
			     
				  /* $(function() {
						//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
						$("a:contains('�� ��')").on("click" , function() {
							
						});
					});	  */				 
			     
					$(function() {
						
						$("button:contains('�ּ�ã��')").on("click" ,function(){
						    
					     	new daum.Postcode({
					            oncomplete: function(data) {
					                var address = '';

					                if (data.userSelectedType === 'R') {
					                	address = data.roadAddress;
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
												}) ,

											success : function(JSONData) {
																//alert(JSONData); 
																//alert(typeof(JSONData));

												if (JSONData && inputed != "") {
													$("#check").children("strong")
														.remove();
															$("#check")
																.append(
																"<strong class=\"text-success\">��� �����մϴ�.</strong>");
															$("#check2").show();
														} else {
															
															$("#check2").hide();
															$("#check").children("strong")
																	.remove();
															$("#check")
																.append(
																"<strong  class=\"text-danger\">��� �Ұ����մϴ�.</strong>");
														}
													if (inputed == "") {
														
														$("#check2").hide();
														$("#check").children("strong")
															.remove();
														$("#check")
																.append(
																		"<strong class=\"text-muted\">�г����� �Է����ּ���.</strong>");
													}
													}

												});
											});

											});
					 
					 
									$(function() {
												 
												var check = "";
										
												$("button:contains('�� ��')").on("click" , function() {
													var userId = document.getElementById("userId");
													var Id = $("#userId").val();
													
													if(Id == null || Id.length <1){
														alert("���̵�� �ݵ�� �Է��ϼž� �մϴ�.");
														return;
													}	
													
													
													
													
													
													alert("������ȣ �߼�");
													
													 $("#divemail").show();
												 	
												 	 $.ajax({ 
														   url: "/user/rest/mailSender",
														   type: "post",
														   dataType:"json" ,
														   data: { 
															  Email: $("#userId").val()+
															  $("#userId2").val(),
															 
														   },
														   beforeSend : function(){
															 
															   $('#loading').html("<div class='spinner-border text-primary' role='status'>"+
															            "<span class='sr-only'>Loading...</span>"+
															            "</div>");
															   
														   },
														   success : function(JSONData){
															console.log(JSONData);
															 $('#loading').html("");
															/* alert(JSONData.check); */
															
															if(JSONData.msg== "bad"){
																
																alert("�̹� �����ϴ� ���̵��Դϴ�.");
															}else
															check = JSONData.check;
															} 
														   
														   
												 	});  
												});
												
												
											$("button:contains('Ȯ��')").on("click" , function() {
												
												var id=$("input[name='userId']").val();
												var id2=$("select[id='userId2']").val();
												var userCheck = $("#emailcode").val();		
												var userId = document.getElementById("userId");
												if(check.trim()==userCheck.trim()){
													alert("��������");
													userId.value = id+id2;
													userId.style.border = "3px solid gold";
												
													 $("#divemail").hide();
													 $("#userId2").hide();
													 $("#injb").hide();
													 
												}else{
													alert("��������");  
												}
												
												
											});
												
												
									});
							
	</script>		
    
</head>

<body>
	<jsp:include page="/layout/tgetToolbar.jsp"/>
	<!-- ToolBar Start /////////////////////////////////////-->	
	<div id="tgetHeader" class="text-center">
		  <br/><br/>
		  <br/><br/>
	</div>
			 <div class="text-center">���̵�
							  <form class="form-horizontal">
							  
							 <!--  <div class="form-group">
							    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">���̵�</label>
							    <div class="col-sm-4">
							      <input type="text" class="form-control" id="userId" name="userId" placeholder="���̵�">
							    </div>
							  </div> -->
							   <div class="form-group" >
							   
						    <input type="text" name="userId" id="userId" maxlength="15" > 
							 <select name="userId2" id="userId2" >
							      <option  id = "ig" value="@naver.com">@naver.com</option>
							      <option  id = "ig" value="@daum.net">@daum.net</option>
							      <option  id = "ig" value="@nate.com">@nate.com</option>
							      <option id = "ig"  value="@gmail.com">@gmail.com</option>
							      <option id = "ih" value="">�����Է�</option>
							     
							  </select>
							    <button id="injb" type="button" class="btn btn-primary">�� ��</button>
							    <div id="loading"></div>
							 
							    </div>
							    
							     <div class="form-group">
							        <div id="divemail" style="display:none;">������ȣ
							      <input type="text" id="emailcode" name="emailcode" placeholder="������ȣ"><button type="button" class="btn btn-primary">Ȯ��</button>
							    </div>
							  </div>
							    
							  
							  ��й�ȣ
							  	  <div class="form-group">
							  	  
					
							      <input type="password"  id="password" name="password" placeholder="��й�ȣ">
							    
							  </div>
							  ��й�ȣȮ��
							  <div class="form-group">
						
							      <input type="password" id="password2" name="password2" placeholder="��й�ȣ Ȯ��">
							      
							  
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
					
							      <input type="text" id="userName" name="userName" placeholder="ȸ���̸�">
							 
							  </div>
							  
							  �г���<div class="form-group">
							  <img src="/resources/images/check.jpg" width="25" height="25" id="check2" style="display:none;"/>
							    <label for="nickName"></label>
							    
					
							      <input type="text" id="nickName" name="nickName" placeholder="�г���"><br>
							      <span id = "check"><Strong>�г����� �Է����ּ���</Strong>
							      </span>
							
							  </div>
							  
						
							  
							
							  
							  �޴���ȭ<div class="form-group">
							  <img src="/resources/images/check.jpg" width="25" height="25" id="check3" style="display:none;"/>
							    <label for="phonee"></label>
							    
					
							      <input type="text" id="phone" name="phone" placeholder="'-' ���� �Է����ּ���."><button type="button" class="btn btn-primary">����</button>
							  
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
					 
							    �� ��������<input class="col-sm-3" type="text" id="address" name="address" >
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
							      <button id= "join" type="button" class="btn btn-primary" title="�ݵ�� �޴��� ���������� �ϼ���.">�� ��</button>
								  <a class="btn btn-primary btn" href="#" role="button">�� ��</a>
								
					 			 </div>
							
							  
							  
							
							</form>
							
						</div>	
	<jsp:include page="/layout/footer.jsp"/>
</body>

</html>