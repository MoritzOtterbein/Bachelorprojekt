import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong/latlong.dart';
import 'package:location/location.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Location _location = Location();
  MapController _mapController = MapController();
  Marker _marker= MapController() as Marker;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  void _getLocation() async {
    var currentLocation = await _location.getLocation();
    setState(() {
      _marker = Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(currentLocation.latitude, currentLocation.longitude),
        builder: (ctx) => Container(
          child: Icon(
            Icons.location_on,
            color: Colors.red,
            size: 45.0,
          ),
        ),
      );
    });
    _mapController.move(LatLng(currentLocation.latitude, currentLocation.longitude), 15);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('OpenStreetMap with Flutter'),
        ),
        body: FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            center: LatLng(0, 0),
            zoom: 5.0,
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: ['a', 'b', 'c'],
            ),
            MarkerClusterLayerOptions(
              maxClusterRadius: 120,
              size: Size(40, 40),
              fitBoundsOptions: FitBoundsOptions(
                padding: EdgeInsets.all(50),
              ),
              markers: (_marker != null) ? [_marker] : [],
              polygonOptions: PolygonOptions(
                  borderColor: Colors.blueAccent,
                  color: Colors.black12,
                  borderStrokeWidth: 3),
              builder: (context, markers) {
                return FloatingActionButton(
                  child: Text(markers.length.toString()),
                  onPressed: null,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}