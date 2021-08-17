<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>자전거 배달!</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=wre5st6fx0"></script>
</head>
<body>
<div id="map" align="center" style="width:60%; height:800px;">
	</div>
	<div>
		<span id="goalTimeSubtitle"></span>
		<span id="goalTime"></span>
		<span id="goalTimeTitle"></span>
	</div>
<script>
// 변수 초기화
let now;
let goal;
let goalTime; // 도착시간
let resultPath = []; // 그려줄 길 배열 초기화
let marker2;

//기본 폴리라인 초기화
let polyline = new naver.maps.Polyline({
    map: map,
    path: [],
    clickable: true,
    strokeColor: '#E51D1A',
    strokeStyle: 'solid',
    strokeOpacity: 1,
    strokeWeight: 5
});
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
map.setOptions("mapTypeControl", false); //지도 유형 컨트롤의 표시 여부


//나의 위치 로드 성공시
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
    
    //다른곳에 클릭시 새로운 마커 등장.
    //배달 시작지
    marker2 = new naver.maps.Marker({
        position: new naver.maps.LatLng(35.8690517, 128.5933726),
        map: map,
        title: "배달 시작지",
        icon: {
        	url: "https://img.icons8.com/fluency/48/000000/marker-b.png",
        	origin: new naver.maps.Point(0, 0)
        }
    });
    
    goal = marker2.getPosition();
    console.log(goal);
	
    $.ajax({
      	url: "FindWayServlet",
      	data: {
      		nowLat : now._lat,
      		nowLng : now._lng,
      		goalLat : goal._lat,
      		goalLug : goal._lng
      	},
  		type:'get',
  		dataType:'json',
  		success: function(result) {
  			drawRoad(result);
  		},
  		error: function(e) {
  			console.error(e);
  		}
    })
	
    // 마커의 포지션이 이제 바뀔 예정입니다.
    let i = 0;
	let deliveryStart = setInterval(function() {
		console.log(resultPath.length);
		// 로케이션이 안감. 수정해야함
		location.href = "mapTimeShow.do";
		marker2.setPosition(resultPath[resultPath.length - i]);
		i += 1;
		if(resultPath.length == i) {
			mapRequestTime();
			clearInterval(deliveryStart);
		}
		
	}, 1000);
	
    function mapRequestTime() {
    	location.href = "mapTimeShow.do";
    }
    
}

function onErrorGeolocation() {
    var center = map.getCenter();

}

function drawRoad(result) {
	let obj = JSON.parse(result); // 한번 더 파싱 해야하는 이유를 모르겠음..
	console.log(obj);
	let paths = obj.route.trafast[0].path;
	
	// 도착시간 화면에 출력
	goalTime = obj.route.trafast[0].summary.duration * 2;
	console.log(goalTime);
	if(Math.floor((goalTime / 1000) / 60) < 60) {
		goalTime = Math.floor((goalTime / 1000) / 60) + "분"
	} else {
		goalTime = Math.floor((goalTime / 1000) / 60 / 60) + "시간 " +
					Math.floor((goalTime / 1000) / 60 % 60) + "분"
	}; // 밀리세컨드이니깐
	$('#goalTime').text(goalTime);
	$('#goalTimeTitle').text(' 뒤에 도착예정입니다!');
	$('#goalTimeSubtitle').text('자전거가 ');
	
	// 지도 그리기
	
	for(let path of paths) {
		resultPath.push(new naver.maps.LatLng(path[1], path[0]));
	}
	
	polyline = new naver.maps.Polyline({
	    map: map,
	    path: resultPath,
	    clickable: true,
	    strokeColor: '#E51D1A',
	    strokeStyle: 'solid',
	    strokeOpacity: 1,
	    strokeWeight: 5
	});
}

// 윈도우 로드시
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
    
  	// 폴리라인 초기화
    polyline.setMap(null);
	
});

</script>
</body>
</html>