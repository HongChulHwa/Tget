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


	
	/*  $(function() {
	
	$('#nickNameCheck').on('click' ,function(){
		 
		alert("�� ����Ф�");
		
		 var query = {nickName : $("#nickName").val()};
		 
		 $.ajax({
		  url : "/user/nickNameCheck",
		  type : "post",
		  data : query,
		  success : function(data) {
		  
		   if(data == 1) {
		    $(".result .msg").text("��� �Ұ�");
		    $(".result .msg").attr("style", "color:#f00");    
		   } else {
		    $(".result .msg").text("��� ����");
		    $(".result .msg").attr("style", "color:#00f");
		   }
		  }
		 });  // ajax ��
		});

	
	function emailcheck(email1, email2){
	    // ��ȿ�� �˻�
		if(!insertform.email1.value || !insertform.email2.value){ 
			alert(emailerror);
			insertform.email1.focus();
			return;
		}else{
			if(insertform.email1.value){
				if(insertform.email2.value==0){
					// �����Է�
					if(insertform.email1.value.indexOf("@")==-1){
						alert(emailerror);
						insertform.email1.focus();
						return false;
					}
				}else{
					// �����Է�
					if(insertform.email1.value.indexOf("@")!=-1){
						alert(emailerror);
						insertform.email1.focus();
						return false;
					}
				}
			}
		} */
	/*     // ������ ���� ��â���� �̵�
		var url="email.jsp?email1="+email1+"&email2="+email2;
	    
		open(url,"emailwindow", "statusbar=no, scrollbar=no, menubar=no, 
                width=400, height=200" );


 */

/* 		function check() {
			var form = document.authenform;
			var authNum = ${authNum};
			
			if(!form.authnum.value){
				alert("������ȣ�� �Է�");
				return false;
			}
			if(form.authnum.value!=authNum){
				alert("Ʋ�Ⱦ� �ٽý�");
				form.authnum.value="";
				return false;
			}
			if(form.authnum.value==authNum){
				alert("����")
				opener.document.userinput.mailCheck.value="�Ϸ�";
				self.close();
			}
		} */
			
	

/* } */
	

		//==>"�̸���" ��ȿ��Check  Event ó�� �� ����
		 $(function() {
			 
			 $("input[name='email']").on("change" , function() {
				
				 var email=$("input[name='email']").val();
			    
				 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
			    	alert("�̸��� ������ �ƴմϴ�.");
			     }
			});
			 
		});	
		
		
	  
	
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
				   url: "/user/smsCheck",
			   data: { 
				   code: $("#sms").val() 
				   }, 
				   type: "post", 
			   success: function(result){ 
				   console.log(result);
				   
				   if (result == "true") { 
			   
				   alert("��ȣ ���� ����"); 
			   } else if (result == "false")
			  		 { 
				   alert("��ȣ ���� ����"); 
			  	 	} 
			 	  } 
			   })
		   })
		   });
		     </script>
		     
		     <script type="text/javascript">
		     
		     $(function(){
		         $("#alert-success").hide();
		         $("#alert-danger").hide();
		         $("input").keyup(function(){
		             var pwd1=$("#password").val();
		             var pwd2=$("#password2").val();
		             if(pwd1 != "" || pwd2 != ""){
		                 if(pwd1 == pwd2){
		                     $("#alert-success").show();
		                     $("#alert-danger").hide();
		                     $("#submit").removeAttr("disabled");
		                 }else{
		                     $("#alert-success").hide();
		                     $("#alert-danger").show();
		                     $("#submit").attr("disabled", "disabled");
		                 }    
		             }
		         });
		     });


		
		  
		     $(function() {
					
					$("button:contains('�� ��')").on("click" , function() {
						alert("����");
					 fncAddUser(); 
					 
					
					});
				});	 
			  /* $(function() {
					//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$("a:contains('�� ��')").on("click" , function() {
						
					});
				});	  */
			  
				 function fncAddUser() {
				
					var id=$("input[name='userId']").val();
					var id2=$("select[name='userId2']").val();
				/* 	var id3=$("option[id='ih']").val();
					var id4=$("option[id='ig']").val(); */
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
				
					
					$("input[name='userId']").val(id+id2);
				
			
					$("form").attr("method" , "POST").attr("action" , "/user/addUser").submit();
					
				}
		     
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
					 
					 $("input[name='email']").on("change" , function() {
						
						 var email=$("input[name='email']").val();
					    
						 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
					    	alert("�̸��� ������ �ƴմϴ�.");
					     }
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
															"<strong  class=\"text-danger\">��� �Ұ����մϴ�.</strong>");
													}
												if (inputed == "") {
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
		     

				
		     
				 
				 
				 
				 
				 
				 
		     </script>
		  <form class="form-horizontal">
		  
		 <!--  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">���̵�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" placeholder="���̵�">
		    </div>
		  </div> -->
		  
		   <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">���̵�</label>
		    <div class="col-sm-4">
		      <td>
	    <input type="text" name="userId" maxlength="15">@
		 <select name="userId2">
		      <option  id = "ig" value="@naver.com">naver.com</option>
		      <option  id = "ig" value="@daum.net">daum.net</option>
		      <option  id = "ig" value="@nate.com">nate.com</option>
		      <option id = "ig"  value="@gmail.com">gmail.com</option>
		      <option id = "ih" value="">�����Է�</option>
		  </select>
		<!-- <input type="button" name="emailconfirm_btn" value="����" 
         onclick="emailcheck(insertform.email1.value,insertform.email2.value)"> -->
	</td>
		    </div>
		  </div>
		  
		  	  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="��й�ȣ">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ Ȯ��</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="��й�ȣ Ȯ��">
		    </div>
		  </div>
		  
		  
		  
		  <div class="form-group">
		  <label for="password2" class="col-sm-offset-1 col-sm-3 control-label"></label>
		  <div class="col-sm-4" id="alert-success">��й�ȣ�� ��ġ�մϴ�.</div>
		  <span id = "alert-success"><Strong>��й�ȣ�� ��ġ�մϴ�.</Strong>
		      </span>
			<div class="col-sm-4" id="alert-danger">��й�ȣ�� ��ġ���� �ʽ��ϴ�.</div>
			<span id = "alert-danger"><Strong>��й�ȣ�� ��ġ���� �ʽ��ϴ�.</Strong>
		      </span>
		</div>

		    <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">�̸�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userName" name="userName" placeholder="ȸ���̸�">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="nickName" class="col-sm-offset-1 col-sm-3 control-label">�г���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="nickName" name="nickName" placeholder="�г���">
		      <span id = "check"><Strong>�г����� �Է����ּ���</Strong>
		      </span>
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
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�ּ�</label>
		    <div class="col-sm-4">
		    
		      <input type="text" class="form-control" id="address" name="address" >
		      <button type="button" class="btn btn-link">�ּ�ã��</button>
		    </div>
		      </div>
		      
		        <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">��ġ��������</label>
		    <div class="col-sm-4">
		     <input type="checkbox" id= "local" name="local" value="1" checked="checked"> ����
		     <input type="checkbox" id= "local" name="local" value="2"> ����
		    </div>
		  </div>
		  
		  <!-- 	  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">����ī�װ�</label>
		    <div class="col-sm-4">
		     <input type="checkbox" name="chbox" value="K-POP"> K-POP
			<input type="checkbox" name="chbox" value="rap"> ��/����
			<input type="checkbox" name="chbox" value="balad">�߶��<br><br>
		    </div>
		  </div> -->
 
		
	
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary">�� ��</button>
			  <a class="btn btn-primary btn" href="#" role="button">�� ��</a>
			 
			  
		    </div>
 			 </div>
		  
		  
		
		</form>
		
 	
	
</body>

</html>