function popup_login(href, w, h) {
  var href = "login.html";
var w = 466;
var h = 615;
var xPos = (document.body.offsetWidth/2) - (w/2); // 가운데 정렬
      xPos += window.screenLeft; // 듀얼 모니터일 때
  var yPos = (document.body.offsetHeight/2) - (h/2);
      window.open(href, "로그인", "width="+w+", height="+h+",  left="+xPos+", top=200, menubar=0, status=0, titlebar=0, resizable=0");
}

function move_1km(){
    location.href = "map/1kmMap.html";
}
