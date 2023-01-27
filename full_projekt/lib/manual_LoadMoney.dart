import 'package:flutter/material.dart';

class ManualLoadMoney extends StatelessWidget {
  const ManualLoadMoney({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 60, left: 30),
          child: SizedBox(
              child: Text('Geld auf \nStudienkarte laden',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
        ),
        buildGreenLine(),
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
          child: SizedBox(
            child: Text(
              'In der Mensa befinden sich zwei Geldbörsenaufwertungsgeräte.'
              '\n\nAn diesen Automaten kannst du mit Bargeld Guthaben auf deine Chipkarte laden. '
              '\n\nVor der ersten Aufwertung musst du einmalig die Geldbörse initialisieren. \n Das dafür notwendige Gerät befindent sich ebenfalls in der Mensa.',
              style: TextStyle(fontSize: 15),
            ),
          ),
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
