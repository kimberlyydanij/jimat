function team_vita500() {
  location.href = "/team_vita500.html";
}

function curation_page() {
  location.href = "/curation_page.html";
}

function one_km_map() {
  location.href = "/one_km_map.html";
}

function magazine_page() {
  location.href = "/magazine_page.html";
}

function my_page() {
  location.href = "/my_page.html";
}

function main_page() {
  location.href = "/index.html";
}

/* function login() {
  location.href = "/login.html";
}  */

function sign_up() {
  location.href = "/sign_up.html";
}

function review() {
  location.href = "/review.html";
}
function review() {
  location.href = "/review.html";
}

function shop_detail() {
  location.href = "/shop_detail.html";
}

function popup_login(href, w, h) {
  var href = "/login.html";
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
      ", top=200, menubar=no, status=no, titlebar=no, location=no, resizable=no, toolbar=no"
  );
}
