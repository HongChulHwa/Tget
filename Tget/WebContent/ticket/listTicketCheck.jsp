<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/toolbar.css" />
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
	
	
	<style>
    </style>
    
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
    
	<script type="text/javascript">
							
	</script>
	
</head>

<body>

	
	<jsp:include page="/layout/tgetToolbar.jsp" />
	<div class="container">
	
		<h1 class="text-center">���� Ƽ�� ���</h1>
		<br/> 
	    <hr/>
	    ��  ${sellProb.totalCount} ��
	
	 <div class="text-center">
    
      <div class="row" id="ticketCheckRow">
       <c:forEach var="ticket" items="${list}" varStatus="j" > 
	       <div class="col-md">
	       <div class="card" style="width: 18rem; height: ">
			  <img class='img-circle' src="/resources/images/uploadFiles/${ticket.ticketImage}" class="card-img-top">
			  <div class="card-body">
			    <h2>${ticket.event.eventName}</h2>         
		          <p>�¼� : ${ticket.seat}</p>
		          <p>���� : ${ticket.amount}</p>
		          <p>${ticket.price} ��</p>	          
		        
			          <p class="text-info">	         
			          	<a class="btn btn-outline-primary" id="${ticket.ticketNo}" href="#" data-toggle="modal" data-target="#checkModal">
				      <i class="fas fa-search"></i>����</a>		          
			          </p>
			  </div>
			</div>
	       </div>	       
        </c:forEach>
        </div>
    </div>


<!-- Modal -->
			<div class="modal fade" id="checkModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-lg" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="modalCenterTitle">Ƽ�� ����</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					      <div class="text-center">
					      </div>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					      </div>
					    </div>
					  </div>
			 </div>	  
	
</div>

<jsp:include page="/layout/footer.jsp" />
	
</body>

</html>