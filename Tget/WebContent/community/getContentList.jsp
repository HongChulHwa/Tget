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
	
	

	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	
	body {
            margin-top: 70px;
            
       }
			.dropbtn {
	  background-color: #7FFFD4;
	  color: white;
	  padding: 16px;
	  font-size: 16px;
	  border: none;
	}
	
	.dropdown {
	  position: relative;
	  display: inline-block;
	}
	
	.dropdown-content {
	  display: none;
	  position: absolute;
	  background-color: #f1f1f1;
	  min-width: 160px;
	  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	  z-index: 1;
	}
	
	.dropdown-content a {
	  color: black;
	  padding: 12px 16px;
	  text-decoration: none;
	  display: block;
	}
	
	.dropdown-content a:hover {background-color: #7FFFD4;}
	
	.dropdown:hover .dropdown-content {display: block;}
	
	.dropdown:hover .dropbtn {background-color: #7FFFD4;}
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	
		function fncGetUserList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/community/getContentList").submit();
		}
		
		
		//============= "�˻�"  Event  ó�� =============	
		 $(function() {
			 
		 });

		 $(function() {
			
			 $( "button.btn.btn-danger:contains('�Խñ� ����ϱ�')" ).on("click" , function() {
					self.location="/community/addContent"	
				});
			 
			 $( "button.btn.btn-warning:contains('�� ã�� �ȳ�')" ).on("click" , function() {
				 var popOption = "left=500, top=100, width=600, height=600, resizable=no, location=no;"	                    
		             window.open("/community/getSearchLoad","T-get �� ã�� ",popOption);	
				 
				});
			 
			 $( "a[href='#']:contains('Ƽ�� �ŷ� ����')" ).on("click" , function() {
					self.location="/community/getContentList?searchCondition=1&searchKeyword=0";	
				
				});
			 
			 $( "a[href='#']:contains('�����Խ��� �̿� ����')" ).on("click" , function() {
					self.location="/community/getContentList?searchCondition=1&searchKeyword=1";	
				
				});
			 
			 $( "a[href='#']:contains('���� ���� ����')" ).on("click" , function() {
					self.location="/community/getContentList?searchCondition=1&searchKeyword=2";	
				
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
			 
			 $( "button.btn.btn-warning:contains('�Ű�')" ).on("click" , function() {	
				 	//alert($(this).val())
				 	self.location="/community/addReport?contentNo="+$(this).val();
				});
				
			 $( "a[href='#']:contains('ȯ�� �Խ���')" ).on("click" , function() {
					self.location="/community/getRefundList";	
				
				});
			 
	
			 
			 
			 
			// �� ��ȸ
			$( "td:nth-child(2)" ).on("click" , function() {
				self.location ="/community/getContent?contentNo="+$(this).children('#contentNo').text().trim();
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
		 
		 $(function() {
				
				$("ion-icon.btn.btn-info:contains('����')").on("click" , function() {
					
					//div:contains("contentNo")
					//'div[name="contentNo"]'
					//'div[id="contentNo"]'
					var contentNo = $(this).attr("id").trim();
					var goodCount = $('span').closest("#"+contentNo+"").text().trim();
					//alert(goodCount);
					var result = parseInt(goodCount)+1;
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
			        	//alert(data.result);
			        	
 			        	if($.trim(data.result)=="good"){
 			        		$('span').closest("#"+contentNo+"").text(result);
 			        	}
			        	
			        }
			        
			    	});
					alert("ok");
				});
		 });
		 
 		  $(function() {
				
				$("ion-icon.btn.btn-danger:contains('�����')").on("click" , function() {
				
					var contentNo = $(this).attr("id").trim();
					var badCount = $('a').closest("#"+contentNo+"").text().trim();
					var result1 = parseInt(badCount)+1;
					
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
 			        	$('a').closest("#"+contentNo+"").text(result1);
			        	} 
			        } 
			        
			    	});
				});
		 });
 		  
 		 $(function getSearchWeather(lat, lon) {
			
				$("button.btn.btn-info:contains('���� �ȳ�')").on("click" , function() {
						//alert("������");
 								
						$.ajax( 
								
								{
									url : "/community/rest/getSearchWeather/",
									method : "POST" ,
// 									dataType : "json" ,
									data : JSON.stringify({
										lat : lat,
										lon : lon,
									}),
									headers : {
										
										"Accept" : "application/json",
										"Content-Type" : "application/json"
									},
									success : function(JSONData , status) {
										//alert(JSONData);
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
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>Community</h3>
	       
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${totalCount } �Ǽ�
		    	</p>
		    
<!-- 		    	<div class="dropdown"> -->
<!-- 				  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
<!-- 				   	�Խ��� ���� -->
<!-- 				  </button> -->
<!-- 				  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"> -->
<!-- 				    <a class="dropdown-item" id="boardCode0" href="#">��������</a> -->
<!-- 				    <a class="dropdown-item" id="boardCode1" href="#">�����Խ���</a> -->
<!-- 				    <a class="dropdown-item" id="boardCode2" href="#">������</a> -->
<!-- 				  </div> -->
<!-- 				</div> -->
				
<!-- 				<div class="dropdown"> -->
<!-- 				  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
<!-- 				   	�Խñ� ���� -->
<!-- 				  </button> -->
<!-- 				  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"> -->
<%-- 				   <c:if test="${sessionScope.user.role == '2'}"> --%>
<!-- 				    <a class="dropdown-item" id="contentCode0" href="#">Ƽ�� �ŷ� ����</a> -->
<!-- 				    <a class="dropdown-item" id="contentCode1" href="#">�����Խ��� �̿� ����</a> -->
<!-- 				    <a class="dropdown-item" id="contentCode2" href="#">���� ���� ����</a> -->
<%-- 				    </c:if> --%>
				    
<!-- 				    <a class="dropdown-item" id="contentCode3" href="#">��ϴ�</a> -->
<!-- 				    <a class="dropdown-item" id="contentCode4" href="#">�˴ϴ�</a> -->
<!-- 				    <a class="dropdown-item" id="contentCode5" href="#">���ٹ�</a> -->
<!-- 				    <a class="dropdown-item" id="contentCode6" href="#">1:1 �����ϱ�</a> -->
<!-- 				    <a class="dropdown-item" id="contentCode7" href="#">ȯ�� �Խ���</a>  -->
<!-- 				  </div> -->
<!-- 				</div> -->
				
				<button type="button" class="btn btn-danger">�Խñ� ����ϱ�</button>
				
				<button type="button" id="weatherModalButton" class="btn btn-info" data-toggle="modal" data-target="#weatherModal">���� �ȳ�</button>
				<button type="button" class="btn btn-warning">�� ã�� �ȳ�</button>
				 <div>
				 
		    <div class="col-md-6 text-right">
			    <!-- <form class="form-inline" name="detailForm">
	
			<div class="form-group">
			    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���">
				  </div>
				  
				  <button type="button" class="btn btn-info">�˻�</button>
				  
				  PageNavigation ���� ������ ���� ������ �κ�
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				   
				</form>
			  		 -->	 
  			</div>
		</div>
				
		   
	    	</div>
	    	
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left">�� ����</th>
<!--              <th align="left">�� ����</th>  -->
            <th align="left">�ۼ���</th>
            <th align="left">�ۼ���</th>
            <th align="left">�Ű��ϱ�</th>
            <th align="left">����/�����</th>
            
            
			
			
			
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="content" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			  <td align="left" class="btn btn-link">${content.contentName}
			  <!--  <div id="contentNo" name="contentNo">${content.contentNo}</div>-->
			  <div id="contentNo" style="display:none;">${content.contentNo}</div></td>
			 <!-- <input type="hidden" id="contentNo" name=contentNo value="${content.contentNo}" /> --> 
			   
<%--  			  <td align="left">${content.contentBody}</td> --%>
			  <td align="left">${content.userId}</td>
			  <!-- <div id="userId" style="display:none;">${content.userId}</div></td> -->
			  <td align="left">${content.regDate}</td> 
			  <td align="left"><button type="button" value="${content.contentNo}" class="btn btn-warning">�Ű�</button>
		   	  <td align="left">
		   	  <ion-icon name="thumbs-up" class="btn btn-info" id="${content.contentNo}">����</ion-icon>
		   	  <span id="${content.contentNo}">${content.goodCount}</span>
		   	 <ion-icon name="thumbs-down" class="btn btn-danger" id="${content.contentNo}">�����</ion-icon>
		   	 <a id="${content.contentNo}">${content.badCount}</a> 
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
<%-- 	<jsp:include page="../common/pageNavigator_new.jsp"/> --%>
	<!-- PageNavigation End... -->
	<div class="modal fade" id="weatherModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-md" role="document">
					    <div class="modal-weather">
					      <div class="modal-header"> 
					        <h5 class="modal-title" id="modalCenterTitle"><strong>���� �ȳ�</strong></h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					     
					      </div>     
					   </div>
					          
					      <div class="modal-footer">
<!-- 					        <button type="button" class="btn btn-danger" data-dismiss="modal">���</button> -->
<!-- 					        <button type="button" class="btn btn-primary">Ȯ��</button> -->
					        
					      </div>
					    </div>
					  </div> 
					  
					  
	

</body>

</html>