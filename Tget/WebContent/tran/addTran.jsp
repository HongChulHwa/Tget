<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="/resources/javascript/common.js" ></script>
   	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">	
		
		
	function fncAddTran(){
				
		var totalPrice = numberWithOutCommas($("input[name='totalPrice']").val());
		$("input[name='totalPrice']").val(totalPrice);
		
		var deliveryAddr = $("#deliveryAddr").val();
		var addrDetail = $("#addrDetail").val();
		var orderAmount = $("input[name='orderAmount']").val();
		
		if(orderAmount == null || orderAmount.length<1){
			alert("������ �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if(addrDetail == null || addrDetail.length<1){
			alert("���ּҴ� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if(deliveryAddr == null || deliveryAddr.length<1){
			alert("�ּҴ� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}			
		if(isNaN(totalPrice)==true) {
			alert("����Ʈ�� �����Է� �ٶ��ϴ�.");
			return;
		}
		$("form").attr("method" , "POST").attr("action" , "/tran/addTran").submit();
	}		
	
	$(function(){
	    	    
		$("a[href='#']:contains('��&nbsp;��')").on("click",function(){	    	
	    	self.location = "/";	    	
	    });
		
		$("a:contains('īī������')").on("click",function(){
			
			$("input[name='paymentOption']").val('1');
			$("input[name='tranCode']").val('1');
			
			fncAddTran();
	    });
		
		$("a:contains('�ſ�ī��')").on("click",function(){
			
			$("input[name='paymentOption']").val('0');
			$("input[name='tranCode']").val('1');
			
			fncAddTran();
	    });
		
		$("a:contains('�������Ա�')").on("click",function(){
			
			$("input[name='paymentOption']").val('2');
			$("input[name='tranCode']").val('0');
			
			fncAddTran();
	    });
	    
	});
	
	$(function(){
		
		var ticketPrice = numberWithCommas(${ticket.price});		
	    $("#ticketPrice").text(ticketPrice);
		
	    $(".btn-outline-success").on("click",function(){	    		    	
	    	var orderAmount = $(this).text().trim();
	    	var totalPrice = numberWithCommas(orderAmount*${ticket.price});
	    	$("input[name='orderAmount']").val(orderAmount);
	    	$("input[name='totalPrice']").val(totalPrice);
	    	$("#orTotalPrice").text(totalPrice);	    	
	    });
		
	    $("button:contains('�ű� �����')").on("click",function(){
	    	
	    	new daum.Postcode({
	            oncomplete: function(data) {
	                var addr = '';

	                if (data.userSelectedType === 'R') {
	                    addr = data.roadAddress;
	                } else { 
	                    addr = data.jibunAddress;
	                }				
	               
	                $("#deliveryAddr").val(addr);
	            }
	        }).open();
	 	
	 	});
	    
		$("button:contains('���� �����')").on("click",function(){
	    	
			$("#deliveryAddr").val('session.user.addr');
	 	
	 	});
		
		$("button:contains('���� ���')").on("click",function(){
	    	
			//var allPoint = numberWithCommas(${user.point});
			var allPoint = numberWithCommas(1000000);
			
			$("#point").val(allPoint);
			
			var tmp = numberWithOutCommas($("#point").val());
			var totalPrice = numberWithOutCommas($("#orTotalPrice").text().trim());
			
			if(parseInt(tmp)>parseInt(totalPrice)){
				tmp = totalPrice;
			}
			
			$("input[name='totalPrice']").val(numberWithCommas(totalPrice-tmp));
			$("#point").val(numberWithCommas(tmp));
	 	
	 	});
		
		$("#point").on("keyup",function(){
			
			var tmp = numberWithOutCommas($("#point").val());			
			var totalPrice = numberWithOutCommas($("#orTotalPrice").text().trim());
			
			if(parseInt(tmp)>parseInt(totalPrice)){
				tmp = totalPrice;
			}
			
			$("input[name='totalPrice']").val(numberWithCommas(totalPrice-tmp));
			$("#point").val(numberWithCommas(tmp));
			
		});
	
	});
	</script>		
    
</head>

<body>
	<jsp:include page="/layout/toolbar.jsp" />
	<div class="container">
	<br/>
		
		<div class="text-center">
		  <h1 class="display-4">${ticket.event.eventName}</h1>
		  <p class="lead">${ticket.event.eventDate}</p>
		  <p>${ticket.event.eventLocation}</p>
		</div>
		 <hr class="my-4">
		<form>
		<input type="hidden" name="ticket.ticketNo" value="${ticket.ticketNo}">
		<input type="hidden" name="seller.userId" value="${ticket.seller.userId}">
		<%-- <input type="hidden" name="buyer.userId" value="${user.userId}"> --%>
		<input type="hidden" name="buyer.userId" value="buyer">
		<input type="hidden" name="event.eventId" value="${ticket.event.eventId}">
		<input type="hidden" name="event.eventName" value="${ticket.event.eventName}">
		<input type="hidden" name="paymentOption" value="">
		<input type="hidden" name="tranCode" value="">
		<div class="text-center">
			<h5><strong>Ƽ�� ������ �������ּ���.</strong></h5>
			<small class="text-danger">�ִ� 10����� ���Ű����մϴ�.<br/></small>
			<br/>			
			<div class="btn-group mr-2" role="group" aria-label="First group">
			  <c:forEach var="i" begin="1" end="${ticket.amount}">
			  	<c:if test="${i < 11}"> 
			    <button type="button" class="btn btn-outline-success">${i}</button>
			  	</c:if>
			  </c:forEach>
			</div>
			<br/>  			    
		     <div class="form-group" >
		     <br/>
		     <strong>���� ���� : </strong> 	
		        <span id="ticketPrice"></span> X <input type="text" name="orderAmount" value="" style="width: 50px !important" maxlength="10" readonly/> = 
		        <span id="orTotalPrice">0</span>
		    </div>
		   
		<br/>  
		<div>
		<h5><strong>������� �Է����ּ���.</strong></h5>
		<button type="button" class="btn btn-link"><small class="text-secondary">�ű� �����</small></button><button type="button" class="btn btn-link"><small>���� �����</small></button>
		<div class="form-group" >
		     <br/>
		     <strong>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�� : </strong> 	
		        <input type="text" id="deliveryAddr" name="deliveryAddr" value="" style="width: 300px !important" readonly/><br/><br/>
		      <strong>���ּ� : </strong><input type="text" id="addrDetail" name="deliveryAddr" value="" style="width: 300px !important"/>
		</div>
		</div>
		
		<br/>  
		<div>
		<h5><strong>��� ����Ʈ�� �Է����ּ���.</strong></h5>
		
		<div class="form-group" >
		     <br/>
		     <strong>�������Ʈ : </strong> 	
		        <input type="text" id="point" value="0" style="width: 150px !important"/>
		        <button type="button" class="btn btn-link"><small>���� ���</small></button>
		</div>
		<div class="form-group" >
		     <br/>
		     <strong>����  �ݾ� : </strong> 	
		        <input type="text" id="totalPrice" name="totalPrice" value="" style="width: 150px !important" readonly/>
		</div>
		
		</div>
		
		
		
		<br/>
		<div class="form-group">
		      <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#payModal">�� ��</button>
			  <a class="btn btn-danger btn" href="#" role="button">��&nbsp;��</a>
		</div>
		</div>
		</form>				
 	</div>
 	
	<div class="modal fade" id="payModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-lg" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="modalCenterTitle">���� ���� ����</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					      <div class="text-center">
					      <a class="btn btn-outline-info" role="button">īī������</a>
					      <a class="btn btn-outline-info" role="button">�ſ�ī��</a>
					      <a class="btn btn-outline-info" role="button">�������Ա�</a>
					      </div>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					      </div>
					    </div>
					  </div>
	</div>
	
</body>

</html>