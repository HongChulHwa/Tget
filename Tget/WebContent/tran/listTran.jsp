<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="/resources/javascript/common.js" ></script>
   	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    	.img_wrap {
			width: 300px;
			margin: auto;
		}
		.img_wrap img {
			max-width: 100%;
		} 
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">	
	
	$(function(){
		
	    $("a.getEvent").on("click", function(){
	    	var eventId = $(this).closest("div").attr("id").trim();
	    	
	    	self.location = "/event/getEventTicketList?eventId="+eventId;	    	
	    });
	    
	    $("a.startDelivery").on("click", function(){	    	
	    });
	    $("a.getReview").on("click", function(){	    	
	    });
	    $("a.endDelivery").on("click", function(){	    	
	    });
		
	    $("#file").change(function(){
	    	readURL(this);
	    	var form = $("form")[0];
	    	var formData = new FormData(form);
	    	$.ajax(
					{
						url : "/tran/rest/getDeliveryInfo/" ,
						processData: false,
	                    contentType: false,
						method : "POST" ,						
						data : formData ,
						beforeSend : function(){
				            $('#loading').html("<div class='spinner-border text-primary' role='status'>"+
				            "<span class='sr-only'>Loading...</span>"+
				            "</div>");
				        },
						success : function(data) {	
							$('#loading').html("");
							$('#deliveryNo').val(data);
						}							 
			});
	    });
	   
	});
		
	</script>		
    
</head>

<body>
	<jsp:include page="/layout/toolbar.jsp" />
	<div class="container">
	<br/>
		
		<div class="text-center">
		 <table class="table">
			  <thead class="thead-light">
			    <tr>
			      <th scope="col">#</th>
			      <th scope="col">����</th>
			      <th scope="col">�̺�Ʈ��</th>
			      <th scope="col">����</th>
			      <th scope="col">����/�Ǹ�����</th>
			      <th scope="col">�ŷ����</th>
			      <th scope="col">�������</th>
			      <th scope="col">-</th>
			    </tr>
			  </thead>
			  <tbody>
			  <c:forEach var="tran" items="${list}" varStatus="j">
			    <tr>
			      <th scope="row">${j.index+1}</th>
			      <td>
			      <c:if test="${user.userId==tran.seller.userId}">�Ǹ�</c:if>
			      <c:if test="${user.userId==tran.buyer.userId}">����</c:if>
			      </td>
			      <td>
			      <div id="${tran.event.eventId}">
			      <a class="getEvent" href="#">${tran.event.eventName}</a>
			      </div>
			      </td>
			      <td>${tran.orderAmount}</td>
			      <td>${tran.orderDate}</td>
			      <td>
			      <c:if test="${user.userId==tran.seller.userId}">${tran.buyer.userId}</c:if>
			      <c:if test="${user.userId==tran.buyer.userId}">${tran.seller.userId}</c:if>
			      </td>
			      <td class="text-secondary">
			      <c:if test="${tran.tranCode==0}">������ �Աݴ��</c:if>
			      <c:if test="${tran.tranCode==1}">�����Ϸ�</c:if>
			      <c:if test="${tran.tranCode==2}">��� ��</c:if>
			      <c:if test="${tran.tranCode==3}">��� �Ϸ�</c:if>
			      <c:if test="${tran.tranCode==4}">ȯ�� �� ���</c:if>
				  </td>
			      <td>
			      <c:if test="${user.userId==tran.seller.userId}">
				      <c:if test="${tran.tranCode==0}">-</c:if>
				      <c:if test="${tran.tranCode==1}"><a class="startDelivery" href="#" data-toggle="modal" data-target="#deliveryModal">��۽���</a></c:if>
				      <c:if test="${tran.tranCode==2}">-</c:if>
				      <c:if test="${tran.tranCode==3}"><a class="getReview" href="#">�ı� Ȯ��</a></c:if>
				      <c:if test="${tran.tranCode==4}">-</c:if>
			      </c:if>
			      <c:if test="${user.userId==tran.buyer.userId}">
				      <c:if test="${tran.tranCode==0}">-</c:if>
				      <c:if test="${tran.tranCode==1}">-</c:if>
				      <c:if test="${tran.tranCode==2}"><a class="endDelivery" href="#">��۵���</a></c:if>
				      <c:if test="${tran.tranCode==3}">-</c:if>
				      <c:if test="${tran.tranCode==4}">-</c:if>
			      </c:if>
			      </td>
			    </tr>
			  </c:forEach> 
			  </tbody>
		</table>
		 
		</div>
			
 	</div>
	
	<!-- ��������Է� ���â  -->
					<div class="modal fade" id="deliveryModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-md" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="modalCenterTitle">��������� ������ּ���.</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					      <form enctype="multipart/form-data">
					      	<div class="form-group" >
							     <br/>
							     <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��� �� : </strong> 	
							        <select name="deliveryCompany">
									    <option value="">����</option>
									    <option value="04">CJ�������</option>									    
									    <option value="01">��ü���ù�</option>
									    <option value="56">KGB�ù�</option>
									    <option value="05">�����ù�</option>
									    <option value="06">�����ù�</option>
									    <option value="08">�Ե��ù�</option>
									    <option value="46">CU�������ù�</option>
									    <option value="23">�浿�ù�</option>
									    <option value="53">�����ù�</option>
									</select><br/><br/>
							      <strong>����� ��ȣ : </strong><input type="text" id="deliveryNo" name="deliveryNo" value="" placeholder="(-) ���� �Է�" style="width: 300px !important"/>
							      <br/><br/>
							      <div class="text-center" id="loading"></div>
							      <br/><br/>
								  <div class="img_wrap">
									<img id="preview" />	
							      </div>
							      <strong>�̹����� ���</strong>
							      
							      <input type="file" class="form-control" id="file" name="file" value="" placeholder="file input...">
							</div>
					      </form>			      
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-primary">���</button>
					      </div>
					    </div>
					  </div>
					</div>
	
</body>

</html>