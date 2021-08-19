<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>간단한 지도 표시하기</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=wre5st6fx0"></script>
</head>
<body>
<div id="map" align="center" style="width:70%; height:400px;">
</div>

<script>

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
        map: map
    });
	
    now = marker.getPosition();
   	console.log(now);
    
    //다른곳에 클릭시 새로운 마커 등장.
    var marker2 = new naver.maps.Marker({
        position: position,
        map: map
    });
    
    naver.maps.Event.addListener(map, 'click', function(e) {
    	marker2.setPosition(e.latlng);
    	// 마커를 찍을때 그 위치를 콘솔로그 해서 보여줌.
    	
    	goal = marker2.getPosition();
    	console.log(goal);
	});
    
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