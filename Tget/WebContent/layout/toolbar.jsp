<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
	<script src="/resources/javascript/common.js" ></script>
	<script src="/resources/javascript/alarm.js" ></script>
	<style>
	 
	</style>
   	
   	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		$( function(){

// 			$("a:contains('�̺�Ʈ�˻�')").on("click",function(){
// 				self.location = "/event/test";
// 			});
			
			$("a.navbar-brand").on("click",function(){
				self.location = "/";
			});
			
			$("a:contains('Ƽ���Ǹ�')").on("click",function(){
				self.location = "/ticket/addTicketInfo?eventId=104175822";
			});
			
			$("a:contains('Ƽ�ϱ���')").on("click",function(){
				self.location = "/tran/addTran?ticketNo=10004";
			});
			
			$("a:contains('getTicket')").on("click",function(){
				self.location = "/ticket/getTicket?ticketNo=10004";
			});
			
			$("a:contains('�� Ƽ�ϸ��')").on("click",function(){
				self.location = "/ticket/getTicketList?menu=seller";
			});
			$("a:contains('���� Ƽ�ϸ��')").on("click",function(){
				self.location = "/ticket/getTicketList?menu=check";
			});
			$("a:contains('�� �ŷ�����')").on("click",function(){
				self.location = "/tran/getTranList?menu=user";
			});
		
			
			
		});
		
		$( function() {
			//==> �߰��Ⱥκ� : "addUser"  Event ����
			$("a[href='#' ]:contains('ȸ������')").on("click" , function() {
				self.location = "/Tget/user/addUser"
			});
		});
		
		//============= �α��� ȭ���̵� =============
		$( function() {
			//==> �߰��Ⱥκ� : "addUser"  Event ����
			$("a[href='#' ]:contains('�� �� ��')").on("click" , function() {
				self.location = "/Tget/user/login"
			});
		});
		
		$( function() {
			//==> �߰��Ⱥκ� : "addUser"  Event ����
			$("a[href='#' ]:contains('������Ʈ����')").on("click" , function() {
				self.location = "/Tget/user/listUser"
			});
		});
		
		$( function(){
			
			$("a:contains('���� �Խ���')").on("click", function(){
				self.location="/community/getContentList"
			});
		});
		
		$( function(){			
			//onload�� �������� �˶� ǥ�� 
			getNoReadAlarmCount(); 
			
			//�˶�����Ʈ madal ���
			$("button:contains('Alarm')").on("click", function(){
				getAlarmModal();				
			});
		});
		

		
	</script>	
	
</head>

<body>



 
<nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-dark ">
 	
<div class="container">	
				<a class="navbar-brand" >
				<button type="button" class="btn btn-dark">
							 <i class="fas fa-running"></i> T-GET</span>
				</button>
				</a>
 	<!-- <a class="navbar-brand" ><i class="fas fa-running"></i> T-GET</a>	 -->		
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    	<span class="navbar-toggler-icon"></span>
  	</button>	
			
	<div class="collapse navbar-collapse" id="navbarNavDropdown">
				 
				 
				 
				 <ul class="nav navbar-nav">           	
	            	
	            	
<!-- 	            	<li class="nav-item active"> -->
<!-- 			              <a class="nav-link" href="#">�̺�Ʈ�˻�</a> -->
<!-- 			        </li>  -->
			        
			        <li class="nav-item dropdown">
				        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				          	User
				        </a>
				        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
				          <a class="dropdown-item" href="#">�� �� ��</a>
				          <a class="dropdown-item" href="#">ȸ������</a>
				          <a class="dropdown-item" href="#">������Ʈ����</a>
				        </div>
				    </li>
	            	
	            	<li class="nav-item dropdown">
				        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				          	Ticket
				        </a>
				        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
				          <a class="dropdown-item" href="#">getTicket</a>
				          <a class="dropdown-item" href="#">Ƽ���Ǹ�</a>
				          <a class="dropdown-item" href="#">Ƽ�ϱ���</a>
				          <a class="dropdown-item" href="#">�� Ƽ�ϸ��</a>
				          <a class="dropdown-item" href="#">���� Ƽ�ϸ��</a>
				          <a class="dropdown-item" href="#">�� �ŷ�����</a>
				        </div>
				    </li>
	            	
	            	<li class="nav-item dropdown">
				        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				          	Community
				        </a>
				        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
				          <a class="dropdown-item" href="#">���� �Խ���</a>
				          <a class="dropdown-item" href="#">���� �Խ���</a>
				        </div>
				    </li>  
				    
				    
				    <li class="nav-item active">
						    <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#alarmModal">
							 Alarm <span class="badge badge-light" id="noReadAlarmCount"></span>
							</button> 		            	
	            	</li>   
	          </ul>
	 </div>
	 </div>
 		
 			
</nav>
			<!-- �˸����� ���â  -->
					<div class="modal fade" id="alarmModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-md" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="modalCenterTitle">My Alarm</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					        <button type="button" class="btn btn-primary">Save changes</button>
					      </div>
					    </div>
					  </div>
					</div>
	  	
</body>

</html>