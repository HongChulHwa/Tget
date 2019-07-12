<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


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
		
$(function() {
			
		
		$( "button.btn.btn-primary" ).on("click" , function() {
		
			history.go(-1); //self.location = "/product/listProduct?menu=manage"
		});
	}); 
	 
	 $(function() {
			
			
			$( "a[href='#' ]" ).on("click" , function() {
				
			self.location = "/community/updateContent?contentNo=${content.contentNo}"
			});
		}); 
		
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">�Խñ� �� ��ȸ</h3>
	    </div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�Խñ� ��ȣ</strong></div>
			<div class="col-xs-8 col-md-4">${content.contentNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�ۼ���</strong></div>
			<div class="col-xs-8 col-md-4">${content.userId}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�Խñ� ���� </strong></div>
			<div class="col-xs-8 col-md-4">${content.contentName}</div>
		</div>
		
		<hr/>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�Խñ� ����</strong></div>
	  		<div class="col-xs-8 col-md-4">${content.contentBody}</div>
			<!-- <img src="/images/uploadFiles/${product.fileName}"> -->
		</div>
		
		<hr/>

		
		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >Ȯ &nbsp;��</button>
			 <a class="btn btn-primary btn" href="#" role="button">�� &nbsp;��</a> 
		    </div>
		</div>
		
		<br/>
		
 	</div>
 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

</body>

</html>