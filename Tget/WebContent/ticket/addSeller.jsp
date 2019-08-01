<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script type="text/javascript">
	
	$(function(){
				
		$("#addSellerSubmit").on("click",function(){	
			var userAccountBank = $("#accountBank option:selected").val();
			var userAccountNo = $("input[name='accountNo']").val();
			if(userAccountBank == null || userAccountBank.length<1){
				alert("������ �������ּ���.");
				return;
			}
			if(userAccountNo == null || userAccountNo.length<11 || isNaN(userAccountNo)==true){
				alert("���¹�ȣ�� 10�� �̻� ���ڸ� �Է��ϼž� �մϴ�.");
				return;
			}
	    	$.ajax(
					{
						url : "/ticket/rest/addSeller/" ,
						method : "POST" ,
						data : JSON.stringify({
							userId : "${user.userId}",
							accountBank : userAccountBank,
							accountNo : userAccountNo
						}) ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(data) {	
							alert("��ϼ���!");
							history.go(0);
						}							 
			});
			
		});
	});
	</script>


	<div class="modal fade" id="addSellerModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered" role="document">
					    <div class="modal-content">
					       <div class="modal-body">
					      		
									<div align="center"><h3 style="font-weight: bold;">
										�Ǹ��� ���� �Է�
									</h3></div>
									<form name="addSeller">	
									<input type="hidden" name="userId" id="userId" value="${user.userId}">
										 <div>
								    		ID&nbsp; : &nbsp;${user.userId}    			
								 		 </div>
								 		 <br/>
								 		 <div>
								 		 ����&nbsp; : &nbsp;&nbsp;&nbsp; 
								 		 	<select id="accountBank" name="accountBank" >
								 		 		<option value="">����</option>
								 		 		<option value="039">�泲���� </option>
								 		 		<option value="004">�������� </option>
								 		 		<option value="034">�������� </option>
								 		 		<option value="003">������� </option>
								 		 		<option value="031">�뱸���� </option>
								 		 		<option value="045">�������ݰ� </option>
								 		 		<option value="088">�������� </option>
								 		 		<option value="048">�������� </option>
								 		 		<option value="027">��Ƽ���� </option>
								 		 		<option value="020">�츮���� </option>
								 		 		<option value="071">��ü��</option>
								 		 		<option value="005">��ȯ���� </option>
								 		 		<option value="081">�ϳ����� </option>
								 		 	</select>
										 </div>
										 <br/>
										 <div>
										 	���� ��ȣ&nbsp; : &nbsp;<input type="text" name="accountNo" value="" placeholder="(-) ���� �Է�" style="width: 300px !important"> 
										 </div>
										 <br/>
										 <div class="text-danger">
										 <small>*�ش� ������ Ƽ�� �Ǹ� �� �ǸŴ�� �Ա� �� Ȱ���ϴ� �����̸�<br/>
										 		�ٸ� �������δ� ������ �ʽ��ϴ�.
										  </small>
										 
										 </div>
										 <br/>
										<div align="center">
											<a class="btn btn-outline-light btn" href="#" role="button" id="addSellerSubmit">���</a>
											<a class="btn btn-outline-light btn" href="#" role="button" id="addSellerCancle" data-dismiss="modal">���</a>						
										</div>
									</form>
								</div>			      	      
					      </div>
					    </div>
	 </div>

