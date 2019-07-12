<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


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
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
	   body {
            padding-top : 50px;
        }
    
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">	
		
		
	function fncAddTicketInfo(){
		//Form ��ȿ�� ����
	 	var amount = $("input[name='amount']").val();
		var type = $("input[name='type']").val();
		var seat = $("input[name='seat']").val();
		
		if(amount == null || amount.length<1){
			alert("������ �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if(isNaN(amount)==true) {
			alert("������ �����Է� �ٶ��ϴ�.");
			return;
		}
		if(type == null || type.length<1){
			alert("���´� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if(seat == null || seat.length<1){
			alert("�¼� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
	
		$("form").attr("method" , "POST").attr("action" , "/ticket/addTicketInfo").submit();
	}		
	
	$(function(){
	    
	    $("button").on("click",function(){
	    	
	    	fncAddTicketInfo();
	    	
	    });
		
	    $("a[href='#']").on("click",function(){
	    	
	    	self.location = "/";
	    	
	    });
	    
	});
	</script>		
    
</head>

<body>
	
	<div class="container">
	<br/>
		<h1 class="text-center">Ƽ �� �� �� : ${event.eventName}</h1>
				
		<form class="form-horizontal">
		<input type="hidden" name="event.eventId" value="${event.eventId}" >
		<input type="hidden" name="event.eventName" value="${event.eventName}" >
		<input type="hidden" name="seller.userId" value="seller" >
		
		<br/>
		  <div class="form-group">
		    <label class="col-sm-offset-1 col-sm-3 control-label">���</label>
		    <div class="col-sm-4">
		      ${event.eventLocation}
		    </div>
		  </div>
		<br/>
		  <div class="form-group">
		    <label class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		      ${event.eventDate}
		    </div>
		  </div>
		<br/>
		  <div class="form-group">
		    <label for="amount" class="col-sm-offset-1 col-sm-3 control-label">�Ǹ� ����</label>
		    <div class="col-sm-1">
		      <input type="text" class="form-control" id="amount" name="amount" style="width: 90px !important" >
		    </div>
		    <div class="col-sm-3 text-danger">  	
		          * �ϰ��� �ѹ��� �Ǹ� �˴ϴ�.
		    </div>
		  </div>
		<br/>  
		  <div class="form-group">
		    <label for="type" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		      <input type="radio" name="type" value="0" checked="checked" /> ����Ƽ��
			  <input type="radio" name="type" value="1" /> ����Ƽ��
		    </div>
		  </div>
		<br/>  
		  <div class="form-group" >
		    <label for="" class="col-sm-offset-1 col-sm-3 control-label">�¼�</label>
		    <div class="col-sm-1">
		    <input type="text" class="form-control" id="seat" name="seat" style="width: 90px !important" maxlength="10" placeholder="��) B2">
		    </div>
		    <div class="col-sm-1">  	
		         ���� <br/>(��/��)
		    </div>
		    <div class="col-sm-1">
		    <input type="text" class="form-control" id="seat" name="seat" style="width: 90px !important" maxlength="10" placeholder="��) 6">
		    </div>
		    <div class="col-sm-1">  	
		     	��
		    </div>
		  </div>
		<br/>  
		  <div class="form-group">
		    <label for="options" class="col-sm-offset-1 col-sm-3 control-label">Ư�̻���<br/>(����)</label>
		    <div class="col-sm-4">
		      <textarea name="options" cols="40" rows="8" ></textarea>
		    </div>
		  </div>
		<br/>
			<div class="form-group">
		    <label for="options" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		      	<a class="btn btn-primary btn" role="button">�� ���� ����</a>
		    </div>
		  </div>
		<br/>			  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
		    </div>
		  </div>
		</form>
				
 	</div>
	
</body>

</html>