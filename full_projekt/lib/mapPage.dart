import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:open_route_service/open_route_service.dart';
import 'package:geolocator/geolocator.dart';



class MapPage extends StatefulWidget{

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
    Timer.periodic(Duration(seconds: 10), (timer) {

      setState((){
        routeCalc();

        // perform your actions here
      });
    });

    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future:routeCalc(),builder: (BuildContext context, AsyncSnapshot snapshot) {

      if (snapshot.data != null) {

        return FlutterMap(

          options: MapOptions(
              center: LatLng(50.565385, 9.688258),
              zoom: 18,
            minZoom: 15,
            maxZoom: 20

          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            ),
            PolylineLayer(
              polylineCulling: false,
              polylines: [
                Polyline(
                    points: snapshot.data,
                    color: Colors.green,
                    strokeWidth: 3

                ),
              ],
            ),
            currentLocationLayerFunc(),
            MarkerLayer(

              rotate: true,
              markers:[
                Marker(point: LatLng(goals[0].latitude, goals[0].longitude),width:40,height:40, builder: (context) => Container(
                    child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                      onPressed: (){
                        dialogBuilder(context, 0);
                      },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[1].latitude, goals[1].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 1);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[2].latitude, goals[2].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 2);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[3].latitude, goals[3].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 3);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[4].latitude, goals[4].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 4);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[5].latitude, goals[5].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 5);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[6].latitude, goals[6].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 6);
                    },
                  ),
                ),
                ),Marker(point: LatLng(goals[7].latitude, goals[7].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 7);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[8].latitude, goals[8].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 8);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[9].latitude, goals[9].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 9);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[10].latitude, goals[10].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 10);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[11].latitude, goals[11].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 11);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[12].latitude, goals[12].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context,12);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[13].latitude, goals[13].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 13);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[14].latitude, goals[14].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 14);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[15].latitude, goals[15].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 15);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[16].latitude, goals[16].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 16);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[17].latitude, goals[17].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 17);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[18].latitude, goals[18].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 18);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[19].latitude, goals[19].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 19);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[20].latitude, goals[20].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 20);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[21].latitude, goals[21].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 21);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[22].latitude, goals[22].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 22);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[23].latitude, goals[23].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 23);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[24].latitude, goals[24].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 24);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[25].latitude, goals[25].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 25);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[26].latitude, goals[26].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 4);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[27].latitude, goals[27].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 27);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[28].latitude, goals[28].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 28);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[29].latitude, goals[29].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 29);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[30].latitude, goals[30].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 30);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[31].latitude, goals[31].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 31);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[32].latitude, goals[32].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 32);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[33].latitude, goals[33].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 33);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[34].latitude, goals[34].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 34);
                    },
                  ),
                ),
                ),

                //Bushaltestellen

                Marker(point: LatLng(goals[35].latitude, goals[35].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.bus_alert_rounded),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilderNonPic(context, 35);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[36].latitude, goals[36].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.bus_alert_rounded),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilderNonPic(context, 36);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[37].latitude, goals[37].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.bus_alert_rounded),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilderNonPic(context, 37);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[38].latitude, goals[38].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.bus_alert_rounded),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilderNonPic(context, 38);
                    },
                  ),
                ),
                ),


                //Parkplätze


                Marker(point: LatLng(goals[39].latitude, goals[39].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.local_parking),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilderNonPic(context, 39);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[40].latitude, goals[40].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.local_parking),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilderNonPic(context, 40);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[41].latitude, goals[41].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.local_parking),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilderNonPic(context, 41);
                    },
                  ),
                ),
                ),

                //Sehenswürdigkeiten Tour


                Marker(point: LatLng(goals[42].latitude, goals[42].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 42);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[43].latitude, goals[43].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 43);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[44].latitude, goals[44].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 44);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[45].latitude, goals[45].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 45);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[46].latitude, goals[46].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 46);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[47].latitude, goals[47].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 47);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[48].latitude, goals[48].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 48);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[49].latitude, goals[49].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 49);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[50].latitude, goals[50].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 50);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[51].latitude, goals[51].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 51);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[52].latitude, goals[52].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 52);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[53].latitude, goals[53].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 53);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[54].latitude, goals[54].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 54);
                    },
                  ),
                ),
                ),
                Marker(point: LatLng(goals[55].latitude, goals[55].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 55);
                    },
                  ),
                ),
                ),


                //Kneipen Tour
                Marker(point: LatLng(goals[56].latitude, goals[56].longitude),width:40,height:40, builder: (context) => Container(
                  child: IconButton(
                    icon: const Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: (){
                      dialogBuilder(context, 56);
                    },
                  ),
                ),
                ),




              ],
      ),

          ],
        );
      }
      else {
        return const Text("loading");
      }
    });
  }
}


CurrentLocationLayer currentLocationLayerFunc() {

  return CurrentLocationLayer(


    //centerOnLocationUpdate: CenterOnLocationUpdate.always,
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
int index = 45;
Future<List<LatLng>> routeCalc() async {
  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);


  //Liste zum Anlegen neuer Ziele


  // Initialize the openrouteservice with your API key.
  final OpenRouteService client = OpenRouteService(apiKey: '5b3ce3597851110001cf6248f6262135c4d844bc836cdd2554165582');
  double distanceInMeters = Geolocator.distanceBetween(goals[index].latitude, goals[index].longitude, position.latitude, position.longitude);
  // Example coordinates to test between
  print(distanceInMeters);
  if(distanceInMeters<40){
    index = index + 1;
    print(index);
  }
  double endLat = goals[index].latitude;
  double endLng = goals[index].longitude;

  // Form Route between coordinates
  final List<ORSCoordinate> routeCoordinates = await client.directionsRouteCoordsGet(
    startCoordinate: ORSCoordinate(latitude: position.latitude, longitude: position.longitude),
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



//Preset für die Ziele
// Der Konstruktor braucht einen Namen, Eine ID, die Parameter des Ziels, können per rechtsklick in Google kopiert werden
// ein Bild(wird mit der URL aufgerufen und der Infotext zum Ziel
class Goal{
  int goalId = 0;
  String name = "";

  double latitude = 0;
  double longitude = 0;
  String picture = "";
  String infoText ="";

  Goal(int goalId, String name, double latitude, double longitude, String picture, String infoText){
    this.goalId = goalId;
    this.name = name;
    this.latitude = latitude;
    this.longitude = longitude;
    this.picture = picture;
    this.infoText = infoText;
  }

  //Getter Lat
   double get latitudeValue {
    return latitude;
  }
  //Getter Long
  double get longitudeValue {
    return longitude;
  }
}






List<Goal> goals = [
  Goal(1, "10 SSC", 50.565511, 9.686294, "assets/10SSC.jpeg", 'Student Service Center \n - Infothek \n - Poststelle\n - Tagungsraum\n - Studienbüro \n - International Office \n - Zentrale Studienberatung \n - Validierungsautomaten \n - Wasserspender'),

  Goal(2, "11 Mensa", 50.56563492334587, 9.68688584796792, "assets/11Mensa.jpeg", 'Mensa FB Oecotrophologie, Geldbörsenaufwertungsgeräte, Geldautomat (Sparkasse)'),

  Goal(3, "12 Bibliothek", 50.56520531601582, 9.687545278390399, "assets/12Bib.jpeg", 'Hochschul- und Landesbibliothek'),

  Goal(4, "20", 50.56502540993165, 9.688010554126693, "assets/20.jpeg", 'Seminarräume Zentralverwaltung'),

  Goal(5, "21", 50.56548156496265, 9.688460372201549, "assets/21.jpeg", 'FB Sozialwesen'),

  Goal(6, "22", 50.56604103490536, 9.68897537570378, "assets/22.jpeg", 'FB Sozial- und Kulturwissenschaften, Kinderkrippe akadeMINIS e.V.'),

  Goal(7, "23", 50.566646622315766, 9.688889384675395, "assets/23.jpeg", 'FB Sozial- und Kulturwissenschaften, FB Wirtschaft, Studentenwerk Gießen ,Zentralverwaltung'),

  Goal(8, "24", 50.56717979202649, 9.688532107212355, "assets/24.jpeg", 'FB Gesundheitswissenschaften, FB Sozial- und Kulturwissenschaften, FB Sozialwesen'),

  Goal(9, "25", 50.5646104670265, 9.688471128069633, "assets/25.jpeg", 'FB Gesundheitswissenschaften'),

  Goal(10, "26", 50.56747321698415, 9.688791179635553, "assets/26.jpeg", 'FB Gesundheitswissenschaften, FB Sozialwesen, Zentralverwaltung'),

  Goal(11, "30", 50.56430942305091, 9.687402432043951, "assets/30.jpeg", 'FB Elektrotechnik und Informationstechnik, FB Wirtschaft'),

  Goal(12, "31", 50.56375709365506, 9.686859014966355, "assets/31.jpeg", 'FB Lebensmitteltechnologie, FB Gesundheitswissenschaften'),

  Goal(13, "32", 50.56375981480126, 9.68637085224987, "assets/32.jpeg", 'Präsidium, FB Elektrotechnik und Informationstechnik, FB Lebensmitteltechnologie'),

  Goal(14, "33", 50.564608436944475, 9.686565605197107, "assets/33.jpeg", 'FB Elektrotechnik und Informationstechnik, FB Lebensmitteltechnologie'),

  Goal(15, "34", 50.56317690009005, 9.68692455964886, "assets/34.jpeg", 'Büroräume, Seminarräume'),

  Goal(16, "35", 50.564049308170425, 9.686003762152861, "assets/35.jpeg", 'RIGL-Fulda'),

  Goal(17, "36", 50.56370273663435, 9.687646266914873, "", 'Büroräume'),

  Goal(18, "40", 50.56465033845177, 9.68604445024874, "assets/40.jpeg", 'FB Oecotrophologie'),

  Goal(19, "41", 50.564251349148314, 9.685701609889565, "assets/41.jpeg", 'Zentralverwaltung'),

  Goal(20, "42", 50.563731447654924, 9.684952824985297, "assets/42.jpeg", 'Zentralverwaltung'),

  Goal(21, "43", 50.56416606606, 9.685057511421006, "assets/43.jpeg", 'FB Angewandte Informatik, FB Wirtschaft, Zentralverwaltung'),

  Goal(22, "44 SLZ", 50.56445343587642, 9.685222021423177, "assets/44SLZ.jpeg", 'Selbstlernzentrum (SLZ), Familienzentrum, Ruheraum, Wasserspender, Kaffeeautomat'),

  Goal(23, "45", 50.56482392514887, 9.685035078267127, "assets/45.jpeg", 'Hochschulsport, FB Sozialwesen Ruheraum'),

  Goal(24, "46", 50.56509941616678, 9.685487479682147, "assets/46.jpeg", 'FB Angewandte Informatik, FB Oecotrophologie, Rechenzentrum, Café Chaos, Aufwerter (Guthaben für Drucken/Kopieren)'),

  Goal(25, "50", 50.56546990239403, 9.684649978478769, "assets/50.jpeg", 'FB Lebensmitteltechnologie, AStA'),

  Goal(26, "51", 50.565135039234086, 9.684582679351829, "assets/51.jpeg", 'FB Angewandte Informatik, Copyshop, Aufwerter (Guthaben für Drucken/Kopieren)'),

  Goal(27, "52", 50.56486825620677, 9.684549811672213, "assets/52.jpeg", 'Halle 8'),

  Goal(28, "53", 50.56516818288133, 9.683932650128625, "assets/53.jpeg", 'FB Gesundheitswissenschaften, Hochschulsport'),

  Goal(29, "54", 50.56546493383784, 9.684226745213559, "assets/54.jpeg", 'FB Gesundheitswissenschaften, Hochschulsport'),

  Goal(30, "FOOD TRUCK", 50.56470159774071, 9.685887304579172, "assets/FOODTRUCK.jpeg", 'Food Truck „5 DAYS A WEEK”'),

  Goal(31, "Sport", 50.56594275400304, 9.688147164703876, "assets/Sport.jpeg", 'Basketball Spielfeld, Fußball Spielfeld'),

  Goal(32, "Hängematten", 50.56449341394203, 9.686914229910528, "assets/Hängematten.jpeg", ''),

  Goal(33, "Café Chaos", 50.5651429326376, 9.685078394233303, "assets/CaféChaos.jpeg", ''),

  Goal(34, "Copy Shop", 50.565234838803946, 9.684693733714592, "assets/CopyShop.jpeg", ''),

//Bushaltestellen
  Goal(35, "H", 50.56323239256676, 9.6866957366047, "", ''),

  Goal(36, "H", 50.56423391227678, 9.687617600279122, "", ''),

  Goal(37, "H", 50.56663143656019, 9.68999419845286, "", ''),

  Goal(38, "H", 50.56676881687665, 9.68988214647728, "", ''),

//Parkplätze
  Goal(39, "P1", 50.565213960786956, 9.68290900823376, "", ''),

  Goal(40, "P2", 50.565752342287155, 9.683322063906719, "", ''),

  Goal(41, "P3", 50.56996033791092, 9.687350745342787, "", ''),
  // Sehenswürdigkeiten
  Goal(42, "Hochschul- und Landesbibliothek Fulda", 50.55483836963246, 9.680014708071731,"assets/HLB.jpeg",'Die Hochschul- und Landesbibliothek (HLB) ist eine zentrale Einrichtung der Hochschule Fulda. Sie sichert die Informations- und Wissensversorgung der Lehrenden und Studierenden. Sie nimmt auch landesbibliothekarische Aufgaben wahr. Diese sind zum Beispiel das Erschließen und Bewahren des wertvollen historischen Altbestandes als Teil des kulturellen Erbes des Landes Hessen und in Deutschland. Neben diesen Funktionen als wissenschaftlicher Bibliothek ist sie auch für Aufgaben des öffentlichen Bibliothekswesens zuständig, , die sie in enger Kooperation mit der Stadt Fulda als Hochschul-, Landes und Stadtbibliothek erfüllt. Die HLB bietet ein breites Medienangebot für Erwachsene, Jugendliche und Kinder an. Hier finden Sie Bücher, Zeitschriften und Zeitungen, Hörbücher, Filme, Musik und Spiele. Auch elektronischen Medien (E-Medien), z.B. E-Books, das vielfältige Angebot der Onleihe, frei verfügbare Online-Medien im Volltext und vieles mehr werden hier angeboten.'),

  Goal(43, "Universitätsplatz", 50.55201063746461, 9.67897869354627,
  "assets/Universitätsplatz.jpeg",'Der Universitätsplatz ist das wichtige Zentrum der Innenstadt. Die Gestaltung geht zurück auf den Münchner Architekten Sep Ruf (1908–1982), der in den Jahren 1961 bis 1964 sowohl den Universitätsplatz neu ordnete und das Kaufhaus (1964 eröffnet) entwarf. Vor dem Kaufhaus ist der bronzene Felsenbrunnen von Georg Brenninger aus dem Jahre 1963 aufgestellt. 2008 bis 2012 wurde der Universitätsplatz durch die Planergruppe Oberhausen neugestaltet. Der Name des Universitätsplatzes geht zurück auf die Universität Fulda (1734–1805), die sich in dem von Andreas Gallasini entworfenen Gebäude am südöstlichen Rand des Platzes befand. Heute befindet sich in diesem Gebäude die Adolf-von-Dalberg-Grundschule. Mitten auf dem Platz stand bis zum Abriss 1904 der uralte „Ackerhof“ (Wirtschaftshof) der Jesuiten, die von 1571 bis 1773 in Fulda ansässig waren. Auch „alte Mang“ genannt, geht die Geschichte des Gebäudes möglicherweise bis in das Jahr 1238 zurück, als die ersten Franziskaner nach Fulda kamen und hier ein Barfüßerkloster gründeten. Von Ende November bis zum 24. Dezember findet hier der jährliche Weihnachtsmarkt statt, welcher sich durch weitere Gassen erstreckt.'),
  //"assets/UniversitätsplatzW.jpeg"
  Goal(44, "Museumshof", 50.55122003070237, 9.678660587315296,
  "assets/Museumshof.jpeg",
  'Der Museumshof ist häufig der Platz, an dem viele Veranstaltungen und Konzerte stattfinden. Vor allem im Sommer kann man hier zum Beispiel für das Freiluftkino vorbeikommen. Von Ende November bis zum 24. Dezember ist hier das historische Weihnachtsdorf zu finden. Dieser kleine Weihnachtsmarkt soll an das Mittelalter erinnern.'),
  //"assets/Museumshof1.jpeg", "assets/MuseumshofW.jpeg", "assets/MuseumshofW1.jpeg",
  Goal(45, "Altes Rathaus", 50.55167142437602, 9.677392518723732,
  "assets/AltesRathaus.jpeg",
  'Das alte Rathaus im historischen Stadtkern von Fulda reiht sich in eine Vielzahl von altehrwürdigen, geschichtsträchtigen Bauwerken in der hessischen Barockstadt ein. Ursprünglich um das Jahr 1500 erbaut und inzwischen rekonstruiert und saniert, diente das eindrucksvolle Fachwerkgebäude bis zum Jahr 1782 als Rathaus für die Bürger der Stadt. Das alte Rathaus ist ein klassisches Beispiel von später gotischer Fachwerksbauweise nicht sakraler Gebäude aus dem 16. und 17. Jahrhundert. In der großen Halle im Erdgeschoss wurde zunächst jeglicher Handel betrieben, aber auch Versammlungen wurden dort abgehalten. Die charakteristischen, damals noch offenen Arkaden sind bis heute als Merkmal des unteren Gebäudeteils erhalten geblieben. In den oberen Stockwerken befanden sich die Sitzungszimmer des Rathauses und die Rüstkammer. Im Jahre 1782 wechselte der Stadtrat seine Räumlichkeiten und zog zunächst in das Kanzlerpalais Unterm Heilig Kreuz und später dann in das Stadtschloss. Seither wurde das Alte Rathaus hauptsächlich als Geschäftshaus benutzt. Heute befindet sich darin ein Modegeschäft und eine Buchhandlung. Gegenüber dem Rathaus befinden sich die Skulpturen von Bonifatius (Missio), Benedikt (Regula) und Sturmius (Fundatio).'),
  //"assets/Figuren.jpeg",
  Goal(46, "Stadtpfarrkirche St. Blasius", 50.55172680004599, 9.676798141557649,
  "assets/St.Blasius.jpeg",
  'Die katholische Stadtpfarrkirche St. Blasius wurde in der Zeit von 1771 bis 1785 im barocken Stil nach den Plänen des Jesuitenbruders Johann Andreas Anderjoch erbaut. Sie ist die Heimat der 2015 gegründeten Innenstadtpfarrei St. Simplicius, Faustinus und Beatrix. Das Wappen des Fürstbischofs und eine Darstellung des Hl. Blasius sind über dem Hauptportal zu sehen. Es ist bereits die dritte Kirche, die an dieser Stelle errichtet wurde. Von den Vorgängerbauten ist nur ein Turm übernommen worden. Beeindruckend ist die mehrfarbig gestaltete Westfassade der vor wenigen Jahren aufwändig sanierten Kirche. Vor der Kirche steht ein Brunnenobelisk, der 1669 zur „Ehre Gottes und des Heiligen Blasius“ geschaffen wurde. Während der Regentschaft von Fürstbischof Heinrich von Bibra 1775 wurde er an seinen heutigen Platz versetzt, nahe der Stelle, an der im Mittelalter das Marktkreuz stand. Der Obelisk zeigt unter anderem das Stadt- und das Bischofswappen.'),

  Goal(47, "Bonifatius-Denkmal", 50.5531132, 9.67488357586676,
  "assets/Bonifatius.jpeg",
  'Auf dem Bonifatiusplatz, direkt gegenüber dem Fuldaer Stadtschloss, befindet sich eine fast vier Meter hohe Bronzeplastik des heiligen Bonifatius. Diese Skulptur zeigt Winfried Bonifatius, welcher für die Gründung von Fulda verantwortlich war. Er gab nämlich den Auftrag zur Gründung des Klosters Fulda und hat damit den Grundstein für die Stadt darum herum gelegt. Die Statue wurde zwischen 1830 und 1840 von Bildhauer Werner Henschel (Kassel) geschaffen und 1842 aufgestellt. Es zeigt den Apostel der Deutschen in langem Gewand und mit erhobenem Kreuz in der rechten Hand. Die linke Hand hält eine aufgeschlagene Bibel. Die Inschrift auf dem Sockel des Denkmals „VERBUM DOMINI MANET IN AETERNUM“ bedeutet „Das Wort des Herrn bleibt in Ewigkeit“. Das Denkmal ist von hohem künstlerischem Wert und wurde von der Fuldaer Bürgerschaft gestiftet. Um die Statue finanzieren zu können, erging bereits 1828 ein Spendenaufruf durch den damaligen Bürgermeister an die Bevölkerung. Es dauerte insgesamt über 15 Jahre, bis genug Geld gesammelt wurde.'),

  Goal(48, "Hexenturm", 50.55276219870897, 9.672881558134058,
  "assets/Hexenturm.jpeg",
  'Der im 12. Jahrhundert erbaute Turm ist 14 Meter hoch und war früher Teil der inneren Stadtmauer und des Nordtores, dass die Bürgerstadt vom Klosterbezirk abtrennte. Er ist der am besten erhaltene Turm der mittelalterlichen Stadtbefestigung. Er diente ursprünglich als Wehrturm innerhalb der mittelalterlichen Stadtmauer Fuldas. Er hatte die Aufgabe, vor Bedrohungen aus weiter Ferne zu warnen. Der Turm wurde später auch als Frauengefängnis genutzt. Dort wurden aber keine Hexen gefangen gehalten, sondern im Turm des Stadtschlosses. Der Name "Hexenturm" bürgerte sich erst am Ende des 19. Jahrhunderts ein. Zuvor wurde er "Turm am Frauentörlein" genannt. Am Turm befindet sich ein Hinweisschild zur Gedenkstätte für die 270 Opfer der Hexenverfolgung in Fulda, die im November 2008 auf dem Alten Dompfarrlichen Friedhof errichtet wurde. Hinter dem Hexenturm befindet sich noch das Geburtshaus des Erfinders der Braunschen Röhre, Ferdinand Braun. 1909 erhielt er als erster und bislang einziger Fuldaer den Nobelpreis für Physik für Verdienste in der Entwicklung der drahtlosen Telegrafie.'),
  //"assets/Hexenturm1.jpeg"
  Goal(49, "Dahliengarten", 50.553185695401275, 9.673375511555863,
  "assets/Dahliengarten.jpeg",
  'Der Dahliengarten bietet über 30 verschiedene Sorten an. Diese blühen hier im Spätsommer. Im Frühjahr gibt es eine Frühjahrsbepflanzung. Der Garten liegt versteckt hinter einer Mauer direkt gegenüber dem Domplatz und bietet Ruhe und Erholung. Neben den wunderschönen Dahlien hat man von hier einen schönen Blick auf den Hexenturm und die Türme des Fuldaer Doms. Der Garten hat von Juli bis zum ersten Frost geöffnet. Die Öffnungszeiten können je nach Witterung und Blütenstand abweichen.'),

  Goal(50, "Dom", 50.553990688908506, 9.672186743624346,
  "assets/Dom.jpeg",
  'Der Dom St. Salvator zu Fulda (Hoher Dom zu Fulda) ist die Kathedralkirche des Bistums Fulda. Er ist der Mittelpunkt im Fuldaer Barockviertel und das Wahrzeichen der Stadt Fulda. Der Dom trägt den Beinamen „St. Salvator“ und ist dem Erlöser Christus gewidmet. Auf dem obersten Giebel des Doms befindet sich die namensgebende Christusstatue mit dem Titel „Salvator Mundi“, was „Erlöser der Welt“ bedeutet. In beiden Türmen sind insgesamt 10 Glocken. Unter Fürstabt Adalbert von Schleifras wurde er 1704–1712 von Johann Dientzenhofer als dreischiffige Basilika errichtet und am 15. August 1712 auf das Patrozinium Christus Salvator geweiht. Der Dom diente zunächst als Abteikirche des Klosters Fulda. Seit der Erhebung der Fürstabtei Fuldas zum Fürstbistum im Jahre 1752 ist das Gotteshaus Kathedrale und damit Bischofskirche. Es ist gleichzeitig die Grabeskirche des heiligen Bonifatius. Seine Gebeine wurden auf den Wunsch des Heiligen hin in der Westkrypta der Klosterkirche bestattet. Bis heute ist sein Grab Ziel für Wallfahrer und Touristen.'),

  Goal(51, "Michaelskirche", 50.554783814084864, 9.672210028427147,
  "assets/Michaelskirche.jpeg",
  'Die Michaelskirche ist eine der ältesten Kirchen Deutschlands. Sie wurde im vorromanischen karolingischen Baustil im Auftrag von Abt Eigil in den Jahren von 820 bis 822 erbaut und diente als Begräbniskirche des 744 gegründeten Klosters Fulda, eines der führenden kulturellen Zentren des frühen Mittelalters, und als Grablege ihres Erbauers Eigil. Durch kleinere Anbauten im Norden und Süden entstand eine kreuzförmige romanische Anlage. Die einstige Friedhofskapelle wurde zur Kirche des Nebenklosters – der Propstei Michaelsberg. An der Außenfassade befinden sich die achtteilige Sonnenuhr und die Totenleuchte. Letzteres wurde früher entzündet, wenn ein Mönch starb. Im Totenmonat November brennt in die Nische eine Fackel für alle Verstorbenen. Am Westturm ist eine Gedenktafel, die an alle Fuldaer Weltkriegsopfer erinnern soll. Aufgrund ihres Alters und ihrer architektonischen Besonderheiten zählt sie zu den bedeutendsten mittelalterlichen Sakralbauten Deutschlands.'),

  Goal(52, "Paulustor", 50.55541048311547, 9.672854160571735,
  "assets/Paulustor.jpeg",
  'Das Paulustor in Fulda wurde in den Jahren von 1709 bis 1711 im barocken Stil nach Plänen von Johann Dientzenhofer errichtet. Es wurde dem biblischen Apostel Paulus gewidmet. Paulus ist in der Mitte auf dem Portal mit einem Schwert in der Hand zu sehen. Rechts von der Paulus-Statue befindet sich das Abbild des heiligen Simplicius mit einem Speer, einem Schild und einem Kreuz. Links von der Paulus-Statue ist der heiliger Faustinus in Sandstein abgebildet mit einem Speer und einem Schild. Auf seinem Schild sind eine Lilie und ein halber Reichsadler erkennbar. Die beiden Brüder Simplicius und Faustinus wurden um 300 während der Christenverfolgung in Rom hingerichtet und gelten als christliche Märtyrer. Sie sollen die Stadt Fulda am Eingangstor vor Feinden beschützen und symbolisieren die Verteidigung des christlichen Glaubens. Das Tor befand sind ursprünglich zwischen dem Stadtschloss und der Hauptwache und trennte den damaligen Stiftsbezirk von der Bürgerstadt. Erst 1771 wurde es auf Wunsch von Fürstbischof Heinrich von Bibra an seinen jetzigen Standort am Ende der Pauluspormenade versetzt und mit Seitenanbauten versehen.'),

  Goal(53, "Orangerie", 50.555680067953666, 9.674171211122337,
  "assets/Orangerie.jpeg",
  'Die Orangerie wurde im 18. Jahrhundert, nach Plänen des Mainzer Oberbaudirektors Maximilian von Welsch, in direkter Sichtlinie zum Stadtschloss erbaut. Ursprünglich sollte das Gebäude den Zitronen- und Orangenbäumchen des Schlossgartens im Winter Schutz bieten. Im Sommer veranstalteten die Fürstäbte dort ausschweifende Feste mit prominenten Gästen. Auch heute finden noch im Festsaal der Orangerie Veranstaltungen statt. Besonders sehenswert ist der Apollosaal in der Mitte des Gebäudes, der heute Frühstücksraum und Café des angeschlossenen Hotels ist. Das Deckenfresko mit dem Spiegelgewölbe zeigt in der Mitte Sonnengott Apoll mit seinem Sonnenwagen. Direkt vor dem Hauptgebäude, in der Mitte der Freitreppe, blickt eine fast sieben Meter große Skulptur über den Garten, die aus nur einem Steinblock gehauen wurde. Diese sogenannte Floravase zeigt Flora, die römische Göttin der Gartenbaukunst. Flora hält eine goldene Lilie in der Hand. Dies ist ein Symbol für den damaligen Auftraggeber Fürstabt Adolf von Dalberg.'),
   //"assets/Orangerie1.jpeg",
  Goal(54, "Schlossgarten", 50.55470795347148, 9.674647378499147,
  "assets/Schlossgarten.jpeg",
  'Der bei Besuchern und Bewohnern beliebte Schlossgarten ist von weitläufigen Mauern und Gittern umschlossen. Die Anlage setzt sich aus mehreren Teilen zusammen: Schloss- und Orangerieterrasse, dem dazwischen liegenden Parterre mit dem großen Fontainebrunnen und dem ehemaligen Boskettgarten. Im frühen 18. Jahrhundert lies Fürstabt Constantin von Buttlar den ehemaligen Tiergarten einebnen, um einen Barockgarten mit Orangerie anlegen zu lassen. Im Jahr 1994 wurde die Parkanlage anhand des ursprünglichen Zustandes rekonstruiert. Der Schlossgarten wird zurzeit für die Landesgartenschau 2023 umgebaut und verschönert. Besuchen Sie diese gerne zwischen dem 27.04.23 und dem 08.10.23.'),


  Goal(55, "Stadtschloss", 50.5539126125534, 9.675861081498654,"assets/Schloss.jpeg",
  'Das barocke Fuldaer Stadtschloss wurde 1708 bis 1714 als Residenz der Fuldaer Fürstäbte und später der Fürstbischöfe erbaut. Grundmauern und Turm der Vierflügelanlage stammen zum Teil noch aus den Vorgängerbauten, der alten Abtsburg bzw. einem Renaissanceschloss aus dem 17. Jahrhundert. Der Architekt der Schlossanlage war Johann Dientzenhofer. Sein Auftraggeber war Fürstabt Adalbert von Schleifras. Der Großteil des Schlosses dient heute als Sitz der Stadtverwaltung. Viele der historischen Räume können besichtigt werden und befinden sich nahezu im Originalzustand. Da ist etwa der prächtige Fürstensaal, der regelmäßig für klassische Konzerte oder andere kulturelle Veranstaltung genutzt wird. Auch die Sitzungen der Stadtverordnetenversammlung werden hier abgehalten. Herzstück des Schlosses ist aber der Wohntrakt der Fürstäbte und später der Fürstbischöfe. Ein besonderer Raum ist der Spiegelsaal (auch Spiegelkabinett genannt). Dieser ehemalige Ankleideraum des Fürstabtes ist mit hunderten kleinen und großen Spiegeln ausgestattet. Das Stadtschloss beherbergt auch ein Museum, in dem unter anderem eine Porzellansammlung zu bestaunen ist. Außerdem ist eine große Anzahl an Kunstwerken ausgestellt. Einige Exponate erinnern auch an den Fuldaer Wissenschaftler und Nobelpreisträger Ferdinand Braun, dem Erfinder der Braunschen Röhre.'),


//Kneipen Tour

  Goal(56, "Viva Havanna", 50.55337036403691, 9.674579680472318,
  "assets/VivaHavanna.jpeg",'Mexikanisches Restaurant und Cocktails https://www.viva-havanna.com/'),

  Goal(57, "Zum Stadtwächter", 50.55235162161597, 9.67489327759112,
  "assets/Stadtwächter.jpeg",'Kneipe'),

  Goal(58, "Alte Schule", 50.55117017377206, 9.678092456761885,
  "assets/AlteSchule.jpeg",
  'Restaurant und Bar \n https://alteschule-fulda.de/'),

  Goal(59, "Heimat", 50.55012994057499, 9.677878143176121,
  "assets/Heimat.jpeg",
  'Restaurant und Bar \n https://www.heimat-fulda.de/'),

  Goal(60, "Windmühle", 50.54968982714987, 9.676474612130326,
  "assets/Windmühle.jpeg",
  'Kneipe \n https://www.windmuehle-fulda.de/'),

  Goal(61, "Schöppchen", 50.54980026171069, 9.676127010903926,
  "assets/Schöppchen.jpeg",
  'Kneipe \n http://www.schöppchen.de/'),

  Goal(62, "CaramBar", 50.54977707643142, 9.676033223049973,
  "assets/CaramBar.jpeg",
  'Bar \n https://carambar-fulda.de/'),

  Goal(63, "Bar 22", 50.54975959849822, 9.675940994162232,
  "assets/Bar22.jpeg",
  'Bar'),

  Goal(64, "Krokodil", 50.54948803860637, 9.675714347994228,
  "assets/Krokodil.jpeg",
  'Kneipe'),

  Goal(65, "Barock Bar", 50.54980476069548, 9.675631947999545,
  "assets/BarockBar.jpeg",
  'Bar \n https://barockbar-fulda.de/'),

  Goal(66, "Altstadt", 50.549882009666334, 9.675612361093014,
  "assets/Altstadt.jpeg",'Kneipe'),

  Goal(67, "Gasthaus zum Eck", 50.551160400536766, 9.674450698116186,
  "assets/ZumEck.jpeg",
  'Kneipe'),


];

Future<void> dialogBuilder(BuildContext context,int i) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(child: Text(style: TextStyle(fontSize: 25),goals[i].name)),
        content: Column(
          //if(goals[i].picture=!0){
            children: [
            Container(

            width: 250,
            height: 250,
              padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 3.0),
              child: Image.asset(goals[i].picture),
            ),
            SizedBox(

              width: 250,
              height: 250,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,//.horizontal
                child:Text(goals[i].infoText,style: TextStyle(fontSize: 20),),
            ),
            )],

        ),




        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.green,
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Schließen'),
            onPressed: () {
              Navigator.of(context).pop();
            },

          ),
        ],
      );
    },
  );
}
Future<void> dialogBuilderNonPic(BuildContext context,int i) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(child: Text(style: TextStyle(fontSize: 25),goals[i].name)),
        content: Column(
          //if(goals[i].picture=!0){
          children: [

            SizedBox(

              width: 250,
              height: 250,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,//.horizontal
                child:Text(goals[i].infoText,style: TextStyle(fontSize: 20),),
              ),
            )],

        ),




        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.green,
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Schließen'),
            onPressed: () {
              Navigator.of(context).pop();
            },

          ),
        ],
      );
    },
  );
}