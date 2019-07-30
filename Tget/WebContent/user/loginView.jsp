<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/toolbar.css" />
	
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>	
	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"></script>

	<script src="/resources/javascript/common.js" ></script>
	<script src="/resources/javascript/alarm.js" ></script>
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/jquery.scrolly.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>

	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
    	 body >  div.container{ 
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

	$( function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button:contains('ID ã��')").on("click" , function() {
		
			self.location = "/user/finduserId"
		});
	});
	
	$( function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button:contains('��й�ȣ ã��')").on("click" , function() {
		
			self.location = "/user/findPassword"
		});
	});
	

	
	
	/* $(function(){
	    var naverLogin = new naver.LoginWithNaverId({
	        clientId: "AziWQOW7S2sZhD1PEBi9",
	        callbackUrl: "http://127.0.0.1:8080/user/callback.jsp",
	        isPopup: true,
	        loginButton: {color: "green", type: 3, height: 45}
	    });
	    naverLogin.init();
	})//e.o.naver
 */

	
		//============= "�α���"  Event ���� =============
		$( function() {
			
			$("#userId").focus();
			
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("button:contains('�α���')").on("click" , function() {
				
				//alert("������");
				
				var id=$("input:text").val();
				var pw=$("input:password").val();
				
				
				
				if(id == null || id.length <1) {
					alert('ID �� �Է����� �����̽��ϴ�.');
					$("#userId").focus();
					return;
				}
				
				if(pw == null || pw.length <1) {
					alert('�н����带 �Է����� �����̽��ϴ�.');
					$("#password").focus();
					return;
				}
				
				 $.ajax({ 
					   url: "/user/json/login",
				   data: { 
					   userId: $("#userId").val(), 
					   }, 
					   type: "post", 
					   dataType: "json",
				   success: function(JSONData){ 
					   console.log(JSONData);
					   
					   if (JSONData.msg == "no") {
							  alert("ID/password error");
							  return;
				  		 }else if (JSONData.msg == "true") { 
						
						  $('#black').modal('show');
						  
						// alert("�� �� ���̾�~");
						 $("#nickName").text(JSONData.nickName);
						 $("#startDate").text(JSONData.startDate);
						 $("#endDate").text(JSONData.endDate);
						 
					   } else if (JSONData.msg == "false")
					  		 { 
						   $("form").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
					  	 	
					  		 }
			
			
				   }
					   });
		});	
			});
		
		//============= ȸ��������ȭ���̵� =============
		$( function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
			
				self.location = "/user/addUser"
			});
		});
		
		$( function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[id='kakao' ]").on("click" , function() {
					
					var popOption = "left=500, top=100, width=600, height=600, resizable=no, location=no;"		
					window.open("https://kauth.kakao.com/oauth/authorize?client_id=8dbe371059a9972c710af6d3eb14767e&redirect_uri=http://192.168.0.82:8080/user/oauth&response_type=code","Kakao login",popOption);
					
					
			});
		});
	/* 	Kakao.init('f784da1696e287dff9fa08e5c44d8558');
	    // īī�� �α��� ��ư�� �����մϴ�.
	    Kakao.Auth.createLoginButton({
	      container: '#kakao-login-btn',
	      success: function(authObj) {
	        alert(JSON.stringify(authObj));
	      },
	      fail: function(err) {
	         alert(JSON.stringify(err));
	      }
	    }); */
		
		
	</script>		
	
</head>

<body>


<jsp:include page="/layout/tgetToolbar.jsp" />
	<!-- ToolBar Start /////////////////////////////////////-->
	
   	<!-- ToolBar End /////////////////////////////////////-->	
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
		<!--  row Start /////////////////////////////////////-->
		<div class="row">
		
		

			        <form class="form-horizontal">
		  
					  <div class="form-group">
					    <label for="userId" class="col-sm-4 control-label">ID(Email)</label>
					    <div class="col-sm-7">		    
							    <input type="text" class="form-control" name="userId" id="userId"  placeholder="���̵� �Է����ּ���.">
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="password" class="col-sm-4 control-label">PASSWORD</label>
					    <div class="col-sm-7">
					      <input type="password" class="form-control" name="password" id="password" placeholder="�н����带 �Է����ּ���." >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <div class="col-sm-offset-4 col-sm-6 text-center">
					      <button type="button" class="btn btn-default"  >�α���</button>
					      <button type="button" class="btn btn-default"  >ID ã��</button>
					      <button type="button" class="btn btn-default"  >��й�ȣ ã��</button>
					      <a class="btn btn-default" href="#" role="button">ȸ������</a>
					      <a id="kakao" href = "#2">
<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="200"/>
</a>
					    </div>
					  </div>
			
			
				
		 <div class="modal fade" id="black" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
				  <div class="modal-dialog modal-lg" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				       <h5 class="modal-title" id="modalCenterTitle"><p id="nickName"></p></h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				
					      </div>
					     
					      
					     <div class="form-group">
		    <label for="blacklistStartDate" class="col-sm-offset-1 col-sm-3 control-label">������Ʈ ��������</label>
		    <div class="col-sm-4">
		
		   <p id="startDate"></p>
		    </div>
		  </div>
		  
		  <div class="form-group">
		   <label for="blacklistEndDate" class="col-sm-offset-1 col-sm-3 control-label">������Ʈ ��������</label>
		    <div class="col-sm-4">
		     <p id="endDate"></p>
		    </div>
		  </div>
    		  <div class="modal-footer">	      
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Ȯ��</button>
	   	    	</div>


				   </div>
	  </div>
		 </div>  
		
	</form>
	 </div>
	  </div>
	  
	  
	  
	  <%
    String clientId = "AziWQOW7S2sZhD1PEBi9";//���ø����̼� Ŭ���̾�Ʈ ���̵�";
    String redirectURI = URLEncoder.encode("http://192.168.0.24:8080/user/callback.jsp", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
 %>		
			
				<div id="naverIdLogin" align="center">
     <a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>

        <img src="https://static.nid.naver.com/oauth/big_g.PNG" width="80%" height="45"/> 
   
</div>
	  
	  
	  
	  
	  
	  
	  
	  
	  <jsp:include page="/layout/footer.jsp" />
	  </body>
</html>		
			
				<!-- <div id="naverIdLogin" align="center">
    <a id="naver-login-btn" href="#" role="button">
        <img src="https://static.nid.naver.com/oauth/big_g.PNG" width="80%" height="45"/> 
    </a>
</div> -->

	
	<!-- ���̹����̵�ηα��� ��ư ���� ���� -->
	
			
				
			
			
			
					<!-- <a id="custom-login-btn" href="avascript:loginWithKakao()">
<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/>
</a> -->
<!-- <script type='text/javascript'>
  //<![CDATA[
    // ����� ���� JavaScript Ű�� ������ �ּ���.
    Kakao.init('f784da1696e287dff9fa08e5c44d8558');
    function loginWithKakao() {
      // �α��� â�� ���ϴ�.
      Kakao.Auth.login({
        success: function(authObj) {
          alert(JSON.stringify(authObj));
        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      });
    };
  //]]>
</script>
	 -->
			