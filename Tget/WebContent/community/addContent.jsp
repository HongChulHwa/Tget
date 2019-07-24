<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<link rel="stylesheet" href="/resources/css/toolbar.css" />
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>	
		<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
				
		<script src="/resources/javascript/common.js" ></script>
		<script src="/resources/javascript/alarm.js" ></script>
		<script src="/resources/javascript/jquery.min.js"></script>
		<script src="/resources/javascript/jquery.scrolly.min.js"></script>
		<script src="/resources/javascript/skel.min.js"></script>
		<script src="/resources/javascript/util.js"></script>
		<script src="/resources/javascript/main.js"></script>	
   <script src="//cdn.ckeditor.com/4.12.1/standard/ckeditor.js"></script>
   
	<style>
	.dropbtn {
  background-color: #7FFFD4;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #7FFFD4;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {background-color: #7FFFD4;}
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncAddContent();
				
				
			});
		});	
		
		
		//============= "���"  Event ó�� ��  ���� =============
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]:contains('�� &nbsp;��')").on("click" , function() {
				history.go(-1);
			});
		});	
			
			 
		
		///////////////////////////////////////////////////////////////////////
	function fncAddContent(){
	//Form ��ȿ�� ����
 	
		var contentName= $("input[name='contentName']").val();
		var contentBody= $("textarea[name='contentBody']").val();
		
		if(contentName == null || contentName.length<1){
			alert("������ �Է��� �ּ���.");
			return;
		}
// 		if(contentBody == null || contentBody.length<1){
// 			alert("������ �Է��� �ּ���.");
// 			return;
// 		}
		
		alert("��� �Ǿ����ϴ�.")
		$("form").attr("method" , "POST").attr("action" , "/community/addContent").submit();
	}

	$(function(){
			
		    $( "#manuDate" ).datepicker({
		    	changeMonth: true,
		        changeYear: true,
		        dateFormat: 'yy-mm-dd'			        
		    });
	});
	</script>
	
</head>

<body>

	
	<jsp:include page="/layout/tgetToolbar.jsp" />
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">�Խñ� ���</h3>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<div>
<!-- 		<div class="dropdown"> -->
<!--   			<button class="dropbtn">�Խ��� ����</button> -->
<!--   		<div class="dropdown-content"> -->
<%--    			 <a href="#" id="boardCode0" value="${search.searchCodition==1&&search.searchKeyword==0}">��������</a> --%>
<%--    			 <a href="#" id="boardCode1" value="${search.searchCodition==1&&search.searchKeyword==1}">�����Խ���</a> --%>
<%--     		 <a href="#" id="boardCode2" value="${search.searchCodition==1&&search.searchKeyword==2}">������</a>	  --%>
<!--   			</div> -->
<!-- 		</div> -->
		
		
		</div>
		<form class="form-horizontal" >
		<!-- enctype="multipart/form-data" -->
	  
<!-- 		  <div class="dropdown"> -->
<!--   			<button class="dropbtn">�Խñ� ����</button> -->
<!--   		<div class="dropdown-content"> -->
   			 <select id="boardCode" name="boardCode">
   			 	<option value="">�Խ��� ����</option>
		   			<option value="0">��������</option>
	   			 	<option value="1">�����Խ���</option>
	   			 	<option value="2">������</option>
   			 	</select> 
   			 	
   			 <select id="contentCode" name="contentCode">
   			 	<option value="">�Խñ� ����</option>
		   			 <c:if test="${sessionScope.user.role == '2'}">   			 		
			   			 	<option value="0">Ƽ�� �ŷ� ����</option>
			   			 	<option value="1">���� �Խ��� �̿� ����</option>
					</c:if>
			   		<option value="2">���� ã�� ����</option>
	   			 	<option value="3">��ϴ�</option>
	   			 	<option value="4">�˴ϴ�</option>
	   			 	<option value="5">���ٹ�</option>
	   			 	<option value="6">1:1 �����ϱ�</option>
	   			 	<option value="7">ȯ�� �Խ���</option>
   			 	</select>  			 
<!--   			</div> -->
<!-- 		</div> -->
		
			<select id="open" name="open">
				<option value="">���� ����</option>
					<option value="0">����</option>
					<option value="1">�����</option>
			</select>	
		
		  
		  <div class="form-group">
		    <label for="userNickname" class="col-sm-offset-1 col-sm-3 control-label">ȸ�� �г���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userNickname" name="userNickname" value="${sessionScope.user.nickName}" readonly>
		      <input type="hidden" name="userId" value="${sessionScope.user.userId}">
		    </div>
		  </div>
 
		  <div class="form-group">
		    <label for="contentName" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="contentName" name="contentName">
		      
		    </div>
		  </div>
		
		  <label for="contentBody" class="col-sm-offset-1 col-sm-3 control-label">�� ����</label>
		  <hr>
		
		<textarea class="form-control" id="contentBody" name="contentBody"></textarea>
		<script type="text/javascript">
		CKEDITOR.replace('contentBody'
				, {height: 200});
		</script>
					
			<!-- <div class="custom-file">
					&nbsp;<input type="file" class="form-control-file" id="exampleFormControlFile1">
					</div> -->
	
			<br/>  
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">�� &nbsp;��</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
 	
</body>

</html>