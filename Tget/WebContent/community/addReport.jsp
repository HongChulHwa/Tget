<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="//cdn.ckeditor.com/4.12.1/standard/ckeditor.js"></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	<style>
		body {
            padding-top : 30px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				alert("��ϵǾ����ϴ�.")
				$("form").attr("method" , "POST").attr("action" , "/community/addContent").submit();
			});
		});	
		
		
		//============= "���"  Event ó�� ��  ���� =============
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				history.go(-1);
			});
		});	
			
			 
		
		///////////////////////////////////////////////////////////////////////
		function fncAddContent(){
	//Form ��ȿ�� ����
 	//var name = document.detailForm.prodName.value;
	//var detail = document.detailForm.prodDetail.value;
	//var manuDate = document.detailForm.manuDate.value;
	//var price = document.detailForm.price.value;
	
	//var name= $("input[content='contentName']").val();
	
	
	if(content == null || content.length<1){
		alert("���� �Է��� �ּ���.");
		return;
	}
	
	$("form").attr("method" , "POST").attr("action" , "/community/getContentList").submit();
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

	
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">�Ű��ϱ�</h3>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" >
		<!-- enctype="multipart/form-data" -->
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�Ű���</strong></div>
	  		<div class="col-xs-8 col-md-4">${report.whiteId}</div>
		</div>
		
		  
		  <div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�Ű�� ����</strong></div>
	  		<div class="col-xs-8 col-md-4">${report.contentBody}</div>
		</div>
		
		
		<div class="col-xs-4 col-md-2 "><strong>�Ű� ����</strong></div>
	  	<div class="col-xs-8 col-md-4">${report.reportReasonCode}
		<input type='radio' name='a' value='a'>�������� ȫ�� �Խù�<br>
		<input type='radio' name='b' value='b'>������ �Ǵ� û�ҳ⿡�� �������� ����<br>
		<input type='radio' name='c' value='c' >Ư���� ����� ���/�弳<br>
		<input type='radio' name='d' value='d' >���Ѽ�/���Ȱ ħ�� �� ���۱�ħ�� ��<br>
		</div>
		  <%-- <div class="form-group">
		    <label for="userNickName" class="col-sm-offset-1 col-sm-3 control-label">ȸ�� �г���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userNickName" name="userNickName" value="${content.userNickName}">
		      
		    </div>
		  </div> --%>
		  
		  
					
			<!-- <div class="custom-file">
					&nbsp;<input type="file" class="form-control-file" id="exampleFormControlFile1">
					</div> -->
	
			<br/>  
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >�Ű��ϱ�</button>
			  <a class="btn btn-primary btn" href="#" role="button">�� &nbsp;��</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
 	
</body>

</html>