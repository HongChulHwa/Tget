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
						
						var code = $("#sms").val();
						
		
					   if (rand == code) { 
				   
					   alert("���� ����");
					   
					   $("#inj").hide();
					   $("#check3").show();
					   
					   join.disabled = false;
			
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

						if($("#check4").attr("style") == "display:none;"){
							alert("�̸��� ������ �ʻ���");
							return;
						}
						
						
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
															check = JSONData.check;
															} 
														   
														   
												 	});  
												});
												
												
											$("button:contains('Ȯ��')").on("click" , function() {
												
												var userCheck = $("#emailcode").val();		
												
												if(check.trim()==userCheck.trim()){
													alert("��������");
													 $("#divemail").hide();
													 $("#check4").show();
												}else{
													alert("��������");
												}
												
												
											});
												
												
									});
												
										/* 		$("button:contains('Ȯ��')").on("click" , function() {		
												
													if(check2==emailcode){
													
														alert("���� �Ϸ�");
													}else{
														alert(check2+""+emailcode);
													alert("��������");
													}
													
													
													
													
													
												});	 */
													
													
													
									
									
								/* 			
												$("button:contains('Ȯ��')").on("click" , function() {
													alert("���ȴ�");
													alert(check);
													alert(emailcode);
													
													if(check!=""){
														alert(check+"������");
														alert(emailcode+"����");
														if(check==emailcode){
																alert("���� ����");
															   $("#divemail").hide();
															   $("#emailcode").css("","");
														}else{
															 	alert("���� ����");													
														}
														
													}else{
														alert("���� ������ȣ�� �޾��ּ���");
													}
												
													
													
										});						
											});
											
											
								
											 */
											
											
											
	</script>		
    
</head>

<body>
	<jsp:include page="/layout/tgetToolbar.jsp"/>
	<!-- ToolBar Start /////////////////////////////////////-->	
	<div id="tgetHeader" class="text-center">
		  <br/><br/>
		  <br/><br/>
	</div>
		 <div class="text-center">
		  <form class="form-horizontal">
		  
		 <!--  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">���̵�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" placeholder="���̵�">
		    </div>
		  </div> -->
		   <div class="form-group">
		    <div id="check4" class="text-success" style="display:none;"><i class="fas fa-check"></i></div>
		    
		    <div>
			���̵�  : 
	    <input type="text" name="userId" id="userId" maxlength="15">@
		 <select name="userId2" id="userId2" >
		      <option  id = "ig" value="@naver.com">naver.com</option>
		      <option  id = "ig" value="@daum.net">daum.net</option>
		      <option  id = "ig" value="@nate.com">nate.com</option>
		      <option id = "ig"  value="@gmail.com">gmail.com</option>
		      <option id = "ih" value="">�����Է�</option>
		     
		  </select>
		    <button type="button" class="btn btn-primary">�� ��</button>
		    <div class="text-center" id="loading"></div>
		    </div>
		    </div>
		    
		     <div class="form-group">
		        <div id="divemail" style="display:none;">
		      <input type="text" id="emailcode" name="emailcode" placeholder="������ȣ"><button type="button" class="btn btn-primary">Ȯ��</button>
		    </div>
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

		    <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">�̸�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userName" name="userName" placeholder="ȸ���̸�">
		    </div>
		  </div>
		  
		  <div class="form-group">
		  <img src="/resources/images/check.jpg" width="25" height="25" id="check2" style="display:none;"/>
		    <label for="nickName" class="col-sm-offset-1 col-sm-3 control-label">�г���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="nickName" name="nickName" placeholder="�г���">
		      <span id = "check"><Strong>�г����� �Է����ּ���</Strong>
		      </span>
		    </div>
		  </div>
		  
	
		  
		
		  
		  <div class="form-group">
		  <img src="/resources/images/check.jpg" width="25" height="25" id="check3" style="display:none;"/>
		    <label for="phone" class="col-sm-offset-1 col-sm-3 control-label">�޴���ȭ</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="phone" name="phone" placeholder="'-' ���� �Է����ּ���."><button type="button" class="btn btn-primary">����</button>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label"></label>
		    <div class="col-sm-4" id="inj" style="display:none">
		      <input type="text" class="form-control" id="sms" name="sms" placeholder="������ȣ�� �Է����ּ���.">
		      <button type="button" class="btn btn-primary">����</button>
		    </div>
		  </div>
		  
			<div id="emailSend" style="display: none;"> ������.... </div>		 
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�ּ�</label>
		    <div class="col-sm-4">
		     <input type="text" class="form-control" id="address" name="address" >
		      <button type="button" class="btn btn-link">�ּ�ã��</button>
		    </div>
		      </div>
		      
		        <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">��ġ��������</label>
		    <div class="col-sm-4">
		     <input type="radio" id= "local" name="local" value="1" checked="checked" /> ����
		     <input type="radio" id= "local" name="local" value="2" /> ����
		    </div>
		  </div>
		  
	
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center"><!--  disabled="disabled" -->
		      <button id= "join" type="button" class="btn btn-primary" title="�ݵ�� �޴��� ���������� �ϼ���.">�� ��</button>
			  <a class="btn btn-primary btn" href="#" role="button">�� ��</a>
			 
			  
		    </div>
 			 </div>
		
		  
		  
		
		</form>
	</div>	
 	
	<jsp:include page="/layout/footer.jsp"/>
</body>

</html>