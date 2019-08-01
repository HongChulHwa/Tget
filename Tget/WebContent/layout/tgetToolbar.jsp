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
	
	$("a:contains('�̺�Ʈ����')").on("click",function(){
		self.location = "/event/getEventManage";
	});
	$("a:contains('�� ���� ����')").on("click",function(){	
	
		self.location = "/user/myPage?userId=${user.userId}";
	});
	
	$("a:contains('���� �̺�Ʈ')").on("click",function(){		
		self.location = "/event/getInterestedEventList";
	});
});
$( function(){
	$("a:contains('�ǸŸ�� ��ȸ')").on("click",function(){		
		self.location = "/ticket/getTicketList?menu=seller";
	});
	$("a:contains('Ƽ�ϰ���')").on("click",function(){		
		self.location = "/tran/getTranList?menu=check";
	});
	$("a:contains('ȸ������')").on("click",function(){		
		self.location = "/user/listUser";
	});
	$("a:contains('�Ű���Ʈ����')").on("click",function(){		
		self.location = "/community/getReportList";
	});
	$("a:contains('�ŷ����� ��ȸ')").on("click",function(){		
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
	$("a:contains('�� ���� ��ȸ')").on("click",function(){
		self.location = "/rnp/getReviewList";
	});
	$("a:contains('�� ���� ��ȸ')").on("click",function(){
		self.location = "/rnp/getSellerEstimationList?sellerId=${user.userId}";
	});
	$("a:contains('����Ʈ ���� ��ȸ')").on("click",function(){
		self.location = "/rnp/getPointHistory";
	});
	
	$("a[href='#' ]:contains('�� ���� ��ȸ')").on("click" , function() {		
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
			self.location="/community/getContentList?searchCondition=3";
		
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
<style>
	/*Modal*/
		
		.modal-wrap{
			width:100%;
			margin:auto;
			max-width:525px;
 			position:relative; 
			background-color: black;
			background:url(/resources/images/logins.jpg) no-repeat center;
			box-shadow:0 12px 15px 0 rgba(0,0,0,.24),0 17px 50px 0 rgba(0,0,0,.19);
			overflow:auto;
		}
		.modal-html{
			background:rgba(40,57,101,.9);			
		}
		.close{
			color: white;
		}
</style>

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
				<c:if test="${user.role == 2 }">
				<a href="#" id="getCouponUserList" data-target="#addCouponModal" data-toggle="modal"> Coupon &nbsp;<i class="fas fa-plus"></i></a>
				</c:if>
				<c:if test="${!empty user}">			
				<a href="#menu">Menu</a>
				</c:if>					  
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li class="text-center">
					<br/>
					      <div class="text-center"><strong>My Menu</strong></div>
					<br/>  
				          <a href="#">�� ���� ����</a>
				          <a href="#">���� �̺�Ʈ</a>				          
				          <a href="#">�ǸŸ�� ��ȸ</a>
				          <a href="#">�ŷ����� ��ȸ</a>
				          <a href="#">�� ���� ��ȸ</a>
				          <a href="#">�� ���� ��ȸ</a>
				          <a href="#">�� ���� ��ȸ</a>
				          <a href="#">����Ʈ ���� ��ȸ</a>
				    </li>     																				
					
				</ul>
				
				<c:if test="${user.role == 2 }">
				<ul class="links">
					<li class="text-center">
						 <div class="text-center"><strong>Admin Menu</strong></div>
						 <br/>
				          <a href="#">ȸ������</a>				          
				          <a href="#">Ƽ�ϰ���</a>
				          <a href="#">�̺�Ʈ����</a>
				          <a href="#">�Ű���Ʈ����</a>
					</li> 
				 </ul>
				 </c:if>
			</nav>

<!-- �˸����� ���â  -->
					<div class="modal fade" id="alarmModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered" role="document">
					    <div class="modal-content">
					    <div class="modal-wrap">
     					 <div class="modal-html">
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
					  </div>
					</div>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>



<script type="text/javascript">

	$( function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[href='#forgotId' ]").on("click" , function() {
		
			var popOption = "left=500, top=100, width=600, height=600, resizable=no, location=no;"		
				window.open("/user/finduserId","find userId",popOption);
		});
	});
	
	$( function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[href='#forgotPassword' ]").on("click" , function() {
		
			var popOption = "left=500, top=100, width=700, height=700, resizable=no, location=no;"		
				window.open("/user/findPassword","find password",popOption);
		});
	});
	
	$( function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[href='#signUp' ]").on("click" , function() {
		
			self.location = "/user/addUser"
		});
	});
	
	$( function() {
		
		 $("input[name='password']").on("keypress",function(){
				if (event.keyCode ==13) {
					$("input[id='signin']").click();
// 					$("form[name='user-login']").attr("method","POST").attr("action","/user/login").submit();
				}
			});
		
		
		$("#userId").focus();
		
		$("input[id='signin']").on("click" , function() {
			
			//alert("������");
			
			var id=$("input[name='userId']").val();
			var pw=$("input[name='password']").val();
			
			
			
			if(id == null || id.length <1) {
				alert('ID �� �Է����� �����̽��ϴ�.');
				$("#userId").focus();
				return;
			}
			
			if(pw == null || pw.length <1) {
				alert('�н����带 �Է����� �����̽��ϴ�.');
				$("#password").focus();
				return;
			}
			
			 $.ajax({ 
				   url: "/user/json/login",
			   data: { 
				   userId: $("#userId").val(), 
				   }, 
				   type: "post", 
				   dataType: "json",
			   success: function(JSONData){ 
				   console.log(JSONData);
				   
				   if (JSONData.msg == "no") {
						  alert("ID/password error");
						  return;
			  		 }else if (JSONData.msg == "true") { 
			  			
			  			swal({
			  	          title: JSONData.nickName,
			  	          text: "������Ʈ ��������"+JSONData.startDate+"\n"+"\n"+
			  	        "������Ʈ ��������"+JSONData.endDate,
			  	          icon: "error",
			  	          buttons: true,
			  	          dangerMode: true,
			  	        })
			  	
				   } else if (JSONData.msg == "false")
				  		 { 
					   		$("form[name='user-login']").attr("method","POST").attr("action","/user/login").submit();
				  	 	
				  		 }
				   
		
			   }
				   });
	});	
		
		
		
		});
	
	$( function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[id='kakao' ]").on("click" , function() {
				
				var popOption = "left=500, top=100, width=600, height=600, resizable=no, location=no;"		
				window.open("https://kauth.kakao.com/oauth/authorize?client_id=ea9f389c17a2bd4b4fd122a0c9184bc2&redirect_uri=http://127.0.0.1:8080/user/oauth&response_type=code","Kakao login",popOption);
				
				
		});
	});
	
	$( function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[id='naver' ]").on("click" , function() {
				
				var popOption = "left=500, top=100, width=600, height=600, resizable=no, location=no;"		
				window.open("https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=AziWQOW7S2sZhD1PEBi9&state=STATE_STRING&redirect_uri=http://192.168.0.24:8080/user/callback","Naver login",popOption);
				
				
		});
	});
</script>




<!-- 80%size Modal at Center -->
<form name="user-login" class="form-horizontal">
<div class="modal modal-center fade" id="my80sizeCenterModal" tabindex="-1" role="dialog" aria-labelledby="my80sizeCenterModalLabel">
  <div class="modal-dialog modal-80size modal-center" role="document">
    <div class="modal-content">     
    <div class="login-wrap">
	<div class="login-html">
		<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
		<input style="display: none;" id="tab-2" type="radio" name="tab" class="sign-up"><label style="display: none;" for="tab-2" class="tab"></label>
		<div class="login-form">
			<div class="sign-in-htm">
				<div class="group">
					<label for="user" class="label">UserId</label>
					<input id="userId" name="userId" type="text" class="input" placeholder="Email">
				</div>
				<div class="group">
					<label for="pass" class="label">Password</label>
					<input id="password"  name="password"  type="password" class="input" data-type="password" placeholder="Password">
				</div>
				<div class="group">
					<input id="signin" class="button" value="Sign In" data-toggle="modal" style="readOnly=true;">
				</div>
				
				<div class="text-center">
				     <a id="kakao"><img src="/resources/images/kakaos.jpg" style="max-width: 100%; height: auto;"/></a>
     <a id="naver"><img src="/resources/images/navers.jpg" style="max-width: 100%; height: auto;"/></a>
		<a id="google"><img src="/resources/images/googles.jpg" style="max-width: 100%; height: auto;"/></a>
		</div>
			<div class="foot-lnk">Not a member?   
					<a href="#signUp">Sign up</a>
				</div>			<br>
				<div class="foot-lnk">
					<a href="#forgotId">Forgot Id?   </a>
				<br>	<a href="#forgotPassword">Forgot Password?</a>
			</div>
		
		</div>
	</div>
	
</div>
</div>
</div>
</div>
</div> <!-- ---�α���â--- -->
</form>	

<<jsp:include page="/coupon/addCoupon.jsp"></jsp:include>	
		 
		 



	
		