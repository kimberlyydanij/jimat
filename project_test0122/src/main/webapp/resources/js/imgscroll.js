let sh = [0, 0, 0, 0, 0];

function img_scroll(k, s)
{
  sh[k] += s;
  
  if (sh[k] > 0)
  	sh[k] = 0;
  	
  var count = 0;
  
  for (i = 1; i < 100; i++) {
    if (document.getElementById('shop-thumbnail-body-' + k + '-' + i))
    {
      ++count;
    }
    else
    {
      break;
    }
  }
  
  if ($("#row_container_" + k).innerWidth() > 190 * count - 10)
  	sh[k] = 0;
  else if (sh[k] <= $("#row_container_" + k).innerWidth() - 190 * count + 10)
  	sh[k] = $("#row_container_" + k).innerWidth() - 190 * count + 10;
  	
  for (i = 1; i <= count; i++) {
    $('#shop-thumbnail-body-' + k + '-' + i).css('transform', 'translate(' + sh[k] + 'px,0px)');
  }
}
