function initMap()
{
    window.geocoder = new google.maps.Geocoder();

    window.ctrlGoogleMap = new google.maps.Map(document.getElementById('controlAddIn'), {
        zoom: 3,
        center: { lat: 52.3443982, lng: 6.0491498 },
        scrollwheel: true,
        mapTypeId: google.maps.MapTypeId.HYBRID
    });
    
}

initMap();

console.log('Google Maps Control Add-In initialized');
Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('GoogleMapsControlReady', []);

