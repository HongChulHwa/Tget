<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">
	
	</script>
</head>

<body>

<form target="/event/getEventList" method="post">
	<div class="container-fluid">
	searchCondition�� 0�̸� ī�װ� �˻�
	searchCondition�� 1�̸� Ű���� �˻�
	<input type="text" id="searchCondition" name="searchCondition" placeholder="searchKeyword"/>
	<input type="text"  id="searchKeyword" name="searchKeyword"  placeholder="searchKeyword" value="${!empty search.searchKeyword? search.searchKeyword : ''}" >
	<button type="submit" id="" >�׽�Ʈ</button>
	</div>
</form>

</body>
</html>