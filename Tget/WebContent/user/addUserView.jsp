<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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
				
				$("button:contains('전송')").on("click" , function() {
					alert("인증번호 전송");
					
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
				   
				   
					$("button:contains('인증')").on("click" ,function(){ 
				
						var join = document.getElementById('join');
						
						var code = $("#sms").val();
						
		
					   if (rand == code) { 
				   
					   alert("인증 성공");
					   
					   $("#inj").hide();
					   $("#check3").show();
					   
					   join.disabled = false;
			
				   } else
				  		 { 
					   alert("인증 실패"); 
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
						
						$("button:contains('가 입')").on("click" , function() {
						//	alert("오예");
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
							alert("아이디는 반드시 입력하셔야 합니다.");
							return;
						}
						if(pw == null || pw.length <1){
							alert("패스워드는  반드시 입력하셔야 합니다.");
							return;
						}
						if(pw_confirm == null || pw_confirm.length <1){
							alert("패스워드 확인은  반드시 입력하셔야 합니다.");
							return;
						}
						if(name == null || name.length <1){
							alert("이름은  반드시 입력하셔야 합니다.");
							return;
						}
						
						if( pw != pw_confirm ) {				
							alert("비밀번호 확인이 일치하지 않습니다.");
							$("input:text[name='password2']").focus();
							return;
						}

						if($("#check4").attr("style") == "display:none;"){
							alert("이메일 인증해 십새꺄");
							return;
						}
						
						
						$("form").attr("method" , "POST").attr("action" , "/user/addUser").submit();
					}
			     
			     
			     
			     
				  /* $(function() {
						//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
						$("a:contains('취 소')").on("click" , function() {
							
						});
					});	  */				 
			     
					$(function() {
						
						$("button:contains('주소찾기')").on("click" ,function(){
						    
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
																"<strong class=\"text-success\">사용 가능합니다.</strong>");
															$("#check2").show();
														} else {
															
															$("#check2").hide();
															$("#check").children("strong")
																	.remove();
															$("#check")
																.append(
																"<strong  class=\"text-danger\">사용 불가능합니다.</strong>");
														}
													if (inputed == "") {
														
														$("#check2").hide();
														$("#check").children("strong")
															.remove();
														$("#check")
																.append(
																		"<strong class=\"text-muted\">닉네임을 입력해주세요.</strong>");
													}
													}

												});
											});

											});
					 
					 
									$(function() {
												 
												var check = "";
										
												$("button:contains('인 증')").on("click" , function() {
										
												var Id = $("#userId").val();
												
													
													if(Id == null || Id.length <1){
														alert("아이디는 반드시 입력하셔야 합니다.");
														return;
													}	
													
													
													
													
													
													alert("인증번호 발송");
													
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
												
												
											$("button:contains('확인')").on("click" , function() {
												
												var userCheck = $("#emailcode").val();		
												
												if(check.trim()==userCheck.trim()){
													alert("인증성공");
													 $("#divemail").hide();
													 $("#check4").show();
												}else{
													alert("인증실패");
												}
												
												
											});
												
												
									});
												
										/* 		$("button:contains('확인')").on("click" , function() {		
												
													if(check2==emailcode){
													
														alert("인증 완료");
													}else{
														alert(check2+""+emailcode);
													alert("인증실패");
													}
													
													
													
													
													
												});	 */
													
													
													
									
									
								/* 			
												$("button:contains('확인')").on("click" , function() {
													alert("눌렸니");
													alert(check);
													alert(emailcode);
													
													if(check!=""){
														alert(check+"받은거");
														alert(emailcode+"쓴거");
														if(check==emailcode){
																alert("인증 성공");
															   $("#divemail").hide();
															   $("#emailcode").css("","");
														}else{
															 	alert("인증 실패");													
														}
														
													}else{
														alert("먼저 인증번호를 받아주세요");
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
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">아이디</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" placeholder="아이디">
		    </div>
		  </div> -->
		   <div class="form-group">
		    <div id="check4" class="text-success" style="display:none;"><i class="fas fa-check"></i></div>
		    
		    <div>
			아이디  : 
	    <input type="text" name="userId" id="userId" maxlength="15">@
		 <select name="userId2" id="userId2" >
		      <option  id = "ig" value="@naver.com">naver.com</option>
		      <option  id = "ig" value="@daum.net">daum.net</option>
		      <option  id = "ig" value="@nate.com">nate.com</option>
		      <option id = "ig"  value="@gmail.com">gmail.com</option>
		      <option id = "ih" value="">직접입력</option>
		     
		  </select>
		    <button type="button" class="btn btn-primary">인 증</button>
		    <div class="text-center" id="loading"></div>
		    </div>
		    </div>
		    
		     <div class="form-group">
		        <div id="divemail" style="display:none;">
		      <input type="text" id="emailcode" name="emailcode" placeholder="인증번호"><button type="button" class="btn btn-primary">확인</button>
		    </div>
		  </div>
		    
		  
		  
		  	  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">비밀번호</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <img src="/resources/images/check.jpg" width="25" height="25" id="check1" style="display:none;"/> <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">비밀번호 확인</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="비밀번호 확인">
		      
		    </div>
		  </div>
		  
		  
		  
		  <div class="form-group">
		  <label for="password3" class="col-sm-offset-1 col-sm-3 control-label"></label>
		<!--   <div class="col-sm-4" id="alert-success">비밀번호가 일치합니다.</div> -->
		  <span id = "alert-success"><Strong class="text-success">비밀번호가 일치합니다.</Strong>
		      </span>
			<!-- <div class="col-sm-4" id="alert-danger">비밀번호가 일치하지 않습니다.</div> -->
			<span id = "alert-danger"><Strong class= "text-danger">비밀번호가 일치하지 않습니다.</Strong>
		      </span>
		</div>

		    <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userName" name="userName" placeholder="회원이름">
		    </div>
		  </div>
		  
		  <div class="form-group">
		  <img src="/resources/images/check.jpg" width="25" height="25" id="check2" style="display:none;"/>
		    <label for="nickName" class="col-sm-offset-1 col-sm-3 control-label">닉네임</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="nickName" name="nickName" placeholder="닉네임">
		      <span id = "check"><Strong>닉네임을 입력해주세요</Strong>
		      </span>
		    </div>
		  </div>
		  
	
		  
		
		  
		  <div class="form-group">
		  <img src="/resources/images/check.jpg" width="25" height="25" id="check3" style="display:none;"/>
		    <label for="phone" class="col-sm-offset-1 col-sm-3 control-label">휴대전화</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="phone" name="phone" placeholder="'-' 없이 입력해주세요."><button type="button" class="btn btn-primary">전송</button>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label"></label>
		    <div class="col-sm-4" id="inj" style="display:none">
		      <input type="text" class="form-control" id="sms" name="sms" placeholder="인증번호를 입력해주세요.">
		      <button type="button" class="btn btn-primary">인증</button>
		    </div>
		  </div>
		  
			<div id="emailSend" style="display: none;"> 전송중.... </div>		 
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">주소</label>
		    <div class="col-sm-4">
		     <input type="text" class="form-control" id="address" name="address" >
		      <button type="button" class="btn btn-link">주소찾기</button>
		    </div>
		      </div>
		      
		        <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">위치정보문의</label>
		    <div class="col-sm-4">
		     <input type="radio" id= "local" name="local" value="1" checked="checked" /> 동의
		     <input type="radio" id= "local" name="local" value="2" /> 비동의
		    </div>
		  </div>
		  
	
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center"><!--  disabled="disabled" -->
		      <button id= "join" type="button" class="btn btn-primary" title="반드시 휴대폰 본인인증을 하세요.">가 입</button>
			  <a class="btn btn-primary btn" href="#" role="button">취 소</a>
			 
			  
		    </div>
 			 </div>
		
		  
		  
		
		</form>
	</div>	
 	
	<jsp:include page="/layout/footer.jsp"/>
</body>

</html>