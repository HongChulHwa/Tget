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
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
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
				alert("����");
			
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
	
	
	
	
	
	
	
	
	
		//============= "����"  Event ���� =============
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$("button:contains('����')").on("click" , function() {
						alert("����");
				fncUpdateUser();
			});
		});	
		
		
		//============= "���"  Event ó�� ��  ���� =============
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$("button:contains('���')").on("click" , function() {
						alert("����");
				$("form")[0].reset();
			});
		});	
		

		///////////////////////////////////////////////////////////////////////
		function fncUpdateUser() {
			var name=$("input[name='userName']").val();
			
			if(name == null || name.length <1){
				alert("�̸���  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
				
			$("form").attr("method" , "POST").attr("action" , "/user/updateUser").submit();
		}
	
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">ȸ����������</h3>
	       
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">�� �� ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" value="${user.userId }" placeholder="�ߺ�Ȯ���ϼ���"  readonly>
		       <span id="helpBlock" class="help-block">	      	
		      </span>
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="�����й�ȣ">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ Ȯ��</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="�����й�ȣ Ȯ��">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">�̸�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userName" name="userName" value="${user.userName}" placeholder="����ȸ���̸�">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="nickName" class="col-sm-offset-1 col-sm-3 control-label">�г���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="nickName" name="nickName" value="${user.nickName}"placeholder="�г���">
		      <span id = "check"><Strong>�г����� �Է����ּ���</Strong>
		      </span>
		    </div>
		  </div>
		  
	
		  
		
		  
		  <div class="form-group">
		    <label for="phone" class="col-sm-offset-1 col-sm-3 control-label">�޴���ȭ</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="phone" name="phone" placeholder="'-' ���� �Է����ּ���." value="${user.phone}"><button type="button" class="btn btn-primary">����</button>
		       
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="sms" class="col-sm-offset-1 col-sm-3 control-label">������ȣ</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="sms" name="sms" placeholder="������ȣ">
		      <button type="button" class="btn btn-primary">����</button>
		      <span id = "check2"><Strong>������ȣ�� �Է����ּ���</Strong></span>
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�ּ�</label>
		    <div class="col-sm-4">
		    
		      <input type="text" class="form-control" id="address" name="address" value="${user.address}" >
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
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >����</button>
			  <a class="btn btn-primary btn" href="#" role="button">���</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
 	
</body>

</html>