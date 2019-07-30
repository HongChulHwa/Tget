 <%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
$( function(){	
	$("#brand").on("click",function(){
		self.location = "/";
	});
	$("a[href='#' ]:contains('Home')").on("click" , function() {
		self.location = "/"
	});
	$("a[href='#' ]:contains('Sign Up')").on("click" , function() {
		self.location = "/user/addUser"
	});
	/* $("a[href='#' ]:contains('Login')").on("click" , function() {
		self.location = "/user/login"
	}); */
	$("a[href='#' ]:contains('Logout')").on("click" , function() {
		self.location = "/user/logout"
	});
	
});
$( function(){
	
	$("a:contains('������������')").on("click",function(){
		self.location = "/event/getEventManage";
	});
	$("a:contains('����������')").on("click",function(){	
		alert("${user.userId}");
		self.location = "/user/myPage?userId=${user.userId}";
	});
	
	$("a:contains('�����̺�Ʈ')").on("click",function(){		
		self.location = "/event/getInterestedEventList";
	});
});
$( function(){
	$("a:contains('�� �ǸŸ��')").on("click",function(){		
		self.location = "/ticket/getTicketList?menu=seller";
	});
	$("a:contains('Ƽ�ϰ���')").on("click",function(){		
		self.location = "/tran/getTranList?menu=check";
	});
	$("a:contains('�� �ŷ�����')").on("click",function(){		
		self.location = "/tran/getTranList?menu=user";
	});
});	
$( function(){	
	$("a:contains('�����ۼ�')").on("click",function(){
		popWin = window.open("/rnp/addReview?tranNo=10002","popWin",
				"left=500, top=100, width=600, height=500, "
				+"marginwidth=0, marginheight=0, scrollbars, scrolling, menubar=no, resizable");
		
//			self.location = "/rnp/addReview?tranNo=10000";
	});
	$("a:contains('��������ȸ')").on("click",function(){
		self.location = "/rnp/getReviewList";
	});
	$("a:contains('��������ȸ')").on("click",function(){
		self.location = "/rnp/getSellerEstimationList?sellerId=${user.userId}";
	});
	$("a:contains('����Ʈ������ȸ')").on("click",function(){
		self.location = "/rnp/getPointHistory";
	});
	
	$("a[href='#' ]:contains('��������ȸ')").on("click" , function() {		
		self.location = "/coupon/getCouponList?userId=${sessionScope.user.userId}";
	});
	$("a[href='#' ]:contains('Logout')").on("click" , function() {
		self.location = "/user/logout"
	});
});
$( function(){				
	
	if('${user}'!=''){
		getNoReadAlarmCount("${user.userId}"); 
	}			
	//�˶�����Ʈ madal ���
	$("a:contains('Alarm')").on("click", function(){
		getAlarmModal("${user.userId}");				
	});	
});

$(function() {
	
	$( "a[href='#']:contains('Ƽ�ϰŷ� ����')" ).on("click" , function() {
		
		self.location="/community/getContentList?searchCondition=2&searchKeyword=0";	
	
	});
	
	$( "a[href='#']:contains('�����Խ��� �̿����')" ).on("click" , function() {
		self.location="/community/getContentList?searchCondition=2&searchKeyword=1";	
	
	});
 
	 $( "a[href='#']:contains('���ֹ�������')" ).on("click" , function() {
			self.location="/community/getContentList?searchCondition=2&searchKeyword=2";	
		
		});
	 
	 $( "a[href='#']:contains('��ϴ�')" ).on("click" , function() {
			self.location="/community/getContentList?searchCondition=2&searchKeyword=3";	
		
		});
	 
	 $( "a[href='#']:contains('�˴ϴ�')" ).on("click" , function() {
			self.location="/community/getContentList?searchCondition=2&searchKeyword=4";	
		
		});
	 
	 $( "a[href='#']:contains('���ٹ�')" ).on("click" , function() {
			self.location="/community/getContentList?searchCondition=2&searchKeyword=5";	
		
		});
	 $( "a[href='#']:contains('ȯ�ҰԽ���')" ).on("click" , function() {
			self.location="/community/getRefundList";	
		
		});
});
</script>

		<!-- Header -->
			<header id="header">
				<h1><a id="brand" href="#">T-GET <span>by MFC</span></a></h1>
				
				
					<a href="#">Home</a>
				<c:if test="${empty user}">
					<a href="#">Sign Up</a>
					<a href="#" data-toggle="modal" data-target="#my80sizeCenterModal" >Login</a>
				</c:if>
				<c:if test="${!empty user}">
					<a href="#">Logout</a>
					<a href="#" data-target="#alarmModal" data-toggle="modal">
							<i class="far fa-bell"></i> Alarm &nbsp;<span class="badge badge-info" id="noReadAlarmCount"></span>
					</a>
				</c:if>				
				<a href="#menu">Menu</a>
									  
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li>
					      <div class="text-center"><strong><i class="fas fa-user-circle"></i>&nbsp;User</strong></div>
				          <a href="#">����������</a>
				          <a href="#">�����̺�Ʈ</a>
				          <a href="#">ȸ������</a>
				    </li>     																				
					
				</ul>
				<ul class="links">
					<li>
					      <div class="text-center"><strong><i class="fas fa-user-circle"></i>&nbsp;Event</strong></div>
				           <c:if test="${user.role == 2 }"><a href="#">������������</a></c:if>		
				          <c:if test="${!empty user }"><a href="#">�����̺�Ʈ</a></c:if>		 
				    </li>     																				
					
				</ul>
				<ul class="links">
					<li>
						 <div class="text-center"><strong><i class="fas fa-user-circle"></i>&nbsp;Ticket</strong></div>
				          <a href="#">�� �ǸŸ��</a>
				          <a href="#">�� �ŷ�����</a>
				          <a href="#">Ƽ�ϰ���</a>
					</li> 
				 </ul>
				 <ul class="links">
					<li>
						 <div class="text-center"><strong><i class="fas fa-user-circle"></i>&nbsp;RnP</strong></div>
				          <a href="#">�����ۼ�</a>
				          <a href="#">��������ȸ</a>
				          <a href="#">��������ȸ</a>
				          <a href="#">����Ʈ������ȸ</a>
					</li> 
				 </ul>
				 <ul class="links">
					<li>
						 <div class="text-center"><strong><i class="fas fa-user-circle"></i>&nbsp;Coupon</strong></div>
				          <a href="#">�������</a>
				          <a href="#">��������ȸ</a>
					</li> 
				 </ul>
			</nav>

<!-- �˸����� ���â  -->
					<div class="modal fade" id="alarmModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h3 class="modal-title" id="modalCenterTitle"><span class="text-secondary"><i class="far fa-bell"></i> My Alarm </span></h3>
					        <a href="#" class="close" data-dismiss="modal">
					          &times;
					        </a>
					      </div>
					      <div id="alarmModalBody" class="modal-body">
					      </div>
					      <div class="modal-footer">
					        </div>
					    </div>
					  </div>
					</div>


		
		