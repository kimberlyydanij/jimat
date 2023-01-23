//기본값 저장
var keyword;
var pageNo;
var totalPage;
var num;
var total;

function pageSearch(totalPage, total, blockSize, blockPage) {
	displayPagination(totalPage, total, blockSize, blockPage);
	if (keyword != '') {
		// alert(keyword);
		$.ajax({

			type : 'POST',
			dataType : 'json',
			data : {
				'pageNo' : blockPage,
				'pageSize' : total,
				'keyword' : keyword
			},
			url : 'libmap.do',
			success : function(result) {
				var search = result.aList;
				pageNo = result.pageNo;
				totalPage = result.totalPage;
				displayPlaces(search);

			},
			error : function(error) {
				alert(error);
			}
		});
	}
}
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div
mapOption = {
	center : new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	level : 5
// 지도의 확대 레벨
};

// 지도를 생성합니다
var map = new daum.maps.Map(mapContainer, mapOption);

// 지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
function setMapType(maptype) {
	var roadmapControl = document.getElementById('btnRoadmap');
	var skyviewControl = document.getElementById('btnSkyview');
	if (maptype === 'roadmap') {
		map.setMapTypeId(daum.maps.MapTypeId.ROADMAP);
		roadmapControl.className = 'selected_btn';
		skyviewControl.className = 'btn';
	} else {
		map.setMapTypeId(daum.maps.MapTypeId.HYBRID);
		skyviewControl.className = 'selected_btn';
		roadmapControl.className = 'btn';
	}
}

// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomIn() {
	map.setLevel(map.getLevel() - 1);
}

// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomOut() {
	map.setLevel(map.getLevel() + 1);
}

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new daum.maps.InfoWindow({
	removable : true,
	zIndex : 1
});

// 키워드로 장소를 검색합니다
// searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {
	keyword = document.getElementById('keyword').value;
	if (!keyword.replace(/^\s+|\s+$/g, '')) {
		alert('키워드를 입력해주세요!');
		return false;
	} else {
		infowindow.close();
		
		searchkeyWord(keyword);
	}

}


function searchkeyWord(keyword) {
	//alert(keyword);
	// 한페이지당 표시될 화면 계산
	num = 1;
	total = 15;
	keyword = keyword;
	// keyword = document.getElementById('keyword').value;
	// 디비값을 불러 지도에 뿌림
	$.ajax({
		type : 'POST',
		dataType : 'json',
		data : {
			'pageNo' : num,
			'pageSize' : total,
			'keyword' : keyword
		},
		url : 'libmap.do',
		success : function(result) {
			var search = result.aList;
			pageNo = result.pageNo;
			totalPage = result.totalPage;
			displayPlaces(search);
			keyword = document.getElementById('keyword').value;
			
		},
		error : function(error) {
			alert(error);
		}
	});
} // end f_Searchkeyword()

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(search) {
	// alert(search.length);
	var listEl = document.getElementById('placesList'), menuEl = document
			.getElementById('menu_wrap'), fragment = document
			.createDocumentFragment(), bounds = new daum.maps.LatLngBounds(), listStr = '';
	
	
	
	// 검색 결과 목록에 추가된 항목들을 제거합니다
	removeAllChildNods(listEl);

	// 지도에 표시되고 있는 마커를 제거합니다
	removeMarker();

	for (var i = 0; i < search.length; i++) {
		// 마커를 생성하고 지도에 표시합니다
		var placePosition = new daum.maps.LatLng(
				search[i].latitude,
				search[i].longitude), marker = addMarker(
				placePosition, i), itemEl = getListItem(i, search[i], marker); // 검색
				
		// 결과
		// 항목
		// Element를
		// 생성합니다

		// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		// LatLngBounds 객체에 좌표를 추가합니다
		bounds.extend(placePosition);

		var searchs = search[i];
		// 마커와 검색결과 항목에 click 했을때
		// 해당 장소에 인포윈도우에 장소명을 표시합니다
		// 지도 click 했을 때는 인포윈도우를 닫습니다
		(function(marker, title, searchs) {
			
			daum.maps.event.addListener(marker, 'click', function() {
			
				displayInfowindow(marker, title, searchs);
			});

			daum.maps.event.addListener(map, 'click', function() {
				infowindow.close();
			});

			itemEl.onclick = function() {
				displayInfowindow(marker, title, searchs);
			};

			// itemEl.onclick = function() {
			// infowindow.close();
			// };
		})(marker, search[i], searchs);

		fragment.appendChild(itemEl);
	}

	function removeMarker() {
		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(null);
		}
		markers = [];
	}

	// 검색결과 항목들을 검색결과 목록 Elemenet에 추가합니다
	listEl.appendChild(fragment);
	menuEl.scrollTop = 0;

	displayPagination(totalPage, total, 10, 1);
	// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, search, marker) {

	var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
			+ (index + 1)
			+ '"></span>'
			+ '<div class="info">'
			+ '   <h5>'
			+ search.foodstore_id + '</h5>';

	if (search.newAddress) {
		itemStr += '<span>' + search.address + '</span>'
				+ '<span class="jibun gray">' + search.address
				+ '</span>';
	} else {
		itemStr += '<span>' + search.address + '</span>';
	}

	itemStr += '<span class="tel">' +search.foodcategory + '</span>'

			
	itemStr += '<span class="typ">' +search.foodstroe_num + '</span>'
	
	itemStr += '<img src = searchs.img_url  enctype="multipart/form-data" style="float:right">'
			+ '</div>';
	
	el.innerHTML = itemStr;
	el.className = 'item';
	return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
	var imageSrc ='http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커
	// 이미지
	// url,
	// 스프라이트
	// 이미지를
	// 씁니다
	imageSize = new daum.maps.Size(40, 40), // 마커 이미지의 크기
	imgOptions = {
		spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
		spriteOrigin : new daum.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중
		// 사용할 영역의 좌상단
		// 좌표
		offset : new daum.maps.Point(13, 37)
	// 마커 좌표에 일치시킬 이미 내에서의 좌표지
	}, markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions), marker = new daum.maps.Marker(
			{
				position : position, // 마커의 위치
				image : markerImage,
				clickable : true
			});

	marker.setMap(map); // 지도 위에 마커를 표출합니다
	markers.push(marker); // 배열에 생성된 마커를 추가합니다

	return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
	for (var i = 0; i < markers.length; i++) {
		markers[i].setMap(null);
	}
	markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(totalPage, total, blocksize, pageNo) {

	var paginationEl = document.getElementById('pagination');

	paginationEl.innerHTML = '';
	var totalpages = totalPage; // 총페이지수
	var blockpage = 0; // 1,11,21,...각 블럭 들의 첫페이지 1~10 까지가 한블럭

	// 블럭의 첫번째 페이지 구하기
	blockpage = Math.floor((pageNo - 1) / blocksize);
	blockpage = blockpage * blocksize + 1;
	// 페이지리스트, blockpage++
	for (i = 1; i <= blocksize; i++, blockpage++) {
		// 마지막 페이지와 같다면..
		if (blockpage == totalpages)
			i = blocksize + 1; // 다음차례에 for문 빠져나감
		// if (blockpage == pageNo)
		// paginationEl.insertAdjacentHTML("beforeEnd", " <span
		// style='cursor:default;'><b>"
		// + blockpage + "</b></span> ");
		// else
		paginationEl.insertAdjacentHTML("beforeEnd",
				" <span style='cursor:pointer;'" + "onClick='pageSearch("
						+ totalPage + "," + total + "," + blocksize + ","
						+ blockpage + ")'>" + blockpage + "</span> ");
	}

}


// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title, searchs) {

	
	var content = '<div class ="f_main"><div id="f_date">' + '<img src =' + `${searchs.img_url}` +' enctype="multipart/form-data" width=50 style="float:left">' +'</div>'
			+ '<div class="f_header" style="text-align:right">' + searchs.foodstore_id
			+ '</div>' + '<div id="f_date" style="text-align:right">' + searchs.foodcategory
			+ '</div>' + '<div id="f_date" style="text-align:right">' + searchs.foodstroe_num
			+ '</div>' + '<div id="f_number">'
			+ searchs.address + '</div></div>'; 

	// content의 내용을 인포윈도우에 등록
	infowindow.setContent(content);
	infowindow.open(map, marker);
}

// 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {
	while (el.hasChildNodes()) {
		el.removeChild(el.lastChild);
	}
}