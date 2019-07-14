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
	
		//============= "����"  Event ���� =============
		function fncUpdateContent() {
	// Form ��ȿ�� ����
	
			$("form").attr("method" , "POST").attr("action" , "/community/updateContent").submit();
}//===========================================//
//==> �߰��Ⱥκ� : "����"  Event ����
 $(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
	 $( "button.btn.btn-primary" ).on("click" , function() {
		
		 fncUpdateContent();
		
	 });
});

$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
	 $( "a[href='#' ]" ).on("click" , function() {
		//Debug..
		//alert(  $( "td.ct_btn01:contains('���')" ).html() );
		history.go(-1);
	});
});
	
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->

   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">�Խñ� ����</h3>
	       <!-- <h5 class="text-muted">�� ������ <strong class="text-danger">�ֽ������� ����</strong>�� �ּ���.</h5> -->
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		   <div class="form-group">
		    <label for="contentNo" class="col-sm-offset-1 col-sm-3 control-label">�Խñ� ��ȣ</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="contentNo" name="contentNo" value="${content.contentNo }" placeholder="���� �Ұ��մϴ�"  readonly>
		       <span id="helpBlock" class="help-block">
		      </span>
		    </div>
		  </div> 
		  
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">�ۼ���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" value="${content.userId }" placeholder="���� �Ұ��մϴ�"  readonly>
		       <span id="helpBlock" class="help-block">
		      </span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="regDate" class="col-sm-offset-1 col-sm-3 control-label">�ۼ���</label>
		    <div class="col-sm-4">
		       <input type="text" class="form-control" id="regDate" name="regDate" value="${content.regDate }" placeholder="���� �Ұ��մϴ�"  readonly>
		       <span id="helpBlock" class="help-block">
		      </span>
		    </div>
		  </div>
		 
		
		  <div class="form-group">
		    <label for="contentName" class="col-sm-offset-1 col-sm-3 control-label">�Խñ� ����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="contentName" name="contentName" value="${content.contentName }">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="contentBody" class="col-sm-offset-1 col-sm-3 control-label">�Խñ� ����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="contentBody" name="contentBody" value="${content.contentBody}">
		    </div>
		  </div>
		  
		  
		  
		   
		  <!-- 
		  <div class="form-group">
		    <label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ �̹���</label>
		    <div class="col-sm-4">
		       <input type="file" multiple="multiple" class="form-control" id="fileName" name="fileName" value="" placeholder="file input...">
		    </div>
		  </div> -->
		  
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