<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">	
	<link href="https://fonts.googleapis.com/css?family=Cute+Font|Gurajada|Jua|Nanum+Brush+Script|Nanum+Pen+Script|Shadows+Into+Light|Sunflower:300&display=swap&subset=korean" rel="stylesheet">
	<link href="/resources/css/login.css"/>	
<title>�̺�Ʈ �̹��� ��� �Ϸ�</title>

	<script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script type="text/javascript">
	
	$(function(){
		$("#submit").on("click",function(){	
			$(this).val($("#eventImage").val());
			$(opener.document).find("#eventImage").val($(this).val());
			window.close();
		})	;
	});
	</script>

</head>

<body>

<form>
	<div class="container" align="center">
		<br/><br/>
		
		<input type="hidden"  id="eventName" name="eventName"  value="${eventName}" >
		<input type="hidden"  id="eventImage" name="eventImage"  value="${!empty eventImage? eventImage : ''}" />
<%-- 		<input type="file" class="form-control" id="file" name="file" value="${!empty eventImage? eventImage : ''}"><br/><br/><br/><br/> --%>
			<div align="center"><h3>���� ������ ����Ǿ����ϴ�.</h3></div>
		<br/><br/>
		<div align="center">
			<c:if test="${!empty eventImage}">
				<img src="/resources/images/uploadFiles/${eventImage}" />
			</c:if>
			<c:if test="${empty eventImage}">
				<img src = "http://placehold.it/500x280"/>
			</c:if><br/>
			<div align="center"><button class="btn btn-light"  id="submit" >Ȯ��</button></div>
		</div>
	</div>
</form>

</body>
</html>