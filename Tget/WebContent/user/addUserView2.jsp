<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 凧繕 : http://getbootstrap.com/css/   凧繕 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta http-equiv="X-UA-Compatible" content="ie=edge" />
	
 
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
		<script src="/resources/javascript/common.js" ></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

	 $(function() {
			
			$("button:contains('亜 脊')").on("click" , function() {
				alert("神森");
			/* fncAddUser() */
			
			});
		});	 
	  /* $(function() {
			//==> DOM Object GET 3亜走 号狛 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a:contains('昼 社')").on("click" , function() {
				
			});
		});	  */
	  
		 /*  function fncAddUser() {
			
			var id=$("input[name='userId']").val();
			var pw=$("input[name='password']").val();
			var pw_confirm=$("input[name='password2']").val();
			var name=$("input[name='userName']").val();
			
			
			if(id == null || id.length <1){
				alert("焼戚巨澗 鋼球獣 脊径馬偲醤 杯艦陥.");
				return;
			}
			if(pw == null || pw.length <1){
				alert("鳶什趨球澗  鋼球獣 脊径馬偲醤 杯艦陥.");
				return;
			}
			if(pw_confirm == null || pw_confirm.length <1){
				alert("鳶什趨球 溌昔精  鋼球獣 脊径馬偲醤 杯艦陥.");
				return;
			}
			if(name == null || name.length <1){
				alert("戚硯精  鋼球獣 脊径馬偲醤 杯艦陥.");
				return;
			}
			
			if( pw != pw_confirm ) {				
				alert("搾腔腰硲 溌昔戚 析帖馬走 省柔艦陥.");
				$("input:text[name='password2']").focus();
				return;
			}  */
				 
	
	/*
		 $(function() {
	
		$("button:contains('爽社達奄')").on("click" ,function(){
		    
	     	new daum.Postcode({
	            oncomplete: function(data) {
	                var addr = '';

	                if (data.userSelectedType === 'R') {
	                    addr = data.roadAddress;
	                } else { 
	                    addr = data.jibunAddress;
	                }				
	               
	                $("#addr").val(addr);
	            }
	        }).open(); 
	 	
	 		});
		});
	 */
		


	/*  $(function() {
	
	$('#nickNameCheck').on('click' ,function(){
		 
		alert("岨 彊虞ばば");
		
		 var query = {nickName : $("#nickName").val()};
		 
		 $.ajax({
		  url : "/user/nickNameCheck",
		  type : "post",
		  data : query,
		  success : function(data) {
		  
		   if(data == 1) {
		    $(".result .msg").text("紫遂 災亜");
		    $(".result .msg").attr("style", "color:#f00");    
		   } else {
		    $(".result .msg").text("紫遂 亜管");
		    $(".result .msg").attr("style", "color:#00f");
		   }
		  }
		 });  // ajax 魁
		});

	
	
	
	
	function emailcheck(email1, email2){
	    // 政反失 伊紫
		if(!insertform.email1.value || !insertform.email2.value){ 
			alert(emailerror);
			insertform.email1.focus();
			return;
		}else{
			if(insertform.email1.value){
				if(insertform.email2.value==0){
					// 送羨脊径
					if(insertform.email1.value.indexOf("@")==-1){
						alert(emailerror);
						insertform.email1.focus();
						return false;
					}
				}else{
					// 識澱脊径
					if(insertform.email1.value.indexOf("@")!=-1){
						alert(emailerror);
						insertform.email1.focus();
						return false;
					}
				}
			}
		} */
	/*     // 昔装聖 是背 歯但生稽 戚疑
		var url="email.jsp?email1="+email1+"&email2="+email2;
	    
		open(url,"emailwindow", "statusbar=no, scrollbar=no, menubar=no, 
                width=400, height=200" );


 */





	
	
/* 		function check() {
			var form = document.authenform;
			var authNum = ${authNum};
			
			if(!form.authnum.value){
				alert("昔装腰硲研 脊径");
				return false;
			}
			if(form.authnum.value!=authNum){
				alert("堂携嬢 陥獣潤");
				form.authnum.value="";
				return false;
			}
			if(form.authnum.value==authNum){
				alert("疏焼")
				opener.document.userinput.mailCheck.value="刃戟";
				self.close();
			}
		} */
			
	

/* } */
	
		
		//============= "亜脊"  Event 尻衣 =============
/* 		 $(function() {
			//==> DOM Object GET 3亜走 号狛 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#btn1").click(function() {
				 fncAddUser(); 
				
				alert("岨 彊虞ばば");
				
			});
		});	 
		
		
		//============= "昼社"  Event 坦軒 貢  尻衣 =============
		$(function() {
			//==> DOM Object GET 3亜走 号狛 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				alert("岨 彊虞ばば");
			
				$("form")[0].reset();
			});
		});	
	
	
		
		function fncAddUser() {
			
			var id=$("input[name='userId']").val();
			var pw=$("input[name='password']").val();
			var pw_confirm=$("input[name='password2']").val();
			var name=$("input[name='userName']").val();
			
			
			if(id == null || id.length <1){
				alert("焼戚巨澗 鋼球獣 脊径馬偲醤 杯艦陥.");
				return;
			}
			if(pw == null || pw.length <1){
				alert("鳶什趨球澗  鋼球獣 脊径馬偲醤 杯艦陥.");
				return;
			}
			if(pw_confirm == null || pw_confirm.length <1){
				alert("鳶什趨球 溌昔精  鋼球獣 脊径馬偲醤 杯艦陥.");
				return;
			}
			if(name == null || name.length <1){
				alert("戚硯精  鋼球獣 脊径馬偲醤 杯艦陥.");
				return;
			}
			
			if( pw != pw_confirm ) {				
				alert("搾腔腰硲 溌昔戚 析帖馬走 省柔艦陥.");
				$("input:text[name='password2']").focus();
				return;
			}
				 */
			/* var value = "";	
			if( $("input:text[name='phone2']").val() != ""  &&  $("input:text[name='phone3']").val() != "") {
				var value = $("option:selected").val() + "-" 
									+ $("input[name='phone2']").val() + "-" 
									+ $("input[name='phone3']").val();
			}

			$("input:hidden[name='phone']").val( value ); 
			
			$("form").attr("method" , "POST").attr("action" , "/user/addUser").submit();
		}
		*/

		//==>"戚五析" 政反失Check  Event 坦軒 貢 尻衣
		 $(function() {
			 
			 $("input[name='email']").on("change" , function() {
				
				 var email=$("input[name='email']").val();
			    
				 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
			    	alert("戚五析 莫縦戚 焼鑑艦陥.");
			     }
			});
			 
		});	
		
		
	   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	   //==> 爽肯腰硲 政反失 check 澗 戚背舛亀稽....
		function checkSsn() {
			var ssn1, ssn2; 
			var nByear, nTyear; 
			var today; 
	
			ssn = document.detailForm.ssn.value;
			// 政反廃 爽肯腰硲 莫縦昔 井酔幻 蟹戚 域至 遭楳, PortalJuminCheck 敗呪澗 CommonScript.js 税 因搭 爽肯腰硲 端滴 敗呪績 
			if(!PortalJuminCheck(ssn)) {
				alert("設公吉 爽肯腰硲脊艦陥.");
				return false;
			}
		}
	
		function PortalJuminCheck(fieldValue){
		    var pattern = /^([0-9]{6})-?([0-9]{7})$/; 
			var num = fieldValue;
		    if (!pattern.test(num)) return false; 
		    num = RegExp.$1 + RegExp.$2;
	
			var sum = 0;
			var last = num.charCodeAt(12) - 0x30;
			var bases = "234567892345";
			for (var i=0; i<12; i++) {
				if (isNaN(num.substring(i,i+1))) return false;
				sum += (num.charCodeAt(i) - 0x30) * (bases.charCodeAt(i) - 0x30);
			}
			var mod = sum % 11;
			return ((11 - mod) % 10 == last) ? true : false;
		}
		 ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
		 
		//==>"ID掻差溌昔" Event 坦軒 貢 尻衣
		 $(function() {
			//==> DOM Object GET 3亜走 号狛 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $("button.btn.btn-info").on("click" , function() {
				popWin 
				= window.open("/user/checkDuplication.jsp",
											"popWin", 
											"left=300,top=200,width=780,height=130,marginwidth=0,marginheight=0,"+
											"scrollbars=no,scrolling=no,menubar=no,resizable=no");
			});
		});	

	</script>		
    
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  鉢檎姥失 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">噺 据 亜 脊</h1>
		
	

<!-- <script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			url : "captcha.jsp",
			dataType:"json",
			success : function(data) {
				console.log(data.key);
				$("#key").val(data.key);
				$("#div01").html("<img src='captchaImage/"+data.captchaImageName+"'>");
				

			}
		});
		$("#btn01").on("click",function(){
			alert("asd");
			var form01Data = $("#form01").serialize();
			console.log(form01Data);
			$.ajax({
				url : "captcha.jsp",
				data : form01Data,
				dataType:"json",
				success : function(data) {
				}
			});
		});
	});
</script>
		
		
		<div id="div01">
	</div>
	<form id="form01">
		
		<input type="hidden" id="key" name="key">
		<input type="text" name="value">
		<button type="button" id="btn01">Go</button>
	</form> -->
		
		<!-- form Start /////////////////////////////////////-->
		<form role="form" method="post" autocomplete="off">
			<p>
		    <label for="nickName" >莞 革 績</label>
		      <input type="text" id="nickName" name="nickName"/>
		      <button type="submit" id ="nickNameCheck" class="nickNameCheck">莞革績溌昔</button>
		  	</p>
		  	
			<p class="result">	
			<span class="msg">莞革績聖 溌昔背爽室推</span>
		</p>
		</form>
		
		<input type="text" name="phone" id="phone" 
  placeholder="閤澗 紫寓 腰硲" />
   <button onclick="sendSms();">穿勺</button>
    <br />
     <br /> 
   <input type="text" name="sms" id="sms" 
   placeholder="昔装 腰硲 脊径" /> 
   <button onclick="phoneCheck();">昔装</button> 
		  
		  
		  
	<script type="text/javascript">
	
	function sendSms(){ 
		  
		alert("昔装腰硲 穿勺."); 
		   <%-- <%=request.getContextPath()%>/user//sendSms --%>
		   $.ajax({ 
			   url: "/user/sendSms",
			   data: { 
				   receiver: $("#phone").val() 
				   }, 
				   type: "post", 
				
	   success: function(result) { 
		
		   if (result == "true") { 
			   console.log(result);
			   }  else { 
				   alert("昔装腰硲 穿勺 叔鳶");
				   } 
		   }
			 });
		   }
	   function phoneCheck() {
			alert("昔装腰硲 しせし."); 
		   $.ajax({ 
			   url: "/user/smsCheck",
		   data: { 
			   code: $("#sms").val() 
			   }, 
			   type: "post", 
		   success: function(result){ 
			   if (result == "ok") { 
		   
			   alert("腰硲 昔装 失因"); 
		   } else { 
			   alert("腰硲 昔装 叔鳶"); 
		  	 	} 
		 	  } 
		   }); 
	   };
	 
	/* 	   $(function() {
				//==> DOM Object GET 3亜走 号狛 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$("button:contains('亜 脊')").on("click" , function() {
					alert("神森");
					fncAddUser()
				});
			});	 
		  $(function() {
				//==> DOM Object GET 3亜走 号狛 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$("a:contains('昼 社')").on("click" , function() {
					
				});
			});	 
		  
			 function fncAddUser() {
				
				var id=$("input[name='userId']").val();
				var pw=$("input[name='password']").val();
				var pw_confirm=$("input[name='password2']").val();
				var name=$("input[name='userName']").val();
				
				
				if(id == null || id.length <1){
					alert("焼戚巨澗 鋼球獣 脊径馬偲醤 杯艦陥.");
					return;
				}
				if(pw == null || pw.length <1){
					alert("鳶什趨球澗  鋼球獣 脊径馬偲醤 杯艦陥.");
					return;
				}
				if(pw_confirm == null || pw_confirm.length <1){
					alert("鳶什趨球 溌昔精  鋼球獣 脊径馬偲醤 杯艦陥.");
					return;
				}
				if(name == null || name.length <1){
					alert("戚硯精  鋼球獣 脊径馬偲醤 杯艦陥.");
					return;
				}
				
				if( pw != pw_confirm ) {				
					alert("搾腔腰硲 溌昔戚 析帖馬走 省柔艦陥.");
					$("input:text[name='password2']").focus();
					return;
				} 
					  */
				/* var value = "";	
				if( $("input:text[name='phone2']").val() != ""  &&  $("input:text[name='phone3']").val() != "") {
					var value = $("option:selected").val() + "-" 
										+ $("input[name='phone2']").val() + "-" 
										+ $("input[name='phone3']").val();
				}

				$("input:hidden[name='phone']").val( value ); */
		/* 		
			 	$("form").attr("method" , "POST").attr("action" , "/user/addUser").submit();
			}
		   
		}); */
		  
		  
	</script>
		  
		  <form class="form-horizontal">
		  
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">焼戚巨</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" placeholder="焼戚巨">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">搾腔腰硲</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="搾腔腰硲">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">搾腔腰硲 溌昔</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="搾腔腰硲 溌昔">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">戚硯</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userName" name="userName" placeholder="噺据戚硯">
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">爽社</label>
		    <div class="col-sm-4">
		    
		      <input type="text" class="form-control" id="addr" name="addr" value="" >
		      <button type="button" class="btn btn-link">爽社達奄</button>
		    </div>
		    
		      </div>
		  
		  	  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">淫宿朝砺壱軒</label>
		    <div class="col-sm-4">
		     <input type="checkbox" name="chbox" value="K-POP"> K-POP
			<input type="checkbox" name="chbox" value="rap"> 窪/琵杯
			<input type="checkbox" name="chbox" value="balad">降虞球<br><br>
		    </div>
		  </div>
 
		  <!-- <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">妃企穿鉢腰硲</label>
		     <div class="col-sm-2">
		      <select class="form-control" name="phone1" id="phone1">
				  	<option value="010" >010</option>
					<option value="011" >011</option>
					<option value="016" >016</option>
					<option value="018" >018</option>
					<option value="019" >019</option>
				</select>
		    </div>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" id="phone2" name="phone2" placeholder="腰硲">
		    </div>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" id="phone3" name="phone3" placeholder="腰硲">
		    </div>
		    <input type="hidden" name="phone"  />
		  </div> -->
		  
		   <!-- <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">戚五析</label>
		    <div class="col-sm-4">
		      <td>
	    <input type="text" name="email1" maxlength="15">
		 <select name="email2">
		      <option value="0">鯵降掻..</option>
		      <option value="naver.com">naver.com</option>
		      <option value="daum.net">daum.net</option>
		      <option value="nate.com">nate.com</option>
		      <option value="gmail.com">gmail.com</option>
		  </select>
		<input type="button" name="emailconfirm_btn" value="昔装" 
         onclick="emailcheck(insertform.email1.value,insertform.email2.value)">
	</td>
		    </div>
		  </div> -->
	

		  
		  <!-- <br/><br/>
		  <h5>昔装腰硲 7切軒研 脊径馬室推</h5>
		  
		  <div class="container">
		  <form method="post" name="authenform" ouSubmit="return check();">
		  	<input type="text" name="authnum"><br/><br/>
		  	<input type="submit" class="btn btn-info" value="Submit">
		  	</form>
		  </div> -->
	
		
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary">亜 脊</button>
			  <a class="btn btn-primary btn" href="#" role="button">昼 社</a>
			 
			  
		    </div>
 			 </div>
		  
		  
		
		</form>
		
 	</div>
	
</body>

</html>