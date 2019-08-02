 <%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>


<!-- ���� : http://getbootstrap.com/css/   ���� -->
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    	<meta name="description" content="Tab Styles Inspiration: A small collection of styles for tabs" />
		<meta name="keywords" content="tabs, inspiration, web design, css, modern, effects, svg" />
		<meta name="author" content="Codrops" />
    	

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
				</head>
			<body>
			
<script type="text/javascript">

	window.onload = function(){
		
		if(${user.role==0}){
			
			document.getElementById("cc").style.display = "none" ;
			document.getElementById("cc2").style.display = "none" ;
			
		}
	}




$(function() {
	
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("button:contains('ȸ������ ����')").on("click" , function() {

		var popOption = "left=500, top=100, width=800, height=600, resizable=no, location=no;"		
		window.open("/user/updateUser.jsp","ȸ������ ����",popOption);
				
	});
});	


function fncUpdateUser() {
	var name=$("input[name='userName']").val();
	
	if(name == null || name.length <1){
		alert("�̸���  �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
		
	$("form").attr("method" , "POST").attr("action" , "/user/updateUser").submit();
}


$(function() {
	
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("button:contains('�Ǹų��� ��ȸ')").on("click" , function() {

				
		window.open("/ticket/getTicketList?menu=seller");
				
	});
});	









				</script>
			
	<jsp:include page="/layout/tgetToolbar.jsp" />
	<jsp:include page="/layout/tgetHeader.jsp" />
	
			
	<!-- <div class="text-right" style="margin-right: 130px; margin-top: 30px;">	  
	
	</div> -->
		   <!--  table Start /////////////////////////////////////-->
			 <div class="col-md-10 text-center" >	
			<section>
				<br/>
				<div class="tabs tabs-style-topline">
			
					<nav>
						<ul>
							<li><a href="#section-topline-1"><h6><strong>�� ������ ����</strong></h6></a></li>
							<li><a href="#section-topline-2"><h6><strong>�Ǹ��� ���� ����</strong></h6></a></li>
						</ul>
					</nav>
				
			<div class="content-wrap">
				<section id="section-topline-1">
						<div class= "text-center">
						            <div class="border">
						                      
						                        	 <h4>${user.nickName}�� ������</h4><hr/>
													
												
							  		<div class="col-xs-8 col-md-4"><strong>���̵�</strong></div>
									<div class="text-center">${user.userId}</div><hr/>
									<div class="col-xs-8 col-md-4 "><strong>�г���</strong></div>
									<div class="text-center">${user.nickName}</div>	<hr/>
						            <div class="col-xs-8 col-md-4 "><strong>�� ��</strong></div>
									<div class="text-center">${user.userName}</div>  <hr/>
									<div class="col-xs-8 col-md-4 "><strong>�ּ�</strong></div>
									<div class="text-center">${user.address}</div>   <hr/> 
									
									<div class="col-xs-8 col-md-4"><strong>��ȭ��ȣ</strong></div>
									<div class="col-xs-8 col-md-40">${ !empty user.phone ? user.phone : ''}	</div> <br>
									
												
							  		<div class="text-center">
							  			<button type="button" class="btn btn-outline-primary">ȸ������ ����</button><br>
							  		</div>
						                        
						                 
											 
										</div>	 
										</div>						
						</section>
				
				
				<section id="section-topline-2">
					<div class="row">
					<div class="col-6">	
						<div class= "text-center">
				           <div class="border">
				                      
										
					  		<h4>${user.nickName}�� �Ǹ�������</h4><hr/>
										
				             <div class="text-center"><strong>�Ǹ��ڵ��</strong></div>
							<div class="text-center">
							
						
							<c:set var="sc" value ="${user.sellerCode}"/>
							
							<c:choose>
							<c:when test="${sc eq '0' }"> ���� </c:when>
							<c:when test="${sc eq '1' }"> ��� </c:when>
							<c:when test="${sc eq '2' }"> V.I.P </c:when>
							
							<c:otherwise>
								
								
								</c:otherwise>		
							</c:choose>
				
							</div> 
							 <hr/>  <div class="text-center">        
					  		<div ><strong>�� �Ǹűݾ�</strong></div>
							<div>${user.salesAmount}</div><hr/>
							<div><strong>�� �Ǹ�Ƚ��</strong></div> 
							<div>${user.salesCount}</div><br>
							
							<button id="sb" type="button" class="btn btn-outline-primary" >�Ǹų��� ��ȸ</button>	<br>					  </div>
						 </div> 
						 </div>
					</div>	
					<div class="col-6">			
						<div class= "text-center">
						           <div class="border">
									
									<div class="title">
													<h4>${user.nickName}�� ��������</h4><hr/>
												</div>
												<div id="cc">
						             <div class="col-xs-8 col-md-4 "><strong>�����ָ�</strong></div>
									<div class="col-xs-8 col-md-8">${user.userName}</div>  <hr/>          
							  		<div class="col-xs-8 col-md-4"><strong>�����</strong></div>
									</div>
									<div class="col-xs-8 col-md-8">
									
									<c:set var="sc" value ="${user.accountBank}"/>
									
									<c:choose>
									<c:when test="${sc eq '039' }"> �泲���� </c:when>
									<c:when test="${sc eq '004' }"> �������� </c:when>
									<c:when test="${sc eq '034' }"> �������� </c:when>
									<c:when test="${sc eq '003' }"> ������� </c:when>
									<c:when test="${sc eq '031' }"> �뱸���� </c:when>
									<c:when test="${sc eq '045' }"> �������ݰ� </c:when>
									<c:when test="${sc eq '088' }"> �������� </c:when>
									<c:when test="${sc eq '048' }"> ����</c:when>
									<c:when test="${sc eq '027' }"> ��Ƽ���� </c:when>
									<c:when test="${sc eq '020' }"> �츮���� </c:when>
									<c:when test="${sc eq '071' }"> ��ü�� </c:when>
									<c:when test="${sc eq '005' }"> ��ȯ���� </c:when>
									<c:when test="${sc eq '081' }"> �ϳ����� </c:when>
									<c:otherwise>
										�Ǹ��� ��� �� ��ȸ����.
										<button id= "add" type="button" class="btn btn-primary" data-target="#addSellerModal" data-toggle="modal">�Ǹ��� ���</button>
										</c:otherwise>		
									</c:choose>
									
									</div><hr/>
									<div id="cc2" class="col-xs-8 col-md-4 "><strong>���¹�ȣ</strong></div>
									<div class="col-xs-8 col-md-8">${user.accountNo}</div><br/>
							<div class="text-center">
							  			<button type="button" class="btn btn-outline-primary" data-target="#addSellerModal" data-toggle="modal" >�������� ����</button><br>
							  </div> 
						</div>
						</div>
							
					</div>		
					</div>		
				</section>
						
						<!-- <section id="section-topline-3">
						<div class="row">
								
								 	<div class="col-lg-3">
								 	<div class="text-center">
								 		<div class="border">
								 		<br/>
								 			
								 			
								 			
								 		</div>
								 	</div>	
								 	</div>
						
						</div>	
						
						</section>
						
						<section id="section-topline-4">
							<div class="text-center">
								 <div class="border">
								 		<br/>
								 			
								 			
								 			
								 </div>
							</div>	
								
						</section> -->
								
								
								
								
								
								
								
								</div><!-- /content -->
								</div><!-- /tabs -->
								
								 		</section>
				
				</div>	
				  <!--  table End /////////////////////////////////////-->
			
			 
			
			    <%-- <div class="container">
			     	
	
			   
         		
					<div class= "text-center">
                        
                      
                        	 <h4>${user.nickName}�� ������</h4>
							
						
	  		<div class="col-xs-8 col-md-4"><strong>���̵�</strong></div>
			<div class="text-center">${user.userId}</div><hr/>
			<div class="col-xs-8 col-md-4 "><strong>�г���</strong></div>
			<div class="text-center">${user.nickName}</div>	<hr/>
            <div class="col-xs-8 col-md-4 "><strong>�� ��</strong></div>
			<div class="text-center">${user.userName}</div>  <hr/>
			<div class="col-xs-8 col-md-4 "><strong>�ּ�</strong></div>
			<div class="text-center">${user.address}</div>   <hr/> 
			
			<div class="col-xs-8 col-md-4"><strong>��ȭ��ȣ</strong></div>
			<div class="col-xs-8 col-md-40">${ !empty user.phone ? user.phone : ''}	</div> <hr/> 
			
						
	  		<div class="text-center">
	  			<button type="button" class="btn btn-primary">ȸ������ ����</button>
	  		</div>
                        
					 
				</div>	 
				
				
				
               
						<div class="content-wrap">
						<section id="section-topline-1">
						  <div class="input-group-prepend">

                        
                      
                        
						<div class="title">
							<h4>${user.nickName}�� ��������</h4>
						</div>
             <div class="col-xs-8 col-md-4 "><strong>�� ��</strong></div>
			<div class="col-xs-8 col-md-8">${user.userName}</div>  <hr/>          
	  		<div class="col-xs-8 col-md-4"><strong>�����</strong></div><hr/>
			<div class="col-xs-8 col-md-8">${user.accountBank}</div><hr/>
			<div class="col-xs-8 col-md-4 "><strong>���¹�ȣ</strong></div> <hr/>
			<div class="col-xs-8 col-md-8">${user.accountNo}</div>	<hr/>
      
	<div class="col-xs-8 col-md-4">
	  			<button type="button" id ="btn" class="btn btn-primary" >�������� ����</button>
	  		</div> 
					 
				</div>	 
				</div>
				
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
               
					<div class="box-part">
                        
                      
                        
						<div class="title">
							<h4>${user.nickName}�� �Ǹ�������</h4>
						</div>
             <div class="col-xs-8 col-md-8 "><strong>�Ǹ��ڵ��</strong></div>
			<div class="col-xs-8 col-md-8">
			
		
			<c:set var="sc" value ="${user.sellerCode}"/>
			
			<c:choose>
			<c:when test="${sc eq '0' }"> ���� </c:when>
			<c:when test="${sc eq '1' }"> ��� </c:when>
			<c:when test="${sc eq '2' }"> V.I.P </c:when>
			
			<c:otherwise>
				�Ǹ��� ��� �� ��ȸ.
				<button id= "add" type="button" class="btn btn-primary">���</button>
				</c:otherwise>		
			</c:choose>

			</div> 
			 <hr/>          
	  		<div class="col-xs-8 col-md-8"><strong>�� �Ǹűݾ�</strong></div><hr/>
			<div class="col-xs-8 col-md-8">${user.salesAmount}</div><hr/>
			<div class="c ol-xs-8 col-md-8 "><strong>�� �Ǹ�Ƚ��</strong></div> <hr/>
			<div class="col-xs-8 col-md-8">${user.salesCount}</div>	<hr/>
				</div>	 
				</div>
			 	 <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
               
					<div class="box-part text-center">
					    
					    <i class="fa fa-google-plus fa-3x" aria-hidden="true"></i>
                    
						<div class="title">
							<h4>Google</h4>
						</div>
                        
						<div class="text">
							<span>Lorem ipsum dolor sit amet, id quo eruditi eloquentiam. Assum decore te sed. Elitr scripta ocurreret qui ad.</span>
						</div>
                        
						<a href="#">Learn More</a>
                        
					 </div>
				</div>	 
				
				
		
		</div>		
 </div> --%>
 
<script src="/resources/javascript/cbpFWTabs.js"></script>
<script type="text/javascript"> src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
			(function() {

				[].slice.call( document.querySelectorAll( '.tabs' ) ).forEach( function( el ) {
					new CBPFWTabs( el );
				});

			})();
</script>	
	 
<jsp:include page="/ticket/addSeller.jsp" /> 
<jsp:include page="/layout/footer.jsp" />
</body>


</html> 