/**
 * 
 */
 
var mapContainer = document.getElementById('map'), // 지도를 표시할 div
mapOption = {
	center : new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	level : 5
// 지도의 확대 레벨
};

// 지도를 생성합니다
var map = new daum.maps.Map(mapContainer, mapOption);
