var shift = 0;
function img_scroll(s) {
  shift += s;
  if (shift > 0)
  	shift = 0;
  var count = 0;
  for (i = 1; i < 100; i++) {
    if (document.getElementById('shop-thumbnail-body-' + i)) {
      ++count;
    } else {
      break;
    }
  }
  if (shift <= $("#row_container").innerWidth() - 190 * count + 10)
  	shift = $("#row_container").innerWidth() - 190 * count + 10;
  for (i = 1; i <= count; i++) {
    $('#shop-thumbnail-body-' + i).css('transform', 'translate(' + shift + 'px,0px)');
  }
}
