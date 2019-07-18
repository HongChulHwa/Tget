<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!doctype html>
<html lang="ko">
  <head>
    <meta charset="EUC-KR">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>T-GET</title>
    <!-- jquery ui -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/blog/">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Cute+Font|Gurajada|Jua|Nanum+Brush+Script|Nanum+Pen+Script|Shadows+Into+Light|Sunflower:300&display=swap&subset=korean" rel="stylesheet">
	<!-- Ÿ��Ʋ�� �۾� -->
	<link href="https://fonts.googleapis.com/css?family=Acme|Bungee+Shade|Fredericka+the+Great&display=swap" rel="stylesheet">
	
	
<!-- 	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> -->
<!-- 	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
<!-- 	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> -->
	
	<script type="text/javascript">
	var recommSize = "";
	var eventNameArr = [];
	var videoNameArr = [];
	var recommEventNameArr = [];
	var recommEventDetailArr = [];
	$(function(){
		
		$.ajax(
				{
					url : "/event/rest/getRecommendedEventList",
					method : "POST",
					dataType : "json",
					success : function(JSONData, status){
// 							alert(status);
							recommSize = JSONData.recommEventlistSize;
							$.each(JSONData.eventNameList, function(index,value){
								$("#goRecommEvent"+index).val(value);
							 });
							$.each(JSONData.videoNameList, function(index,value){
								$("#videoName"+index).attr("src","/resources/video/"+value);
							 });
							$.each(JSONData.recommEventNameList, function(index,value){
								$("#nav-"+index+"-tab").text(value).attr( "style","display:block;");
// 								alert(value);
							 });
							$.each(JSONData.recommEventDetailList, function(index,value){
								$("#recommDetail"+index).text(value);
							 });
// 						$("form").attr("method" , "POST").attr("action" , "/event/getEventList").submit();
					}
		});
		
		$("input[type='text']").on("keyup",function(){
			$("#searchKeyword").val($("input[type='text']").val());
		});
		
		$("a:contains('�˻�')").on("click",function(){
			$("#searchCondition").val("1");
			$("form").attr("method" , "POST").attr("action" , "/event/getEventList").submit();
		});
		
		$(".p-2").on("click",function(){
// 			alert($(this).text());
			$("#searchCondition").val("0");
			 $.ajax(
						{
							url : "/event/rest/getCategory",
							method : "POST",
							data : {
								categoryTwoName : $(this).text()
										},
							dataType : "json",
							success : function(JSONData, status){
// 								alert(status);
								$("#searchKeyword").val(JSONData.categoryTwoEng);
								$("form").attr("method" , "POST").attr("action" , "/event/getEventList").submit();
							}
				});
		});	
		
		
		$("button:contains('�̺�Ʈ�ٷΰ���')").on("click",function(){
			$("form").attr("method" , "POST").attr("action" , "/event/getEvent?category=&eventName="+$(this).val()).submit();
		});
		
	});	
	
	</script>
	
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }
     
	@media screen and (min-width:600px) {
		  video {
		    width: 500px;
		  }
		}
	@media screen and (max-width:500px) {
		 	video {
		    width: 400px;
		  }
		}
      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      .col-4{
      	font-family: 'Acme', sans-serif; 
      	font-size: 50px;
      }
     .p-2{
     	font-family: 'Nanum Pen Script', cursive; 
     	font-size: 30px;
     }
     .display-4{
     	font-family: 'Nanum Pen Script', cursive; 
     	font-size: 60px;
     }
     
     .button_black{
			border:1px solid #616261; -webkit-border-radius: 3px; -moz-border-radius: 3px;border-radius: 3px;
			font-size:20px;font-family: 'Nanum Pen Script', cursive; padding: 0px 15px 0px 15px; 
			/* text-decoration:none; display:inline-block;text-shadow: -1px -1px 0 rgba(0,0,0,0.3);font-weight:bold; color: #FFFFFF; */
			 border-radius: 3px; color: white;
			 font-size:25px;font-family: 'Nanum Pen Script', cursive; 
/* 			 text-decoration:none; text-shadow: -1px -1px 0 rgba(0,0,0,0.3);font-weight:bold; color: #FFFFFF; */
			 background-color: #7d7e7d; background-image: -webkit-gradient(linear, left top, left bottom, from(#7d7e7d), to(#0e0e0e));
			 background-image: -webkit-linear-gradient(top, #7d7e7d, #0e0e0e);
			 background-image: -moz-linear-gradient(top, #7d7e7d, #0e0e0e);
			 background-image: -ms-linear-gradient(top, #7d7e7d, #0e0e0e);
			 background-image: -o-linear-gradient(top, #7d7e7d, #0e0e0e);
			 background-image: linear-gradient(to bottom, #7d7e7d, #0e0e0e);
			 filter:progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr=#7d7e7d, endColorstr=#0e0e0e);
		}
			
		.button_black:hover{
			 border:1px solid #4a4b4a;
			 background-color: #646464; background-image: -webkit-gradient(linear, left top, left bottom, from(#646464), to(#282828));
			 background-image: -webkit-linear-gradient(top, #646464, #282828);
			 background-image: -moz-linear-gradient(top, #646464, #282828);
			 background-image: -ms-linear-gradient(top, #646464, #282828);
			 background-image: -o-linear-gradient(top, #646464, #282828);
			 background-image: linear-gradient(to bottom, #646464, #282828);filter:progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr=#646464, endColorstr=#282828);
		}
		
		#recommDetail0, #recommDetail1, #recommDetail2{
			padding: 20px 20px 20px 20px ;
			height: 240px;
		}
    </style>
  </head>
  <body>
  <form>
  <jsp:include page="/layout/toolbar.jsp" />
  
    <input type="hidden" id="requestPageToken" name="requestPageToken" value="${requestPageToken }"/>
	<input type="hidden" id="searchCondition" name="searchCondition" 
	placeholder="searchCondition" value="${!empty search.searchCondition? search.searchCondition : ''}"/>
	<input type="hidden"  id="searchKeyword" name="searchKeyword"  
	placeholder="searchKeyword" value="${!empty search.searchKeyword? search.searchKeyword : ''}" >
	
	
  <div class="container">
<!--   <header class="blog-header py-3"> -->
<!--     <div class="row flex-nowrap justify-content-between align-items-center"> -->
<!--       <div class="col-4 pt-1">         -->
<!--       </div> -->
<!--       <div class="col-4 text-center"> -->
<!--         <h1>T-GET</h1> -->
<!--       </div> -->
<!--       <div class="col-4 d-flex justify-content-end align-items-center">         -->
<!--       </div> -->
<!--     </div> -->
<!--   </header> -->

  <div class="nav-scroller py-1 mb-2">
    <nav class="nav d-flex justify-content-between">
      <a href="#" class="p-2 text-muted"  >�ܼ�Ʈ</a>
      <a href="#" class="p-2 text-muted" >�佺Ƽ��</a>
      <a href="#" class="p-2 text-muted"  >������</a>
      <a href="#" class="p-2 text-muted"  >Ŭ����/�����</a>
      <a href="#" class="p-2 text-muted"  >�౸</a>
      <a href="#" class="p-2 text-muted"  >�߱�</a>
      <a href="#" class="p-2 text-muted"  >����</a>
    </nav>
  </div>

  <div class="jumbotron p-4 p-md-5 text-white rounded bg-dark">
  <div>
      <h1 class="display-4 font-italic text-center"><small>Ƽ�� �Ǹſ� ���Ŵ� ? </small>T-GET !</h1>
      <br/>
      <br/>
      <div class="row">
	      <div class="col-sm">
	      </div>
	      <div class="col-sm-8">
	      <div class="input-group">		    
		    <input type="text" class="form-control"  placeholder="�̺�Ʈ/��Ƽ��Ʈ/��">
		    <div class="input-group-append">
		    	<a class="input-group-text" href="#">�˻�</a>
		    </div>
		  </div>
		  <small class="form-text">�Ǹ� �� �����ϰ� ���� �̺�Ʈ�� �˻� �غ�����.</small>		
	      </div>
	      <div class="col-sm">
	      </div>      		
    	</div>
  </div>
</div>


<main role="main" class="container">
  <div class="row">
 
    <div class="col-md-8 col-12  col-sm-12">
      <h3 class="pb-4 mb-4 border-bottom" style="font-weight:bold;">
        ��õ �̺�Ʈ
      </h3>
      <div class="container">
		  <div class="nav nav-tabs" id="nav-tab" role="tablist">
		  	<a class="nav-item nav-link active" id="nav-0-tab" data-toggle="tab" 
		    href="#nav-0" role="tab" aria-controls="nav-0" aria-selected="true"></a>		    
		    <a class="nav-item nav-link" id="nav-1-tab" data-toggle="tab" 
		    href="#nav-1" role="tab" aria-controls="nav-1" aria-selected="true" style="display:none;"></a>		    
		    <a class="nav-item nav-link" id="nav-2-tab" data-toggle="tab" 
		    href="#nav-2" role="tab" aria-controls="nav-2" aria-selected="false"  style="display:none;" ></a>		 
		  </div>
		<div class="tab-content" id="nav-tabContent">
		  <div class="tab-pane fade show active" id="nav-0" role="tabpanel" aria-labelledby="nav-0-tab">
		  		<div class="row" ></div>      	
			    <div class="row" id="recommEventList" >
			      <div class="col-12 col-sm-12 col-md-9 col-lg-9 ">
				    <video autoplay="autoplay" id="videoName0"  src="/resources/video/videoplayback.mp4"  type="video/mp4" >
<!-- 						<source src="/resources/video/videoplayback.mp4" type="video/mp4"> -->
					</video>
				  </div>
				  <div  class="col-12 col-sm-12 col-md-3 col-lg-3">
<!-- 					<div class="row" id="recommName0"></div> -->
					<div class="row" id="recommDetail0"></div>
					<div class="row">&nbsp;&nbsp;&nbsp;<button class="button_black" id="goRecommEvent0">�̺�Ʈ�ٷΰ���</button></div>
				  </div>
			    </div>			    
		  </div>
		  <div class="tab-pane fade" id="nav-1" role="tabpanel" aria-labelledby="nav-1-tab">
		  	<div class="row" ></div>      	
			    <div class="row" id="recommEventList" >
			      <div class="col-12 col-sm-12 col-md-9 col-lg-9 ">
				    <video autoplay="autoplay" id="videoName1"  src="/resources/video/videoplayback.mp4"  type="video/mp4" >
<!-- 						<source src="/resources/video/" type="video/mp4"> -->
					</video>
				  </div>
				  <div  class="col-12 col-sm-12 col-md-3 col-lg-3">
<!-- 					<div class="row" id="recommName1"></div> -->
					<div class="row" id="recommDetail1"></div>
					<div class="row">&nbsp;&nbsp;&nbsp;<button class="button_black" id="goRecommEvent1">�̺�Ʈ�ٷΰ���</button></div>
				  </div>
			    </div>			    
		  </div>
		  <div class="tab-pane fade" id="nav-2" role="tabpanel" aria-labelledby="nav-2-tab">
		  	<div class="row" ></div>      	
			    <div class="row" id="recommEventList" >
			      <div class="col-12 col-sm-12 col-md-9 col-lg-9 ">
				    <video autoplay="autoplay" id="videoName2"  src="/resources/video/videoplayback.mp4"  type="video/mp4">
<!-- 						<source src="/resources/video/videoplayback.mp4" type="video/mp4"> -->
					</video>
				  </div>
				  <div  class="col-12 col-sm-12 col-md-3 col-lg-3">
<!-- 					<div class="row" id="recommName2"></div> -->
					<div class="row" id="recommDetail2"></div>
					<div class="row">&nbsp;&nbsp;&nbsp;<button class="button_black" id="goRecommEvent2">�̺�Ʈ�ٷΰ���</button></div>
				  </div>
			    </div>			    
		  </div>
		</div>	    
	  </div><!-- container -->
    </div>

    <aside class="col-12  col-sm-12 col-md-4 blog-sidebar"  align="center">

      <div class="p-4 ">
        <h4 class="font-italic">Community</h4>
        <ol class="list-unstyled mb-0"  align="left">
          <li><a href="#">��ũ1111</a></li>
          <li><a href="#">��ũ</a></li>
          <li><a href="#">��ũ3333</a></li>
          <li><a href="#">��ũ</a></li>
          <li><a href="#">��ũ</a></li>
          <li><a href="#">��ũ</a></li>
        </ol>
      </div>

      <div class="p-4 ">
        <h4 class="font-italic">Notice</h4>
        <ol class="list-unstyled" align="left">
          <li><a href="#">��ũ</a></li>
          <li><a href="#">��ũ</a></li>
          <li><a href="#">��ũ</a></li>
        </ol>
      </div>
    </aside><!-- /.blog-sidebar -->

  </div><!-- /.row -->

</main><!-- /.container -->



	<h3 class="pb-4 mb-4 text-center border-bottom">
        �α� �̺�Ʈ
    </h3>
  <div class="row mb-2">
    <div class="col-md-6">
      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <strong class="d-inline-block mb-2 text-primary">���ǰ���</strong>
          <h3 class="mb-0">EXO Seoul</h3>
          <div class="mb-1 text-muted">2019-07-27</div>
          <p class="card-text mb-auto">��õ��õ��õ��õ��õ��õ��õ��õ��õ��õ</p>
          <a href="#" class="">�󼼺���</a>
        </div>
        <div class="col-auto d-none d-lg-block">
          <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail">
          <title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
        </div>
      </div>
    </div>
    
    <div class="col-md-6">
      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <strong class="d-inline-block mb-2 text-primary">���ǰ���</strong>
          <h3 class="mb-0">EXO Seoul</h3>
          <div class="mb-1 text-muted">2019-07-27</div>
          <p class="card-text mb-auto">��õ��õ��õ��õ��õ��õ��õ��õ��õ��õ</p>
          <a href="#" class="">�󼼺���</a>
        </div>
        <div class="col-auto d-none d-lg-block">
          <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail">
          <title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
        </div>
      </div>
    </div>
</div>



<footer class="blog-footer">
  <p class="text-center">
    <a href="#">Back to top</a>
  </p>
</footer>
</form>
</body>
</html>
