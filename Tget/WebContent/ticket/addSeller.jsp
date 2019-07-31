<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script type="text/javascript">
	
	$(function(){
				
		$("#addSellerSubmit").on("click",function(){	
			var accountBank = $("#accountBank option:selected").val();
			var accountNo = $("input[name='accountNo']").val();
			if(accountBank == null || accountBank.length<1){
				alert("������ �������ּ���.");
				return;
			}
			if(accountNo == null || accountNo.length<1){
				alert("���¹�ȣ�� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			var form = $("form[name='addSeller']")[0];
	    	var formData = new FormData(form);
			$.ajax(
					{
						url : "/ticket/rest/addSeller/" ,
						processData: false,
	                    contentType: false,
						method : "POST" ,						
						data : formData ,
						success : function(data) {	
							alert(data);
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
										�Ǹ��� ���� ���
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
											<button class="button_black"  id="addSellerSubmit">���</button>
											<button class="button_black" data-dismiss="modal"  id="cancel">���</button>											
										</div>
									</form>
								</div>			      	      
					      </div>
					    </div>
	 </div>

