import 'package:flutter/material.dart';

class ManualFindRoom extends StatelessWidget {
  const ManualFindRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 60, left: 30),
          child: SizedBox(
              child: Text('Unterrichtsraum \nfinden',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
        ),
        buildGreenLine(),
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
          child: SizedBox(
            child: Text(
              'Zum Finden des Unterrichtsraums gilt folgende Regel:',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 50),
          child: SizedBox(
            child: Text(
              'Gebäude . Raum',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 30),
          child: SizedBox(
              child: Image.asset('assets/room_Example.PNG', width: 350)),
        ),
      ],
    ));
  }

  Padding buildGreenLine() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Image.asset(
        'assets/line_green.PNG',
        width: 60,
      ),
    );
  }
}
