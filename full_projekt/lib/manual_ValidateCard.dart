import 'package:flutter/material.dart';

class ManualValidateCard extends StatelessWidget {
  const ManualValidateCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 60, left: 30),
          child: SizedBox(
              child: Text('Studienkarte \nvalidieren',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
        ),
        buildGreenLine(),
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
          child: SizedBox(
            child: Text(
              'Du erhälst deine Chipkarte für die Dauer deines Studiums bei uns an der Hochschule.'
              '\n\nDie Chipkarte ist immer ein Semester gültig. Nachdem du dich für das kommende Semester zurückgemeldet hast, musst du an den Validierungsautomaten im SSC das Gültigkeitsdatum aktualisieren',
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
