function clickTouch() {
	$('.nav-link').click(function(){
		if( $('.nav-link').hasClass('active') ) {
			$('.nav-link').removeClass('active');
		} else {
		    $('.nav-link').addClass('active');
		}
	});
}

function main() {
  document.location.href="index.do"
}

function teamVita500() {
  document.location.href="teamVita500.do"

}

function curation() {
  document.location.href="curation.do";
}

function oneKmMap() {
  document.location.href="oneKmMap.do";
}

function magazine() {
  document.location.href="magazine.do";
}

function myPage() {
  document.location.href="myPage.do";
}

function shopDetail() {
  document.location.href="shopDetail.do"
}

function detailMap() {
  document.location.href="map.do"
}
function popup_login(href, w, h) {
  var href = "loginformpage.do";
  var w = 466;
  var h = 615;
  var xPos = document.body.offsetWidth / 2 - w / 2; // 가운데 정렬
  xPos += window.screenLeft; // 듀얼 모니터일 때
  var yPos = document.body.offsetHeight / 2 - h / 2;
  window.open(
    href,
    "로그인",
    "width=" +
      w +
      ", height=" +
      h +
      ",  left=" +
      xPos +
      ", top=70, menubar=no, status=no, titlebar=no, location=no, resizable=no, toolbar=no"
  );
}