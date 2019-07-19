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
    <title>T-GET</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/blog/">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	
		function fncGetUserList(currentPage) {
			
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/community/getRefundList").submit();
		}
	
		//============= "�˻�"  Event  ó�� =============	
		 $(function() {
			 
		 });
		
		 $(function() {
			
						
			 $( "button.btn.btn-primary:contains('����')" ).on("click" , function() {
					 $("form[name='refundCheck']").attr("method" , "POST").attr("action" , "/community/updateRefund").submit();	
				});
			 
			$( "td:nth-child(2)" ).css("color" , "black");
			$("h7").css("color" , "red");
			
			$(".ct_list_pop:nth-child(n)").on("mouseenter", function(){
				$(this).css({
					"background-color":"#808080",
					"font-weight":"bolder"
				});
			})
			.on("mouseleave", function(){
				var style = {
						backgroundColor: "",//#ddd
						fontWeight:""
				};
				$(this).css(style);
			});
	
	});	
		 
// 		 $(function() {
			 
// 				//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
// 				$("#contentModalButton").on("click" , function() {
						
// 						var contentNo = $(this).children('input[type="hidden"]').val();
// 						var reportNo = $(this).children('div').text().trim();
// 						$('input[name="reportNo"]').val(reportNo);
// 						$.ajax( 
// 								{
// 									url : "/community/json/getContent/"+contentNo ,
// 									method : "GET" ,
// 									dataType : "json" ,
// 									headers : {
// 										"Accept" : "application/json",
// 										"Content-Type" : "application/json"
// 									},
// 									success : function(JSONData , status) {

// 										var displayValue ="�Խñ� ���� : "+JSONData.content.contentName+"<br/>"
// 														+"�Խñ� ���� : "+JSONData.content.contentBody+"<br/>";
										
// 										$(".modal-body").html(displayValue);
// 									}
// 							});
// 				});		
// 			});	
	
	</script>
	
</head>

<body>
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar Start /////////////////////////////////////-->
	
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>ȯ�� �Խ���</h3>
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${Page.totalCount } �Ǽ�, ���� ${Page.currentPage}  ������
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
				  <div class="form-group">
				   <%--  <select class="form-control" name="searchCondition" >
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>�Ű�� ��</option>
					</select> --%>
				  </div>
				  
				  <%-- <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">�˻�</button> --%>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >�� ����</th>
            <th align="left">�ۼ���</th>
            <th align="left">�ۼ���</th>
            <th align="left">���� ����</th>
            
	
          </tr>
        </thead>
       
		<tbody>
		<form name="refundCheck">
			<input type="hidden" name="contentNo" value=""/>
		</form>
		  <c:set var="i" value="0" />
		  <c:forEach var="content" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			  <td align="left">${content.contentName}</td>
			  <td align="left">${content.userId}</td>
			  <td align="left">${content.regDate}</td>
			  <td align="left">
			  <button type="button" id="contentModalButton" class="btn btn-info"  data-toggle="modal" data-target="#contentModal">
			  <input type="hidden" value="${content.contentNo}"/>
			  <div style="display: none;">${content.refundCheck}</div>
			  ���� </button>
			  </td>
			  <td align="left">
			  
			  </td> 
			  
			
			</tr>
          <tr>
		</tr>
          </c:forEach>
		
        </tbody>
      
      </table>
      
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<!-- PageNavigation End... -->
	 <div class="modal fade" id="contentModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-md" role="document">
					    <div class="modal-content">
					      <div class="modal-header"> 
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">ȯ�� ó�� �Ͻðڽ��ϱ�?</div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">���</button>
					        <button type="button" class="btn btn-primary">���� Ȯ��</button>
					        <button type="button" class="btn btn-danger">���</button>
					      </div>
					    </div>
					  </div> 
	</div>
</body>

</html>