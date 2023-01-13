import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xB50D40C7),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return  Scaffold(

      body: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 48, 0.0, 32.0),
        child: Column(children: const [
          TrackingElement(color: Color(0xFFC90101),iconData: Icons.access_alarm,),
          TrackingElement(color: Color(0xFFFFFFFF), iconData: Icons.abc_rounded,),
          TrackingElement(color: Color(0xFF020101), iconData: Icons.accessible_outlined,),
        ],)
      ),

    );
  }
}


class TrackingElement extends StatefulWidget {
  const TrackingElement({Key? key, required this.color, required this.iconData}) : super(key: key);
  final Color color;
  final IconData iconData;
  @override
  // ignore: library_private_types_in_public_api
  _TrackingElementState createState() => _TrackingElementState();
}

class _TrackingElementState extends State<TrackingElement> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(padding: const EdgeInsetsDirectional.fromSTEB(32.0, 64, 32.0, 8.0),
          child: Row(children:  <Widget> [
            Icon(widget.iconData, color: Colors.white70, size: 50),
            const Text(
              '2300/5000m:',
              style: TextStyle(color:Colors.white),
            ),
          ],),
        ),
        LinearProgressIndicator(value: 0.3,
            color: widget.color,
            backgroundColor: const Color(0xFFFFFFFF)
        )
      ],
    );
  }
}

