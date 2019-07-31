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
	

	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	body{	
		      color: #FBFCFE ;		  
			  background-color: #062038;
			  margin-top: 50px;				
			  font-family: 'Nanum Gothic', sans-serif;
		}
		a{
			color: #FBFCFE ;	
		}
		hr{
			border: 1px groove white;
		}
		.list-group-item{
			  margin-left:50px;	
			  color: #FBFCFE ;
			  border: 1px groove white;		  
			  background-color: #062038;
		}
		table{
			background-color: #193147;
		}
		td, th{
			border: 1px solid white;
			color: #FBFCFE ;
		}
		.col-md-2{
			padding-left: 50px;
		}	
		.col-lg-3{			
			margin-bottom: 20px;
		}
		.col-md-10{
			padding-left: 100px;
			padding-right: 100px;
		}
		.row.in{
			margin-left:50px;
			margin-right: 50px;
		}
		.border{
			padding-top: 20px;
			background-color: #193147;
		}
		section{
			margin-left: 100px;
		}
		#inputGroupSelect01, nav{
			background: rgba(4, 22, 37, 0.75);
			color: #c0c5c9;
		} 
		#tgetHeader{
			margin-top:30px;
		   color: #FBFCFE;	
	       padding-bottom: 200px;
	       margin-bottom: 30px;
	       		background: url(/resources/images/pic05.jpg) no-repeat center center fixed; 
				  -webkit-background-size: cover;
				  -moz-background-size: cover;
				  -o-background-size: cover;
				  background-size: cover;	
       } 
       #footer{
			background-color: #1B1B1F;
		}
		
		
	/* 	�Խñ� ��� Modal */
		.modal-dialog.modal-80size {
		  width: 300%;
		  height: 100%;
		  margin: 0;
		  padding: 0;
		}
		
		.modal-content.modal-80size {
		  color: black;
		  height: auto;  
		  min-height: 150%;
		  border-radius: 0;
		}
		
		.modal.modal-center {
		  text-align: center;
		}
		
		@media screen and (min-width: 768px) {
		  .modal.modal-center:before {
		    display: inline-block;
		    vertical-align: middle;
		    content: " ";
		    height: 100%;
		   
		  }
		}
		
		.modal-dialog.modal-center {
		  display: inline-block;
		  text-align: left;
		  vertical-align: middle;
		}
		



    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	
	
		function fncAddReport(){
			
			//alert($("input[name='whiteNickname']").val());
			$("form[name='addReport']").attr("method" , "POST").attr("action" , "/community/addReport").submit();
			}

			$(function() {
				$( "button.btn.btn-info:contains('�Ű��ϱ�')" ).on("click" , function() {
					fncAddReport();
				});
			});
			
		 $(function() {
			
 			 $( "button.btn.btn-info:contains('���')" ).on("click" , function() {
 					//self.location="/community/addContent"	
	 				var contentName= $("input[name='contentName']").val();
					var contentBody= $("textarea[name='contentBody']").val();
					
					if(contentName == null || contentName.length<1){
						alert("������ �Է��� �ּ���.");
						return;
					}
					
					alert("��� �Ǿ����ϴ�.")
					$("form[name='addContent']").attr("enctype","multipart/form-data").attr("method" , "POST").attr("action" , "/community/addContent").submit();
 				});
			 
			 $( "button.btn.btn-warning:contains('�� ã�� �ȳ�')" ).on("click" , function() {
				 var popOption = "left=500, top=100, width=600, height=600, resizable=no, location=no;"	                    
		             window.open("/community/getSearchLoad","T-get �� ã�� ",popOption);	
				 
				});
			 
			 $( "a[href='#']:contains('Ƽ�� �ŷ� ����')" ).on("click" , function() {
					self.location="/community/getContentList?searchCondition=2&searchKeyword=0";	
				
				});
			 
			 $( "a[href='#']:contains('�����Խ��� �̿� ����')" ).on("click" , function() {
					self.location="/community/getContentList?searchCondition=2&searchKeyword=1";	
				
				});
			 
			 $( "a[href='#']:contains('���� ���� ����')" ).on("click" , function() {
					self.location="/community/getContentList?searchCondition=2&searchKeyword=2";	
				
				});
			 
			 $( "a[href='#']:contains('��ϴ�')" ).on("click" , function() {
					self.location="/community/getContentList?searchCondition=2&searchKeyword=3";	
				
				});
			 
			 $( "a[href='#']:contains('�˴ϴ�')" ).on("click" , function() {
					self.location="/community/getContentList?searchCondition=2&searchKeyword=4";	
				
				});
			 
			 $( "a[href='#']:contains('���ٹ�')" ).on("click" , function() {
					self.location="/community/getContentList?searchCondition=2&searchKeyword=5";	
				
				});
			 
 			 $( ".reportRing" ).on("click" , function() {
 				 	if('${user}'==''){
 				 		alert("�α����� ���ּ���");
 				 		return;
 				 	}
 				 	$(this).attr("data-target","#addReportModal");
				 	var contentNo = $(this).attr("id").trim();
				 	$.ajax(
							{
								url : "/community/rest/getContent/"+contentNo ,
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(data) {
									$("input[name='contentNo']").val(data.contentNo);
									$("input[name='blackId']").val(data.userId);
									$("#reportContentBody").html(data.contentBody);
									$("#reportBlackId").html(data.userId);
								}
							});
				});
				
			 $( "a[href='#']:contains('ȯ�� �Խ���')" ).on("click" , function() {
					self.location="/community/getRefundList";	
				
				});
			 
				
	 
			// �� ��ȸ
			$( "td:nth-child(1)" ).on("click" , function() {
				self.location ="/community/getContent?contentNo="+$(this).children('#contentNo').text().trim();
			});

			$( "td:nth-child(1)" ).css("color" , "black");
			
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
		 
		 $(function() {
				
				$(".good").on("click" , function() {
					
					var contentNo = $(this).attr("id").trim();
					var goodCount = $("span[name='"+contentNo+"']").text().trim();
					var result = parseInt(goodCount)+1;
					var content = $("span[name='"+contentNo+"']");
					$.ajax(
			    		{
			    	
			        method:"GET",
			        url : "/community/rest/updateGoodCount/"+contentNo,
			        dataType: "json",
			        header:{
			        	"Accept" : "application/json",
						"Content-Type" : "application/json"	
			        },
			        success : function(data){
 			        		content.text(result);
 			        
			        }
			        
			    	});
				});
		 });
		 
 		  $(function() {
				
				$(".bad").on("click" , function() {
				
					var contentNo = $(this).attr("id").trim();
					var badCount = $('a').closest("#"+contentNo+"").text().trim();
					alert(badCount);
					var result1 = parseInt(badCount)+1;
					var content1 = $('a').closest("#"+contentNo+"");
					
					$.ajax(
			    		{
			    	
			        method:"GET",
			        url : "/community/rest/updateBadCount/"+contentNo,
			        dataType: "json",
			        header:{
			        	"Accept" : "application/json",
						"Content-Type" : "application/json"	
			        },
			        success : function(data){
			        	
			        	if($.trim(data.result)=="bad"){
			        		content1.text(result1);
			        	} 
			        } 
			        
			    	});
				});
		 });
 		  
 		 $(function getSearchWeather(lat, lon) {
			
				$("button.btn.btn-info:contains('���� �ȳ�')").on("click" , function() {
						
 								
						$.ajax( 
								
								{
									url : "/community/rest/getSearchWeather/",
									method : "POST" ,

									data : JSON.stringify({
										lat : lat,
										lon : lon,
									}),
									headers : {
										
										"Accept" : "application/json",
										"Content-Type" : "application/json"
									},
									success : function(JSONData , status) {
									
										var displayValue ="���� : "+JSONData.weather+"<br/>"
														+"�µ� : "+JSONData.temp+"��<br/>"
														+"ǳ�� : "+JSONData.wind+"m/s<br/>"
														+"�帲 : "+JSONData.clouds+"%<br/>";
										
										$(".modal-body").html(displayValue);
									}
							});
				});		
			});	
	</script>
	
</head>

<body>
	
	<jsp:include page="/layout/tgetToolbar.jsp" />
	
	<div id="tgetHeader" class="text-center">
	</div>
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="text-center">	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->	    	
		    	<button type="button" id="addContent" class="btn btn-danger" data-toggle="modal" data-target="#addContentModal">�� ����</button>
				<button type="button" id="weatherModalButton" class="btn btn-info" data-toggle="modal" data-target="#weatherModal">���� �ȳ�</button>				
				<button type="button" class="btn btn-warning">�� ã�� �ȳ�</button>
				<p class="text-primary">
		    		��ü  ${totalCount } �Ǽ�
		    	</p>
		<br/><br/><br/>
	</div>	   
		
      <!--  table Start /////////////////////////////////////-->
     <div class="col-md-10 text-center">
     	
	      <table class="table" >	      
	        <thead>
	          <tr>
	          	
	            <th>�� ����</th>
	            <th>�ۼ���</th>
	            <th>�ۼ���</th>				
	            <th>����/�����</th>	
	            <c:if test="${search.searchCondition=='2'&&search.searchKeyword=='3'||search.searchCondition=='2'&&search.searchKeyword=='4'||search.searchCondition=='2'&&search.searchKeyword=='5'}">
	            <th>�Ű�</th>
	            </c:if>	
	          </tr>
	        </thead>
	       
			<tbody>
			
			  <c:forEach var="content" items="${list}">
				<tr>
				  
				  <td>${content.contentName}
				  <!--  <div id="contentNo" name="contentNo">${content.contentNo}</div>-->
				  <div id="contentNo" style="display:none;">${content.contentNo}</div></td>
				 <!-- <input type="hidden" id="contentNo" name=contentNo value="${content.contentNo}" /> --> 
				   
	<%--  		  <td align="left">${content.contentBody}</td> --%>
				  <td>${content.userId}</td>
				  <!-- <div id="userId" style="display:none;">${content.userId}</div></td> -->
				  <td>${content.regDate}</td> 
				    
			   	  
			   	  
			   	  <!-- ���� -->
			   	  <td><a href="#" class="good" id="${content.contentNo}"><i class="fas fa-thumbs-up"></i></a>
			   	  <span name="${content.contentNo}">${content.goodCount}</span>
			   	  
			   	  <!-- ����� -->
			   	  <a href="#" class="bad" id="${content.contentNo}"><i class="fas fa-thumbs-down"></i></a>
			   	  <a id="${content.contentNo}">${content.badCount}</a> 
			   	  </td>
			   	  
				   	 <!-- �Ű� �ϱ� -->
			   	<c:if test="${search.searchCondition=='2'&&search.searchKeyword=='3'||search.searchCondition=='2'&&search.searchKeyword=='4'||search.searchCondition=='2'&&search.searchKeyword=='5'}">
				  <td align="left"><a href="#" class="reportRing" id="${content.contentNo}" data-toggle="modal" ><i class="fas fa-bell"></i></a>	
				  </td>
				  </c:if>
				  	
			</tr>
          <tr>
		</tr>
          </c:forEach>
			
	        </tbody>
	      
	      </table>
      </div>
	  <!--  table End /////////////////////////////////////-->
	</div>  
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
	<!-- ���� �ȳ� Modal -->
	<div class="modal fade" id="weatherModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-md" role="document">
					    <div class="modal-content modal-80size">
					    <div class="modal-weather">
					      <div class="modal-header"> 
					        <h5 class="modal-title" id="modalCenterTitle"><strong>���� �ȳ�</strong></h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body" id="getWeatherModalBody">
					     
					      </div>     
					   </div>
					          
					      <div class="modal-footer">
<!-- 					        <button type="button" class="btn btn-danger" data-dismiss="modal">���</button> -->
<!-- 					        <button type="button" class="btn btn-primary">Ȯ��</button> -->
					        
					      </div>
					    </div>
					    </div>
					  </div> 
	<!-- �Խñ� ��� Modal -->		  
		<form name='addContent'>
		<div class="modal modal-center fade" id="addContentModal" tabindex="-1" role="dialog" aria-labelledby="my80sizeCenterModalLabel">
	  <div class="modal-dialog modal-lg modal-center" role="document">
	    <div class="modal-content modal-80size">

	      <div class="modal-body" id="addContentModalBody">
	      <select id="boardCode" name="boardCode">
   			 	<option value="">�Խ��� ����</option>
		   		<c:if test="${sessionScope.user.role == '2'}">
		   			<option value="0">��������</option>
		   			</c:if>
	   			 	<option value="1">�����Խ���</option>
	   			 	<option value="2">������</option>
   			 	</select> 
   			 	
   			 <select id="contentCode" name="contentCode">
   			 	<option value="">�Խñ� ����</option>
		   			 <c:if test="${sessionScope.user.role == '2'}">   			 		
			   			 	<option value="0">Ƽ�� �ŷ� ����</option>
			   			 	<option value="1">�����Խ��� �̿� ����</option>
			   				<option value="2">���� ã�� ����</option>
			   		</c:if>
	   		
	   			 	<option value="3">��ϴ�</option>	
	   			 	<option value="4">�˴ϴ�</option>
	   			 	<option value="5">���ٹ�</option>
	   			 	<option value="6">1:1 �����ϱ�</option>
	   			 	<option value="7">ȯ�� �Խ���</option>
   			 	</select>
   			 	
   			 <select id="open" name="open">
				<option value="">���� ����</option>
					<option value="0">����</option>
					<option value="1">�����</option>
			</select>	
			
			<div class="form-group">
		    <label for="userNickname" class="col-sm-offset-1 col-sm-3 control-label">�г���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userNickname" name="userNickname" value="${sessionScope.user.nickName}" readonly>
		      <input type="hidden" name="userId" value="${sessionScope.user.userId}">
		    </div>
		  </div>
 
		  <div class="form-group">
		    <label for="contentName" class="col-sm-offset-1 col-sm-3 control-label">�� ����</label>
		    
		      <input type="text" class="form-control" id="contentName" name="contentName">
		    
		  </div>
		
		  <label for="contentBody" class="col-sm-offset-1 col-sm-3 control-label">�� ����</label>
		  <hr>
		
		<textarea class="form-control" id="contentBody" name="contentBody"></textarea>
		<script type="text/javascript">
		CKEDITOR.replace('contentBody'
				, {height: 200});
		</script>
		<br/>  		
	      </div>
	      
	      
	      <div class="modal-footer">
	        <button type="button" class="btn btn-info" data-dismiss="modal">���</button>
	        <button type="button" class="btn btn-warning" data-dismiss="modal">�ݱ�</button>
	      </div>
	    </div>
	  </div>
	</div>			  
	</form>
	<!-- �Ű��ϱ� Modal -->
	<div class="modal fade" id="addReportModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
					    <div class="modal-content modal-80size">
					  <div class="modal-report">
					      <div class="modal-header">
					        <h5 class="modal-title" id="modalCenterTitle"><strong>�Ű��ϱ�</strong></h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body" id="addReportModalBody"> 	    
		  
			    <form name="addReport">
<!-- 			    	<div style='display:table-cell;vertical-align:middle'>�Ű���ID -->
<%-- 			      <input id="whiteId" name="whiteId" value="${sessionScope.user.userId}" readonly></div>  --%>
					
			    	<div class="col">�ۼ��� : <span id="reportBlackId"></span></div>
					
					<div class="col">���� :  <div id="reportContentBody"></div></div>
			    
				<br>
				<hr>
				<input type='hidden' name='blackId' value='' />
				<input type='hidden' name='contentNo' value=''/>				
				<input type='hidden' name='whiteId' value='${user.userId}'/>
				<input type='hidden' name='whiteNickname' value='${user.nickName}'/>
				<input type='hidden' name='reportCode' value='0'/>				
				
				
				<strong>�Ű� ������ �������ּ���</strong>
			  	<div class='center'>
				<input type='checkbox' name='reportReasonCode' value='0'>�������� ȫ�� �Խù�<br>
				<input type='checkbox' name='reportReasonCode' value='1'>������ �Ǵ� û�ҳ⿡�� �������� ����<br>
				<input type='checkbox' name='reportReasonCode' value='2' >Ư���� ����� ���/�弳<br>
				<input type='checkbox' name='reportReasonCode' value='3' >���Ѽ�/���Ȱ ħ�� �� ���۱�ħ�� ��<br>
				</div>
				
				</form>		
				   
				<div class="modal-footer">
		        <button type="button" class="btn btn-info" data-dismiss="modal">�Ű��ϱ�</button>
		        <button type="button" class="btn btn-warning" data-dismiss="modal">���</button>
		      </div>
				</div></div>	        
						      </div>
						    </div>
						  </div>
							  
		

</body>
<jsp:include page="/layout/footer.jsp" />
</html>