<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <title>Map service</title>
    <style type="text/css">
        html, body {
          height: 100%;
          margin: 0;
          padding: 0;
        }
 
        #map-canvas, #map_canvas {
          height: 100%;
        }
 
        @media print {
          html, body {
            height: auto;
          }
 
          #map_canvas {
            height: 650px;
          }
        }
 
        #panel {
          position: absolute;
          top: -20px;
          left: 50%;
          margin-left: -180px;
          z-index: 5;
          background-color: #fff;
          padding: 5px;
          border: 1px solid #999;
        }
        /* 	게시글 등록 Modal */
		.modal-dialog.modal-80size {
		  width: 300%;
		  height: 100%;
		  margin: 0;
		  padding: 0;
		}
		
		.modal-content.modal-80size {
		  color: black;
		  background-color: #D9E5FF;
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
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyA_L7YCMev735YseqFdkMfkmFz49H-a7To" ></script> 
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    
    <script>
    var directionsDisplay;
    var directionsService = new google.maps.DirectionsService();
    var map;
 
    function initialize() {
      
    directionsDisplay = new google.maps.DirectionsRenderer();
      var seoul = new google.maps.LatLng(37.498036, 127.027578);
      
      var mapOptions = {
        zoom:14,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        center: seoul
      }
      
      map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
      directionsDisplay.setMap(map);
      
    }
 
    function calcRoute() {
      var start = document.getElementById('start').value;
      var end = document.getElementById('end').value;
      var mode = document.getElementById('mode').value;
 
      var request = {
          origin:start,
          destination:end,
          travelMode: eval("google.maps.DirectionsTravelMode."+mode)
          
      };
      directionsService.route(request, function(response, status) {
    	//alert(status);  
        if (status == google.maps.DirectionsStatus.OK) {
            directionsDisplay.setDirections(response);
        }
      });
    }
 
    google.maps.event.addDomListener(window, 'load', initialize);
 
    </script>
    </head>
    <body>
  	
		<div style="display:none">
                <select id="mode">
                <option value="TRANSIT">대중 교통 정보</option>
                </select>
            </div>
            <br/>
        <div class="input-group" style="padding-bottom:20px">		    
							    
							    <span><font size="2">&ensp;<strong>기존 주소 : </strong></font></span>
							    <input type="text" id="start" class="form-control" width="100%" value="${user.address}">
							    
							    <span><font size="2">&ensp;<strong>공연장/경기장 찾기 :  </strong></font></span>
							   <select class="btn btn-outline-dark custom-select" id="end" name="end" style="width:150px;">
								<option selected>목적지 선택</option>
			    					<c:forEach var="location" items="${list}"><!-- 리스트에 담긴 것을 location에 저장하고 출력 -->
			    				<option value="${location}">${location}</option>
			    				</c:forEach>
			    	   			</select>
			    	   			
<!-- 							   <select id="end" class="form-control"> -->
<%-- 							   		<c:forEach var="location" items="${list}"><!-- 리스트에 담긴 것을 location에 저장하고 출력 --> --%>
<%-- 							   		<option value="${location}">${location}</option> --%>
<%-- 							   		</c:forEach> --%>
<!-- 							   	</select> -->
							   	
							    	<input type="button" class="btn btn-info" value="검색" onclick="Javascript:calcRoute();" >							
						     </div>
        <div id="map-canvas"></div>
      
    </body>
</html>