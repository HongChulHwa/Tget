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
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     
	
	
</head>

<body>
<form class="form-inline" name="detailForm">
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>�� ���� ��ȸ</h3>
	    </div>
	  
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="left">������ȣ</th>
            <th align="left">�����뵵</th>
            <th align="left">�����������</th>
            <th align="left">�����߱�����</th>
            <th align="left">��������</th>
            
            
          </tr>
        </thead>
       
		<tbody>
				
			<tr>
			  <td align="left">${coupon.couponNo}</td>
			  <td align="left">
			  
			  <c:set var ="Code" value="${coupon.couponCode}"/>
			  <c:if test="${Code eq '0'}">
			   ������</c:if>
			 <c:if test="${Code eq '1'}">
			 	������</c:if>
				</td>
				
			  <td align="left">${coupon.couponUseDate}
			  <td align="left">${coupon.couponRegDate}
			  <td align="left">  <c:set var ="State" value="${coupon.couponStatement}"/>
			  <c:if test="${State eq '0'}">
			   ��밡��</c:if>
			 <c:if test="${State eq '1'}">
			 	����</c:if>
			<c:if test="${State eq '2'}">
			 	�Ⱓ����</c:if>
			  	<input type="hidden" value="${coupon.userId}">
			
			  </td>
			
			  	
			</tr>
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->

		
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
</form>	
</body>

</html>