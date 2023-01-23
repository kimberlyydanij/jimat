navigator.geolocation.getCurrentPosition(function(pos) {
    console.log(pos);
    var lat = pos.coords.latitude;
    var lng = pos.coords.longitude;
    
    sessionStorage.setItem("user-lat", lat); 
    sessionStorage.setItem("user-lng", lng); 
    
    ulat = sessionStorage.getItem("user-lat");
    ulng = sessionStorage.getItem("user-lng");
         
});




