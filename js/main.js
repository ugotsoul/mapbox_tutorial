(function () {
  L.mapbox.accessToken = 'pk.eyJ1IjoidWdvdHNvdWwiLCJhIjoiYjc2ODRjMTQzNTYxMWNjZTljODNkZGNjMzFmODAxZWEifQ.0LTCDVaFJRMQ7BBjcb8nsg';

  var map = L.mapbox.map('map-main', 'ugotsoul.milaolm5', {attributionControl: false, infoControl:true }).setView([37.8, -122.3], 10);

  map.gridControl.options.follow = true;
}());
