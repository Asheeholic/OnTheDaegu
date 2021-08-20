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
	<div id="map" align="center" style="width:60%; height:800px;">
	</div>
	<div><span id="goalTimeTitle">도착 예정 시간 : </span><span id="goalTime"></span></div>
	<div><span id="ticketTimeLeftTitle">남은 정기권 시간 : </span><span id="ticketTimeLeft"></span></div>
	<div>
		<form id="frm" action="mapDeliverBike.do" method="post">
			<input type="hidden" id="nowLat" name="nowLat">
			<input type="hidden" id="nowLng" name="nowLng">
		</form>
		<button id="deliveryStart" type="button">배달시작</button>
	</div>

<script>
// 변수 초기화
let now;
let goal;
let goalTime; // 도착시간

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
    
    //다른곳에 클릭시 새로운 마커 등장.
    var marker2 = new naver.maps.Marker({
        position: [],
        map: map,
        title: "도착지",
        icon: {
        	url: "https://img.icons8.com/offices/30/000000/marker.png",
        	origin: new naver.maps.Point(0, 0)
        }
    });
    
    naver.maps.Event.addListener(map, 'click', function(e) {
    	marker2.setPosition(e.latlng);
    	// 마커를 찍을때 그 위치를 콘솔로그 해서 보여줌.
    	
    	goal = marker2.getPosition();
    	console.log(goal);
    	// 폴리라인 초기화
        polyline.setMap(null);

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
    	
	});
    
}

function onErrorGeolocation() {
    var center = map.getCenter();

}


function drawRoad(result) {
	let obj = JSON.parse(result); // 한번 더 파싱 해야하는 이유를 모르겠음..
	console.log(obj);
	let paths = obj.route.trafast[0].path;
	
	// 도착시간 화면에 출력
	goalTime = obj.route.trafast[0].summary.duration * 2.5;
	console.log(goalTime);
	if(Math.floor((goalTime / 1000) / 60) < 60) {
		goalTime = Math.floor((goalTime / 1000) / 60) + "분"
	} else {
		goalTime = Math.floor((goalTime / 1000) / 60 / 60) + "시간 " +
					Math.floor((goalTime / 1000) / 60 % 60) + "분"
	}; // 밀리세컨드이니깐
	$('#goalTime').text(goalTime);
	
	let resultPath = [];
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
    
    // 배달 시작 페이지 호출
    // 처음 좌표만 보내면 될듯 함.
    // 안보내도 되고..?
    
    $.ajax({
		url:"LeftTimeShowServlet",
		type:'get',
		data:{
			email: "${session.email}"
		},
		dataType: 'json',
		success: function(result) {
			console.log(result);
			calculrateTime(result);
		},
		error: function(e) {
			console.error(e);
		}
	})
	
	function calculrateTime(result) {
		let now = new Date();
		
		// 디비에 아예 내용이 없을시
		if(result == null) {
			$("#ticketTimeLeft").text("처음이시군요! 정기권을 사셔서 이용해 주세요!");
			$('#deliveryStart').text('이용권구매');
			$('#deliveryStart').on("click", function() {
				buyTicket('${session}');
		    })
			return;
		}
		
		let boughtTime = new Date(result.dateBought);
		
		console.log(boughtTime);
		if(result.ticketTime == "30분") {
			boughtTime.setMinutes(boughtTime.getMinutes() + 30);
		} else if (result.ticketTime == "1시간"){
			boughtTime.setHours(boughtTime.getHours() + 1);
		} else if (result.ticketTime == "2시간"){
			boughtTime.setHours(boughtTime.getHours() + 2);
		} else if (result.ticketTime == "4시간"){
			boughtTime.setHours(boughtTime.getHours() + 4);
		} else if (result.ticketTime == "8시간"){
			boughtTime.setHours(boughtTime.getHours() + 8);
		} else if (result.ticketTime == "12시간"){
			boughtTime.setHours(boughtTime.getHours() + 12);
		} else if (result.ticketTime == "24시간"){
			boughtTime.setHours(boughtTime.getHours() + 24);
		}
		
		console.log(boughtTime);
		if(boughtTime - now > 0) {
			let i = 0;
			let start = setInterval(function() {
				// 시간 대충 2시간이라 하면
				let time = Math.floor((boughtTime.getTime()-now.getTime())/1000) - i;
				// 1초 마다 까지고 초기화 하면됨.
				time = Math.floor((time/60)/60) + "시간" 
						+ Math.floor((time/60)%60) + "분"
						+ Math.floor(time%60) + "초";
				$("#ticketTimeLeft").text(time);
				i += 1;
			}, 1000)
			
			$('#deliveryStart').on("click", function() {
		    
				$('#nowLat').val(now._lat);
				$('#nowLng').val(now._lng);
				frm.submit();
	    	})
			
		} else {
			// db에 내용은 있으나 정기권이 현재시간을 비교해 0이거나 마이너스일때
			$("#ticketTimeLeft").text("정기권이 모두 소모 되셨습니다. 다시 정기권을 사셔서 이용해 주세요!");
			$('#deliveryStart').text('이용권구매');
			$('#deliveryStart').on("click", function() {
				buyTicket('${session}');
		    })
			return;
		}
		
		
		
	}
	// 시간 보여주는 메소드 끝 (제발 재사용 많이 해주세요)
	
    
});

</script>
</body>
</html>