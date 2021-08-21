<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>자전거 테이블과 자전거 위치</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=wre5st6fx0"></script>
</head>
<body>
	<section class="section">
		<div class="container">
			<div id="bikeTable" class="row">
				<table class="table table-striped">
				</table>	
			</div>
			<div class="department-img">
				<div class="border rounded" id="map" style="width:100%; height:800px;">
				</div>
			</div>
		</div>	
	</section>
<script>
// 변수 초기화
let now;

//지도 생성 시에 옵션을 지정할 수 있습니다.
var map = new naver.maps.Map('map', {
        center: new naver.maps.LatLng(37.3595704, 127.105399), //지도의 초기 중심 좌표
        zoom: 10, //지도의 초기 줌 레벨
        minZoom: 7, //지도의 최소 줌 레벨
        disableKineticPan: false, //관성여부
        tileTransition: true,
        zoomControl: true, //줌 컨트롤의 표시 여부
        zoomControlOptions: { //줌 컨트롤의 옵션
            position: naver.maps.Position.TOP_RIGHT
        }
    });


//setOptions 메서드를 이용해 옵션을 조정할 수도 있습니다.
map.setOptions("mapTypeControl", true); //지도 유형 컨트롤의 표시 여부


function onSuccessGeolocation(position) {
    var location = new naver.maps.LatLng(position.coords.latitude,
                                         position.coords.longitude);

    map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
    map.setZoom(16); // 지도의 줌 레벨을 변경합니다.
	
    // 나의 위치에 마커가 생긴다.
    var marker = new naver.maps.Marker({
        position: new naver.maps.LatLng(position.coords.latitude,
        								position.coords.longitude),
        map: map,
        title: "내 위치",
        icon: {
            url: "https://img.icons8.com/ultraviolet/40/000000/marker.png", //50, 68 크기의 원본 이미지
            origin: new naver.maps.Point(0, 0)
        }
    });
	
    // 현재위치를 마커에서의 위치로 초기화
    now = marker.getPosition();
   	console.log(now._lat, now._lng);
    
   	$.ajax({
    	url: "ShowBikeListServlet",
		type:'post',
		dataType:'json',
		success: function(result) {
			drawTableReady(result);
			getBikePosition(result);
		},
		error: function(e) {
			console.error(e);
		}
    })
   	
}

// 테이블 그리기 준비 함수
function drawTableReady(result) {
	console.log("테이블 그리기");
	// 테이블 그려보자
	// 일단 헤더
	let realThead = $('<thead />');
	let thead = $('<tr />');
	// 일련번호, 사용가능 여부, 위치, 주차된 곳
	let th1 = $('<th />').text('일련번호');
	let th2 = $('<th />').text('사용가능 여부');
	let th3 = $('<th />').text('위치');
	let th4 = $('<th />').text('주차된 곳');
	
	
	$(thead).append(th1, th2, th3, th4);
	$(realThead).append(thead);
	let realTbody = $('<tbody />');
	$('table').append(realThead, realTbody);
	
	for(let bike of result) {
		$.ajax({
	    	url: "ShowBikeRealPositionServlet",
			type:'get',
			data: {
				bicycleLat : bike.bicycleLat,
				bicycleLng : bike.bicycleLng,
        	},
			dataType:'json',
			success: function(result2) {
				drawTable(bike, result2);
			},
			error: function(e) {
				console.error(e);
			}
	    })
	}
}

// 완료시 자전거 그리기
function drawTable(bike, result) {
	let data = JSON.parse(result);
	console.log(data);
	
	//console.log(data.results[0].region.area2.name, data.results[0].region.area3.name)
	
	
	let tbody = $('<tr />');
	let td1 = $('<td />').text(bike.bicycleNo);
	
	let td2;
	if (bike.bicyclePossible == 'Y') {
		td2 = $('<td />').text("사용 가능");
	} else {
		td2 = $('<td />').text("사용 불가능");
	}
	
	let td3 = $('<td />').text(data.results[0].region.area2.name + " " + data.results[0].region.area3.name);
	
	let td4;
	if (bike.parkNumber == '1') {
		td4 = $('<td />').text("중앙로역");
	} else if (bike.parkNumber == '2'){
		td4 = $('<td />').text("반월당역");
	} else {
		td4 = $('<td />').text("");
	}
	
	$(tbody).append(td1, td2, td3, td4);
	$('tbody').append(tbody);
	
	//$('#bikeTable').$('<table>').append(tbody);
}

// 자전거 위치 찍기
function getBikePosition(result) {
	console.log("자전거 위치 찍기");
	for(let bike of result) {
		var marker = new naver.maps.Marker({
	        position: new naver.maps.LatLng(bike.bicycleLat, bike.bicycleLng),
	        map: map,
	        title: bike.bicycleNo,
	        icon: {
	            url: "https://img.icons8.com/offices/30/000000/marker.png", //50, 68 크기의 원본 이미지
	            origin: new naver.maps.Point(0, 0)
	        }
	    });
		
	}
}

function onErrorGeolocation() {
    var center = map.getCenter();
}


$(window).on("load", function() {
    if (navigator.geolocation) {
        /**
         * navigator.geolocation 은 Chrome 50 버젼 이후로 HTTP 환경에서 사용이 Deprecate 되어 HTTPS 환경에서만 사용 가능 합니다.
         * http://localhost 에서는 사용이 가능하며, 테스트 목적으로, Chrome 의 바로가기를 만들어서 아래와 같이 설정하면 접속은 가능합니다.
         * chrome.exe --unsafely-treat-insecure-origin-as-secure="http://example.com"
         */
        navigator.geolocation.getCurrentPosition(onSuccessGeolocation, onErrorGeolocation);
    } else {
        var center = map.getCenter();
    }
    
});

</script>
</body>
</html>