<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<title>T-GET</title>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/toolbar.css" />
	<link rel="stylesheet" href="/resources/css/login.css" />
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>	
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
   	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>   	
	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
	
   	<script src="/resources/javascript/common.js" ></script>
	<script src="/resources/javascript/alarm.js" ></script>
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/jquery.scrolly.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	
	<style>
       body{	
		      color: #FBFCFE ;		  
			  background-color: #062038;
			  margin-top: 50px;				
			  font-family: 'Nanum Gothic', sans-serif;
		}
		#tranInput{
			  border: 1px solid #D6CDB7;
			  background-color: #193147;
		}
		a, hr{
			color: #FBFCFE ;	
		}
		.col-lg-3{			
			margin-bottom: 20px;
		}
		
		section{
			margin-left: 40px;
		}
		#footer{
			background-color: #1B1B1F;
		}
       .list-group > .list-group-item{
			  margin-left:50px;	
			  color: #FBFCFE ;
			  border: 1px groove white;		  
			  background-color: #062038;
		}
    </style>
    
	<script type="text/javascript">	
		
		
	function fncAddTran(){
			
		
		$("form").attr("method" , "POST").attr("action" , "/tran/addTran").submit();
	}		
	
	function fncInputCheck(){
		
		var userPoint = $("#user-point").text().trim();
		var usePoint = numberWithOutCommas($("input[name='usePoint']").val());
		var totalPrice = numberWithOutCommas($("input[name='totalPrice']").val());
		
		$("input[name='totalPrice']").val(totalPrice);
		$("input[name='usePoint']").val(usePoint)
		
		var deliveryAddr = $("#deliveryAddr").val();
		var addrDetail = $("#addrDetail").val();
		var orderAmount = $("input[name='orderAmount']").val();
		
		if(orderAmount == null || orderAmount.length<1){
			alert("������ �ݵ�� �Է��Ͽ��� �մϴ�.");
			return "noGood";
		}
		if(addrDetail == null || addrDetail.length<1){
			alert("���ּҴ� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return "noGood";
		}
		if(deliveryAddr == null || deliveryAddr.length<1){
			alert("�ּҴ� �ݵ�� �Է��ϼž� �մϴ�.");
			return "noGood";
		}			
		if(isNaN(totalPrice)==true) {
			alert("����Ʈ�� �����Է� �ٶ��ϴ�.");
			return "noGood";
		}
		if(parseInt(userPoint) < parseInt(usePoint)){			
			alert("���� ����Ʈ ����");
			return "noGood";
		}
		
		return "good";
	}
	
	$(function(){
	    	    
		$("a[href='#']:contains('��&nbsp;��')").on("click",function(){	    	
	    	self.location = "/";	    	
	    });
		
		$("a:contains('īī������')").on("click",function(){
			
			$("input[name='paymentOption']").val('1');
			$("input[name='tranCode']").val('1');
			
			var totalPrice = numberWithOutCommas($("input[name='totalPrice']").val());
			if(totalPrice>1000000){
				  alert("īī�����̴� 100�������� �����մϴ�.");
				  return;
			  }
				$.ajax({
					url : "/tran/rest/Kakaopay/${ticket.ticketNo}/"+totalPrice ,
					method : "GET" ,
					dataType : "json" ,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
	              	success: function(data){
	              	  $("input[name='paymentNo']").val(data.tid);
	              	  var url= data.next_redirect_pc_url;
	              	  var popOption = "width=450px, height=450px, resizable=no, location=no, top=300px, left=300px;"	                    
	                  window.open(url,"T-get īī������ ",popOption);
	              	       	  
	              	  
	              	},
	             	 error: function(){              	
	                  alert('error');                   
	              	}              
	          	});
	    });
		
		IMP.init('imp22741487');
		
		$("a:contains('�ſ�ī��')").on("click",function(){
			var totalPrice = $("input[name='totalPrice']").val();
			var result = numberWithOutCommas(totalPrice);
			$("input[name='paymentOption']").val('0');
			$("input[name='tranCode']").val('1');
			
			IMP.request_pay({
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '${ticket.event.eventName}',
			    amount : result,
			    buyer_email : '${user.userId}',
			    buyer_name : '${user.userName}',
			    buyer_tel : '${user.phone}',
			    buyer_addr : '${user.address}',
			    buyer_postcode : '${user.postalCode}'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '������ �Ϸ�Ǿ����ϴ�.';	
			        $("input[name='paymentNo']").val(rsp.imp_uid);			        
			        var tmp = 0;
			    } else {
			        var msg = '������ �����Ͽ����ϴ�.';			        
			        msg += '�������� : ' + rsp.error_msg;
			        var tmp = 1;
			    }
			
			    alert(msg);
			    if(tmp==0){
			    	fncAddTran();
			    }
			});
			
		
	    });
		
		$("a:contains('�������Ա�')").on("click",function(){
			
			$("input[name='paymentOption']").val('2');
			$("input[name='tranCode']").val('0');
			
			fncAddTran();
	    });
	    
	});
	
	$(function(){
		
		$("button:contains('�� ��')").on('click',function(){			
			var result = fncInputCheck();
			if(result=='noGood'){
				location.reload();
			}
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
	    	
			$("#deliveryAddr").val('${user.address}');
	 	
	 	});
		
		$("button:contains('���� ���')").on("click",function(){
	    	
			var allPoint = numberWithCommas(${user.point});
			
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
	
	<jsp:include page="/layout/tgetToolbar.jsp" />
	<jsp:include page="/layout/tgetHeader.jsp" />
		<br/>
		<div class="row">
			<div class="col-lg-2">
				<div class="sticky-top">
		      	<div class='text-center'>
		      		<br/><br/><br/>
					<p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ƽ�� > Ƽ�� ���� </strong></p>
					<br/>
												<ul class="list-group list-group-flush">										  
												  <li class="list-group-item"><a href="#">������ ���̵�</a></li>
												  <li class="list-group-item"><a href="#">�� �ŷ�����</a></li>
												  <li></li>											  
												</ul> 											  
				</div> 
				</div>
			</div>
			
			<div id="tranInput" class="col-lg-8">				
			<form>
			<div id="thisTitle" class="text-center">
			  <h1 class="display-4">${ticket.event.eventName}</h1>
			  <p class="lead">${ticket.event.eventDate}</p>
			  <p>${ticket.event.eventLocation}</p>
			</div>
			 <hr class="my-4">
			<input type="hidden" name="ticket.ticketNo" value="${ticket.ticketNo}">
			<input type="hidden" name="seller.userId" value="${ticket.seller.userId}">
			<input type="hidden" name="buyer.userId" value="${user.userId}">
			<input type="hidden" name="event.eventId" value="${ticket.event.eventId}">
			<input type="hidden" name="event.eventName" value="${ticket.event.eventName}">
			<input type="hidden" name="paymentOption" value="">
			<input type="hidden" name="paymentNo" value="">
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
			        <input type="text" id="point" name="usePoint" value="0" style="width: 150px !important"/>&nbsp;&nbsp;���� : <span class="text-danger" id="user-point">${user.point}</span><br/>
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
			<div class="col-lg-2"></div>
		</div>		
 	
	<div class="modal fade" id="payModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered" role="document">
					    <div class="modal-content">
					      <div class="modal-body">
					      <div class="text-center">
					      <div class="text-center">
					        <h5>���� ���� ����</h5>					        
					      </div>
					      <hr/>
					      <a class="btn btn-outline-info" role="button">īī������</a>
					      <a class="btn btn-outline-info" role="button">�ſ�ī��</a>
					      <a class="btn btn-outline-info" role="button">�������Ա�</a>
					      <br/><br/>
					      </div>
					      </div>
					    </div>
					  </div>
	</div>
<jsp:include page="/layout/footer.jsp" />	
</body>

</html>