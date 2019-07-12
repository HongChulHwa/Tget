<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<style>
	</style>
   	
   	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		$( function(){

			$("a:contains('�̺�Ʈ�˻�')").on("click",function(){
				self.location = "/event/test";
			});
			
			$("a:contains('Ƽ���Ǹ�')").on("click",function(){
				self.location = "/ticket/addTicketInfo?eventId=104175822";
			});
			
			
		});
		$( function() {
			//==> �߰��Ⱥκ� : "addUser"  Event ����
			$("a[href='#' ]:contains('ȸ������')").on("click" , function() {
				self.location = "/Tget/user/addUser"
			});
		});
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
		
	</script>	
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
		
        <div class="container">
        	
        	<a class="navbar-brand" href="#"><img src="/resources/images/logo.png" width="100" height="50"></img></a>
			
			
			<div class="collapse navbar-collapse"  id="target" >
	            <ul class="nav navbar-nav navbar-right">
	            <li><a href="#">�̺�Ʈ�˻�</a></li>
	            <li class="dropdown">
		        <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		           <span >Ƽ��</span>
		           <span class="caret"></span>
		        </a>
		        <ul class="dropdown-menu">
		           <li><a href="#">Ƽ�ϱ���</a></li>
		           <li><a href="#">Ƽ���Ǹ�</a></li>
		           <li><a href="#">Ƽ�ϸ��</a></li>
		           <li class="divider"></li>
		        </ul>
		    	   <li class="dropdown">
		        <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		           <span >�Խ���</span>
		           <span class="caret"></span>
		        </a>
		        <ul class="dropdown-menu">
		           <li><a href="#">���� �Խ���</a></li>
		           <li><a href="#">���� �Խ���</a></li>
		           <!-- <li><a href="#">Ƽ�ϸ��</a></li> -->
		           <li class="divider"></li>
		        </ul>
		    	</li>
	             <li><a href="#">ȸ������</a></li>
	             <li><a href="#">�� �� ��</a></li>
	             <li><a href="#">ä��</a></li>
	           	</ul>
	           	</li>
		    		 <li><a href="#">������Ʈ����</a></li>
	                 <li><a href="#">ȸ������</a></li>
	                 <li><a href="#">�� �� ��</a></li>
	                 <li><a href="#">ä��</a></li>
	           	</ul>
	       </div>
   		
   		</div>
   	</div>
   	
</body>

</html>