<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Searching Youtube Video</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">
	
	var str = "";
	var videoList = [];
	
	$(function(){
		$("#searchSubmit").on("click",function(){
			alert("searchKeyword : "+$("#searchKeyword").val());
			//str = $("#searchKeyword").val();
			//$("form").attr("method" , "POST").attr("action" , "/event/youtubeSearch").submit();
			
			$.ajax(
					{
						url : "/event/json/youtubeSearch",
						method : "POST",
						data : {
										searchCondition : $("#searchCondition").val(),
										searchKeyword : $("#searchKeyword").val(),

									},
						dataType : "json",
						success : function(JSONData, status){
							alert(status);
							alert("JSONData : \n"+JSONData);		
					
						},
						error : function(request, status, error ) {   
						 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
			
					});			
		});		
	});
	
	</script>
</head>

<body>

<form>
	<div class="container-fluid">
	<%-- 	<input type="hidden" id="currentPage" name="currentPage" value="${!empty search.currentPage? search.currentPage: ''}"/> --%>
	category : <input type="text"  id="category" name="category"  value="${!empty category? category : ''}" ><br/>
	searchCondition : <input type="text" id="searchCondition" name="searchCondition"   value="  ${!empty search.searchCondition? search.searchCondition : ''}"   />
	searchKeyword : <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���" value="${!empty search.searchKeyword? search.searchKeyword : ''}" >
	<button type="submit" id="searchSubmit" >�˻�</button>
	eventListByName<br/><br/>
	�̺�Ʈ ${i.eventName }�� �˻� ��� : �� ${totalResults} ��</br></br>		
	<c:forEach items="${eventListByName}"  var="i">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10 event">
				��¥ : ${i.eventDate }<br/>
				�ð� : ${i.eventTime}<br/>
				�̺�Ʈ ��� : ${i.eventLocation }<br/>
				���� ��ϵ� Ƽ�� �� : ${i.totalTicketCount }<br/>
				Ƽ�������� : ${i.ticketLowestPrice }<br/>				
				DB�� ����� ī�װ�2 Eng Name  : <input type="text"  id="category2" name="category2"  value="${i.categoryTwoEng}" ><br/>
				<button  type="button" id="getEvent" name="getEvent"  value="${i.name }">�󼼺���</button><br/>
				============================<br/>
			</div>
			<div class="col-md-1"></div> 
		</div>
	</c:forEach>
		
	</div>
</form>

</body>
</html>