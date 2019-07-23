 <%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<!-- Header -->
			<header id="header">
				<h1><a id="brand" href="#">T-GET <span>by MFC</span></a></h1>
				
				
					<a href="#">Home</a>
				<c:if test="${empty user}">
					<a href="#">Sign Up</a>
					<a href="#">Login</a>
				</c:if>
				<c:if test="${!empty user}">
					<a href="#">Logout</a>
					<a href="#" data-target="#alarmModal" data-toggle="modal">
							 Alarm &nbsp;<span class="badge badge-info" id="noReadAlarmCount"></span>
					</a>
				</c:if>				
				<a href="#menu">Menu</a>
									  
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li>
					      <div class="text-center"><strong><i class="fas fa-user-circle"></i>&nbsp;User</strong></div>
				          <a href="#">����������</a>
				          <a href="#">�����̺�Ʈ</a>
				          <a href="#">ȸ������</a>
				    </li>     																				
					
				</ul>
				<ul class="links">
					<li>
					      <div class="text-center"><strong><i class="fas fa-user-circle"></i>&nbsp;Event</strong></div>
				          <a href="#">�̺�Ʈ����</a>
				    </li>     																				
					
				</ul>
				<ul class="links">
					<li>
						 <div class="text-center"><strong><i class="fas fa-user-circle"></i>&nbsp;Ticket</strong></div>
				          <a href="#">�� �ǸŸ��</a>
				          <a href="#">�� �ŷ�����</a>
				          <a href="#">Ƽ�ϰ���</a>
					</li> 
				 </ul>
				 <ul class="links">
					<li>
						 <div class="text-center"><strong><i class="fas fa-user-circle"></i>&nbsp;RnP</strong></div>
				          <a href="#">�����ۼ�</a>
				          <a href="#">��������ȸ</a>
				          <a href="#">��������ȸ</a>
				          <a href="#">����Ʈ������ȸ</a>
					</li> 
				 </ul>
				 <ul class="links">
					<li>
						 <div class="text-center"><strong><i class="fas fa-user-circle"></i>&nbsp;Coupon</strong></div>
				          <a href="#">�������</a>
				          <a href="#">��������ȸ</a>
					</li> 
				 </ul>
			</nav>

<!-- �˸����� ���â  -->
					<div class="modal fade" id="alarmModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h3 class="modal-title" id="modalCenterTitle"><span class="text-secondary">My Alarm</span></h3>
					        <a href="#" class="close" data-dismiss="modal">
					          &times;
					        </a>
					      </div>
					      <div class="modal-body">
					      </div>
					      <div class="modal-footer">
					        </div>
					    </div>
					  </div>
					</div>
		
