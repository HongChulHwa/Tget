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
		<meta name="description" content="Tab Styles Inspiration: A small collection of styles for tabs" />
		<meta name="keywords" content="tabs, inspiration, web design, css, modern, effects, svg" />
		<meta name="author" content="Codrops" />
    <title>T-GET</title>

		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<link rel="stylesheet" href="/resources/css/toolbar.css" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="/resources/css/tabs.css" />
		<link rel="stylesheet" type="text/css" href="/resources/css/tabstyles.css" />
		<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
	
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
		<script src="/resources/javascript/modernizr.custom.js"></script>

	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	body{	
		      color: #FBFCFE ;		  
			  background-color: #062038;
			  margin-top: 50px;				
			  font-family: 'Nanum Gothic', sans-serif;
		}
		a, hr{
			color: #FBFCFE ;	
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
			background-color: #193147;
		}
		section{
			margin-left: 40px;
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
       #cyberWidget{
       		background-color: white;
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
 		
	</script>
	
</head>

<body>
	
	<jsp:include page="/layout/tgetToolbar.jsp" />
	
	<div id="tgetHeader" class="text-center">
	</div>
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="text-center">	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->	    	
		    	<c:if test="${sessionScope.user.role == '2'}">
		    	<button type="button" id="addContent" class="btn btn-danger" data-toggle="modal" data-target="#addContentModal">�� ����</button>
		    	</c:if>
				<p class="text-primary">
		    		��ü  ${totalCount } �Ǽ�
		    	</p>
		
	</div>	   
	
	<div class="col-8">	
			<section>
				<br/>
				<div class="tabs tabs-style-topline">
					<nav>
						<ul>
							<li><a href="#section-topline-1"><h6><strong>��ü �ŷ� ����</strong></h6></a></li>
							<li><a href="#section-topline-2"><h6><strong>Ƽ�� Check</strong></h6></a></li>
							<li><a href="#section-topline-3"><h6><strong>������ �Ա� Ȯ��</strong></h6></a></li>
							<li><a href="#section-topline-4"><h6><strong>�Ǹ��� �Ա�</strong></h6></a></li>
						</ul>
					</nav>
					<div class="content-wrap">
						<section id="section-topline-1">
						  <div class="input-group-prepend">
						  <label class="input-group-text" for="inputGroupSelect01">�˻�</label>						  
						  <select class="custom-select" id="inputGroupSelect01" style="width :150px;">
						    <option selected>All</option>
						    <option value="0">�Ա� ���</option>
						    <option value="1">��� ���</option>
						    <option value="2">��� ��</option>
						    <option value="3">��� �Ϸ�</option>
						    <option value="4">ȯ�� �� ���</option>
						  </select>
						  </div>
						<hr/>
							 <div class="row">
								 <c:forEach var="tran" items="${list}" varStatus="j">
								 	<div name="${tran.tranCode}" class="col-lg-3">
								 	<div class="text-center">
								 		<div class="border">
								 		<br/>
								 			<h5><strong>${tran.event.koName}</strong></h5>
								 			<hr/>
								 			<div><small>${tran.orderDate}</small></div>
								 			<div><small>${tran.seller.userId} <i class="far fa-handshake"></i> ${tran.buyer.userId}</small></div>
								 			<c:if test="${tran.tranCode=='0'}">
								 				<div class="progress">
												  <div class="progress-bar progress-bar-striped bg-danger progress-bar-animated" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
								 				<div class="text-danger"><small>*�������Ա� �����</small></div>
								 			</c:if>
								 			<c:if test="${tran.tranCode=='1'}">
									 			<div class="progress">
													<div class="progress-bar progress-bar-striped bg-warning progress-bar-animated" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
								 				<div class="text-warning"><small>*�����Ϸ� (��۴��)</small></div>
								 			</c:if>
								 			<c:if test="${tran.tranCode=='2'}">
								 				<div class="progress">
													<div class="progress-bar progress-bar-striped bg-info progress-bar-animated" role="progressbar" style="width: 75%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
								 				<div class="text-info"><small>*�����</small></div>
								 			</c:if>
								 			<c:if test="${tran.tranCode=='3'}">
								 				<div class="progress">
													<div class="progress-bar progress-bar-striped bg-success progress-bar-animated" role="progressbar" style="width: 100%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
								 				<div class="text-success"><small>*��ۿϷ�</small></div>
								 			</c:if>
								 			<c:if test="${tran.tranCode=='4'}">
								 				<div class="text-secondary"><small>*ȯ�� �� ���</small></div>
								 			</c:if>
								 			
								 			<div><small></small></div>
								 			<div><small></small></div>
								 			<br/>
								 		</div>
								 	</div>	
								 	</div>
								 </c:forEach>
							 </div>
						</section>
						<section id="section-topline-2">
									
									 <div class="text-center">
								    
								      <div class="row" id="ticketCheckRow">
								      </div>
								    </div>
						</section>
						<section id="section-topline-3">
							<div class="row">
								 <c:forEach var="tran" items="${list}" varStatus="j">
								 <c:if test="${tran.tranCode=='0'}">
								 	<div class="col-lg-3">
								 	<div class="text-center">
								 		<div class="border">
								 		<br/>
								 			<h5><strong>${tran.event.eventName}</strong></h5>
								 			<hr/>
								 			<div><small>${tran.orderDate}</small></div>
								 			<div><small><i class="far fa-user"></i> ${tran.buyer.userId}</small></div>
								 			<div><small>�̸� : ${tran.buyer.userName}</small></div>
								 			<div><small>�ݾ� : ${tran.totalPrice}</small></div>
								 			<br/>
								 			<div><button type="button" name="depositCheck" id="${tran.tranNo}" class="btn btn-outline-success"><i class='fas fa-check'></i></button>
								 			  &nbsp;<button type="button" name="tranDelete" id="${tran.tranNo}" class="btn btn-outline-danger"><i class='fas fa-trash-alt'></i></button></div>
								 			<br/>
								 		</div>
								 	</div>	
								 	</div>
								 </c:if>	
								 </c:forEach>
							 </div>
						</section>
						<section id="section-topline-4">
							<div class="row">
								 <c:forEach var="tran" items="${list}" varStatus="j">
								 <c:if test="${tran.tranCode=='3'}">
								 	<div class="col-lg-3">
								 	<div class="text-center">
								 		<div class="border">
								 		<br/>
								 			<h5><strong>${tran.event.eventName}</strong></h5>
								 			<hr/>
								 			<div><small>${tran.orderDate}</small></div>
								 			<div><small><i class="far fa-user"></i> ${tran.seller.userId}</small></div>
								 			<div><small>�̸� : ${tran.seller.userName}</small></div>
								 			<div><small>�������� : ${tran.seller.accountBank}</small></div>
								 			<div><small>���ݰ��� : ${tran.seller.accountNo}</small></div>
								 			<div><small>�ݾ� : ${tran.totalPrice}</small></div>
								 			<br/>
								 			<div><button type="button" name="depositSeller" id="${seller.sellerId}" class="btn btn-outline-success"><i class="fas fa-money-check-alt"></i></button></div>
								 			<br/>
								 		</div>
								 	</div>	
								 	</div>
								 </c:if>	
								 </c:forEach>
							 </div>
						</section>
					</div><!-- /content -->
				</div><!-- /tabs -->
			</section>
			</div>		
		   
	 <div class="row">
	  <div class="col-md-2 text-center">	  
	      <div class="sticky-top">
		  <br/>
			 <div>
		       <c:if test="${search.searchCondition=='2'&&search.searchKeyword=='0'}">
		       		<h5>Community > ��������</h5>
		       </c:if>
		       <c:if test="${search.searchCondition=='2'&&search.searchKeyword=='1'}">
		       		<h5>Community > ��������</h5>
		       </c:if>
		       <c:if test="${search.searchCondition=='2'&&search.searchKeyword=='2'}">
		       		<h5>Community > ��������</h5>
		       </c:if>
		       <c:if test="${search.searchCondition=='2'&&search.searchKeyword=='3'}">
		       		<h5>Community > �����Խ���</h5>
		       </c:if>
		       <c:if test="${search.searchCondition=='2'&&search.searchKeyword=='4'}">
		       		<h5>Community > �����Խ���</h5>
		       </c:if>
		       <c:if test="${search.searchCondition=='2'&&search.searchKeyword=='5'}">
		       		<h5>Community > �����Խ���</h5>
		       </c:if>
		      
		   	 </div>
			<c:if test="${search.searchCondition=='2'&&search.searchKeyword=='0'||search.searchCondition=='2'&&search.searchKeyword=='1'||search.searchCondition=='2'&&search.searchKeyword=='2'}">
				<ul class="list-group list-group-flush">
				<li class="list-group-item"><a href="#">Ƽ�� �ŷ� ����</a></li>
				<li class="list-group-item"><a href="#">�����Խ��� �̿� ����</a></li>
				<li class="list-group-item"><a href="#">���� ���� ����</a></li>
				</ul>
			</c:if>
	
			</div>
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
</body>
<jsp:include page="/layout/footer.jsp" />
</html>