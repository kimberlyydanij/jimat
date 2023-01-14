		function smallmap(latitude, longitude) {
			// 이미지 지도에서 마커가 표시될 위치입니다 
			var markerPosition = new kakao.maps.LatLng(latitude, longitude);

			// 이미지 지도에 표시할 마커입니다
			// 이미지 지도에 표시할 마커는 Object 형태입니다
			var marker = {
				position : markerPosition
			};

			var staticMapContainer = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
			staticMapOption = {
				center : new kakao.maps.LatLng(latitude, longitude), // 이미지 지도의 중심좌표
				level : 3, // 이미지 지도의 확대 레벨
				marker : marker
			// 이미지 지도에 표시할 마커 
			};

			// 이미지 지도를 생성합니다
			var staticMap = new kakao.maps.StaticMap(staticMapContainer,
					staticMapOption);
		}

		smallmap(lat, lng);