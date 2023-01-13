import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:latlong2/latlong.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:open_route_service/open_route_service.dart';



class MapPage extends StatefulWidget  {

  MapPage({super.key});

  @override
  State createState() => _InitExampleState();

}

class _InitExampleState extends State{
  List<Marker> markers = [];
  MapZoomPanBehavior? _zoomPanBehavior;

  @override
  void initState() {
    requestLocationPermission();
    _zoomPanBehavior = MapZoomPanBehavior();
    currentLocationLayerFunc();
    super.initState();
    main();
  }


  @override
  Widget build(BuildContext context) {


    return FutureBuilder(future:main(),builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.data != null) {

    return FlutterMap(

    options: MapOptions(
    center: LatLng(50.565385, 9.688258),
    zoom: 15
    ),
    children: [
    TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
    ),
    currentLocationLayerFunc(),
    MarkerLayer(
    markers: [
    Marker(point: LatLng(50.56460680668803, 9.691022859340723),builder: (context) => FlutterLogo()),
      Marker(point: LatLng(50.55336961229619, 9.67457559198971), builder: (context) => FlutterLogo()),

    ],
    ),
      PolylineLayer(
        polylineCulling: false,
        polylines: [
          Polyline(
              points: snapshot.data,
              color: Colors.blue,
              strokeWidth: 5
          ),
        ],
      ),
    ],
    );
    }else {
        return const Text("loading");
      }
    });
  }

}


CurrentLocationLayer currentLocationLayerFunc() {

  return CurrentLocationLayer(


  centerOnLocationUpdate: CenterOnLocationUpdate.always,
    turnOnHeadingUpdate: TurnOnHeadingUpdate.never,
    style: const LocationMarkerStyle(
      showAccuracyCircle: true,
      marker: DefaultLocationMarker(
        child: Icon(
          Icons.navigation,
          size: 10,
          color: Colors.white,
        ),
      ),
      markerSize: const Size(15, 15),
      markerDirection: MarkerDirection.heading,

    ),
  );
}

void  requestLocationPermission() async {
  PermissionStatus permission = await Permission.location.request();
  if (permission == PermissionStatus.granted) {
    // The permission was granted
  } else {
    // The permission was denied
  }

}
Future<List<LatLng>> main() async {
  // Initialize the openrouteservice with your API key.
  final OpenRouteService client = OpenRouteService(apiKey: '5b3ce3597851110001cf6248f6262135c4d844bc836cdd2554165582');

  // Example coordinates to test between
  const double startLat = 50.56504296719607;
  const double startLng = 9.686902986524037;
  const double endLat = 50.56460680668803;
  const double endLng = 9.691022859340723;

  // Form Route between coordinates
  final List<ORSCoordinate> routeCoordinates = await client.directionsRouteCoordsGet(
    startCoordinate: ORSCoordinate(latitude: startLat, longitude: startLng),
    endCoordinate: ORSCoordinate(latitude: endLat, longitude: endLng),
  );


  // Print the route coordinates
  routeCoordinates.forEach(print);

  // Map route coordinates to a list of LatLng (requires google_maps_flutter package)
  // to be used in the Map route Polyline.
  final List<LatLng> routePoints = routeCoordinates
      .map((coordinate) => LatLng(coordinate.latitude, coordinate.longitude))
      .toList();
  return routePoints;
  // Create Polyline (requires Material UI for Color)
  /*final Polyline routePolyline = Polyline(
    polylineId: PolylineId('route'),
    visible: true,
    points: routePoints,
    color: Colors.red,
    width: 4,
  );
  */

  // Use Polyline to draw route on map or do anything else with the data :)
}


