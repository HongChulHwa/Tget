<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>T-GET</title>

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="/resources/css/toolbar.css" />
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">	
	<link href="https://fonts.googleapis.com/css?family=Cute+Font|Gurajada|Jua|Nanum+Brush+Script|Nanum+Pen+Script|Shadows+Into+Light|Sunflower:300&display=swap&subset=korean" rel="stylesheet">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">
  	
  	<script src="/resources/javascript/common.js" ></script>
	<script src="/resources/javascript/alarm.js" ></script>
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/jquery.scrolly.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>

	<script type="text/javascript">
	$( function() {
	    $( "#tabs" ).tabs();
	  } );

	$(function(){
		$("#addCate").on("click",function(){			
			alert("ī�װ� �߰�");
		});
		
		$("button:contains('�����ϱ�')").on("click",function(){			
// 			alert("�����ϱ�");
			var temp = $(this).val();
			$.ajax(
					{
						url : "/event/rest/deleteRecommendedEvent",
						method : "GET",
						contentType: 'application/json; charset=UTF-8',
						data : {
										recommEventNo : temp
									},
						dataType : "json",
						success : function(JSONData, status){
// 							alert(status);
// 							alert("JSONData : \n"+JSONData);		
							$("#recommEventlistSize").val(parseInt($("#recommEventlistSize").val())-1);
							$("#"+temp).html("");
// 							alert($("#recommEventlistSize").val());					
						},
						error : function(request, status, error ) {   
						 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}			
				});			
			
		});
		
// 		$("button:contains('�����ϱ�')").on("click",function(){	
// 			alert($(this).val());
// 			$("#recommEventNo").val($(this).val());
	
// 			$.ajax(
// 					{
// 						url : "/event/rest/getRecommendedEvent",
// 						method : "POST",
// 						data : {
// 							recommEventNo : $(this).val()							
// 						},
// 						dataType : "json",
// 						success : function(JSONData,status){
// 							$("input[name='recommEventNo']").val(JSONData.recommEvent.recommEventNo);
// 							$("#recommEventName").val(JSONData.recommEvent.recommEventName);
// 							$("#videoName").val(JSONData.recommEvent.videoName);
// 							$("#recommEventDetail").val(JSONData.recommEvent.recommEventDetail);
// 							$("#recommEventUrl").val("http://192.168.0.82:8080/event/getEvent?category=&eventName="+JSONData.recommEvent.eventName);	
		 
// 						},
// 						error : function(request, status, error ) {   
// 						 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
// 						}			
// 				});	
// 		});
// 			popWin = window.open("/event/updateRecommendedEvent?recommEventNo="+$(this).val(),"popWin",
// 					"left=500, top=100, width=600, height=600, "
// 					+"marginwidth=0, marginheight=0, scrollbars, scrolling, menubar=no, resizable");
		
		
// 		$("a.category").on("click", function(){
// 			$.ajax(
// 					{
// 						url : "/event/rest/updateCa",
// 						method : "POST",
// 						data : {
// 										 : $("#").val()
// 									},
// 						dataType : "json",
// 						success : function(JSONData, status){
// 							alert(status);
// 							alert("JSONData : \n"+JSONData);		
					
// 						},
// 						error : function(request, status, error ) {   
// 						 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
// 						}
// 		});


		$("#submit").on("click",function(){	
// 			$("#editRecommEvent").attr("method" , "POST").attr("enctype","multipart/form-data");
// 			alert("submit");
			var formData = new FormData($("#editRecommEvent")[0]);			
			if($("#recommEventNo").val()==""){
				if (parseInt($("#recommEventlistSize").val()) < 3) {
					$.ajax(
						{
							url : "/event/rest/addRecommendedEvent",
							method : "POST",
							data : formData,
							processData: false,
							contentType: false,
							dataType : "json",
							success : function(JSONData,status){
								$("button.close").click();
							},
							error : function(request, status, error ) {   
							 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							}			
						});
				}else{					
	 				alert("��õ �̺�Ʈ�� �� �̻� �߰��� �� �����ϴ�.");
				}
			}else{
// 				alert('"#recommEventNo").val()!=""');
				$.ajax(
						{
							url : "/event/rest/updateRecommendedEvent",
							method : "POST",
							data : formData,
							processData: false,
							contentType: false,
							dataType : "json",
							success : function(JSONData,status){
								$("#recommEventNo").val("");
								$("button.close").click();
							},
							error : function(request, status, error ) {   
							 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							}			
					});				
			}
		});
		$("button.close").on("click",function(){
			$("#recommEventNo").val("");	
		});

	});
	
	</script>
	
	<style>
	
		body{
			background-color : #062038; 
			color: #FBFCFE;
		}	
		#footer{
			background-color: #1B1B1F ;
		}		
		a, hr{
			color: #FBFCFE ;	
		}		
		button.btn-light:hover{
			background-color: gray;
			color: #FBFCFE ;
		}			
		.tab-content{
			min-height: 400px;
		}	
	    div.container {
	        	margin-top: 50px;
	/*         	font-family: 'Shadows Into Light', 'Nanum pen Script', cursive; */
	        	font-size: 20px;
	    }
        #list-recomm, #list-category{  
			padding : 10px 10px 10px 10px;
		}
		div.row{  
			padding : 10px  10px 10px 20px;
		}
        .col-10{
        	border: 2px solid #FBFCFE ;            
	       	background-color : #193147 ;
        }
        .card{
        	padding : 5px 5px 5px 5px;
        	color: black;
        	font-weight: bold;
        }                
        .card-header{
        	font-weight:bold; background-color:#1B1B1F ; color:#FBFCFE ;
        }        
        .card-bodys{
        	background-color:  #FBFCFE; color: #1B1B1F;
        	padding: 5%;
        }

    </style>
    
</head>

<body>
<jsp:include page="/layout/tgetToolbar.jsp" />
<!-- <form> -->
	<div class="container">
	
		<div class="row"  style="margin-top: 30px;">
		  <div class="col-2 col-lg-2" >
		    <div class="list-group" id="list-tab" role="tablist">
		      <a class="list-group-item list-group-item-action active " id="list-recomm-list" data-toggle="list" href="#list-recomm" role="tab" aria-controls="recomm">��õ�̺�Ʈ</a>
		      <a class="list-group-item list-group-item-action" id="list-category-list" data-toggle="list" href="#list-category" role="tab" aria-controls="category">ī�װ�</a>
		    </div>
		  </div>
		  <div class="col-10 col-lg-10">
		    <div class="tab-content" id="nav-tabContent">
		      <div class="tab-pane fade show active" id="list-recomm" role="tabpanel" aria-labelledby="list-recomm-list">
		      <div  class="row" >
		      	<div class="col-11"></div>
		      	<div class="col-1" align="left"  class="btn btn-light"	data-toggle="modal" 						
								 data-target="#exampleModalCenter"><ion-icon id="addRecomm" name="add" size="large"></ion-icon></div>		      	
		      </div>

  			<input type="hidden" id="recommEventlistSize" value="${recommEventlistSize }"/>
  			<input type="hidden" id="recommEventNo" />
  
			<div class="row" align="center" >		      	
				<c:forEach items="${recommEventlist}"  var="i">			
					<div style="width: 18rem; height: 400px;" id="${i.recommEventNo }">
						<video controls id="videoplay"  name="${i.recommEventNo }"  value="video" style="width: 300px; height: 170px;">
							<source src="/resources/video/${i.videoName}" type="video/mp4">
						</video>
						<div class="card-body" style="height: 220px;" >
							<input type="hidden" name="eventName" value="${i.eventName }"/>
							<h5 class="card-title" style="font-weight: bold;">${i.recommEventName }</h5>
							<p class="card-text">${i.recommEventDetail }</p>
							<button class="btn btn-light" value="${i.recommEventNo }" >�����ϱ�</button>
							<button class="btn btn-light" value="${i.recommEventNo }">�����ϱ�</button>
						</div>
					</div>
				</c:forEach>	
			</div>
		 </div>
			  
			  
		      <div class="tab-pane fade" id="list-category" role="tabpanel" aria-labelledby="list-category-list">
		      	<div  class="row" >
			      	<div class="col-11"></div>
			      	<div class="col-1" align="left"><ion-icon id="addCate" name="add" size="large"></ion-icon></div>		      	
			      </div>
			      
		      	<div class="row ">
		      		<div class="col-1"></div>
			      	<div class="card col-10">
					  <h5 class="card-header" >���ǰ���</h5>
					  <div class="card-bodys">
					  	<h5 class="card-title">
					 	 <c:forEach items="${categorylist }"  var="i">
						    <c:if test="${i.categoryOneCode == 0}">
						   		<div class="row">
							        <ion-icon name="checkmark"></ion-icon>
									<a class="category" value="${i.categoryTwoNo }">
								   	 ${i.categoryTwoName }</a>
						   		</div>
					    	</c:if>
					  	</c:forEach></h5>				    
					  </div>
					</div>
					<div class="col-1"></div>
				   </div>
					
					<div class="row ">
					<div class="col-1"></div>
			      	<div class="card col-10">
					  <h5 class="card-header">������</h5>
					  <div class="card-bodys">
					  	<h5 class="card-title">
					 	 <c:forEach items="${categorylist }"  var="i">
						    <c:if test="${i.categoryOneCode ==1}">
						   		<div><ion-icon name="checkmark"></ion-icon>
					 			<a class="category" value="${i.categoryTwoNo }">
						   		${i.categoryTwoName }</a></div><br/>
					    	</c:if>
					  	</c:forEach></h5>			    
					  </div>
					</div>
					<div class="col-1"></div>
				   </div>
					
					<div class="row " >
					<div class="col-1"></div>
			      	<div class="card col-10">
					  <h5 class="card-header" >��Ÿ��������</h5>
					  <div class="card-bodys">
					  	<h5 class="card-title">
					 	 <c:forEach items="${categorylist }"  var="i">
						    <c:if test="${i.categoryOneCode ==2}">
						   		<div><ion-icon name="checkmark"></ion-icon>
					 			<a class="category" value="${i.categoryTwoNo }">
						   		${i.categoryTwoName }</a></div><br/>
					    	</c:if>
					  	</c:forEach></h5>				    
					  </div>
					</div>
					<div class="col-1"></div>
				   </div>
			      	
		      	
<!-- 		      		<div class="col-3  " style="font-weight:bold; font-size: 30px;" align="right"> -->
<!-- 		      			<div>���ǰ���</div>	      			 -->
<!-- 		      		</div> -->
<!-- 		      		<div class="col-8 card mb-3">		      			 -->
<!-- 		      			<div class="row"> -->
<%-- 		      				 <c:forEach items="${categorylist }"  var="i"> --%>
<%-- 						    	<c:if test="${i.categoryOneCode == 0}"> --%>
<!-- 						    		<div><ion-icon name="checkmark"></ion-icon> -->
<%-- 						   			<a class="category" value="${i.categoryTwoNo }"> --%>
<%-- 						    		${i.categoryTwoName }</a></div><br/><br/>	 --%>
<%-- 						    	</c:if> --%>
<%-- 						  	</c:forEach>	<br/><br/>	 --%>
<!-- 		      			</div> -->
<!-- 		      		</div> -->
<!-- 		      		<div class="col-1" ></div> -->
<!-- 		      </div> -->
		      
<!-- 		      <div class="row "> -->
<!-- 		      	<div class="col-3 " style="font-weight:bold; font-size: 30px;" align="right"> -->
<!-- 		      		<div>������</div>	      			 -->
<!-- 		      	</div> -->
<!-- 		      	<div class="col-8  card  mb-3">		      			 -->
<!-- 		      		<div class="row"> -->
<%-- 		      			 <c:forEach items="${categorylist }"  var="i"> --%>
<%-- 						   	<c:if test="${i.categoryOneCode == 1}"> --%>
<!-- 						   		<div><ion-icon name="checkmark"></ion-icon> -->
<%-- 						   			<a class="category" value="${i.categoryTwoNo }"> --%>
<%-- 						    		${i.categoryTwoName }</a></div><br/>	 --%>
<%-- 						   	</c:if> --%>
<%-- 						</c:forEach>	<br/><br/>	 --%>
<!-- 		      		</div> -->
<!-- 		      	 </div> -->
<!-- 		      	 <div class="col-1" ></div> -->
<!-- 		      </div> -->
		      
<!-- 		      <div class="row"> -->
<!-- 		      	<div class="col-3" style="font-weight:bold; font-size: 30px;" align="right"> -->
<!-- 		      		<div>��Ÿ��������</div>	 	 -->
<!-- 		      	</div> -->
<!-- 		      	<div class="col-8   card  mb-3">		      			 -->
<!-- 		      		<div class="row"> -->
<%-- 		      			 <c:forEach items="${categorylist }"  var="i"> --%>
<%-- 						   	<c:if test="${i.categoryOneCode == 2}"> --%>
<!-- 						   		<div><ion-icon name="checkmark"></ion-icon> -->
<%-- 						   			<a class="category" value="${i.categoryTwoNo }"> --%>
<%-- 						    		${i.categoryTwoName }</a></div><br/>	 --%>
<%-- 						   	</c:if> --%>
<%-- 						</c:forEach>	<br/><br/>	 --%>
<!-- 		      		</div> -->
<!-- 		      	 </div> -->
<!-- 		      	 <div class="col-1" ></div> -->
<!-- 		      </div> -->
		      
  			</div>
  			  
		 </div>
	  </div>
	</div>
	
  </div>
<!-- </form> -->


<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"  
aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
     <div class="modal-wrap">
     <div class="modal-html">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">��õ�̺�Ʈ ����</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color:white;">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <jsp:include page="/event/addRecommVideoGET.jsp" />
<%-- 		<input type="file" class="form-control" id="file" name="file" value="${!empty eventImage? eventImage : ''}"><br/><br/> --%>
      </div>
      <div class="modal-footer">
       
        <button type="button" class="btn btn-light"  id="submit" >����</button>
         <button type="button" class="btn btn-dark" data-dismiss="modal">�ݱ�</button>
      </div>
    </div>
    </div>
   </div>
  </div>
</div>



<jsp:include page="/layout/footer.jsp" />
</body>
</html>