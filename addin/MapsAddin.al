controladdin GoogleMaps
{
    StartupScript = 'js/maps/startup.js';

    Scripts =
        'https://maps.googleapis.com/maps/api/js?key=AIzaSyDJ6Rc5T6uNahos9sYW6lzZ7j6ub4EwH0w',
        'https://use.fontawesome.com/releases/v5.15.3/js/all.js',
        'https://h2909571.stratoserver.net/HellebrekerPackages/3.TruckTrackerExternal/js/angwrapper.js';

    VerticalStretch = true;
    HorizontalStretch = true;

    // MinimumHeight = 250;
    // MinimumWidth = 250;

    VerticalShrink = true;
    HorizontalShrink = true;

    event ControlReady();

    procedure InitializeHtml();
    event HtmlInitializedCallback();

    procedure MoveCameraToLocation();
    procedure AddMarker(lat: Text; lng: Text; title: Text; description: Text; focus: Boolean);


    procedure AddTruckDriver(id: Text; name: Text; startLocation: Text; totalCount: Integer);
    procedure SetRouteForTruckDriver(id: Text; startLocation: Text; endLocation: Text);
    procedure VisualizeRouteForDriver(id: Text);
    procedure FocusOnRoute(id: Text);
    procedure StartDrivingCar(id: Text);

    event RouteSetCallback(Employee: Text);

    event RouteVisualizedCallback(Employee: Text);
}