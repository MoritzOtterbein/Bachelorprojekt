import 'package:full_projekt/manual_FindRoom.dart';
import 'package:full_projekt/manual_LoadMoney.dart';
import 'package:full_projekt/manual_ValidateCard.dart';
import 'package:full_projekt/manual_WLAN.dart';
import 'package:flutter/material.dart';

class ManualOverview extends StatelessWidget {
  const ManualOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 60, left: 30),
            child: SizedBox(
                child: Text('Wobei brauchst du Hilfe?',
                    style:
                        TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
          ),
          buildHeadline('WLAN'),
          buildGreenLine(),
          buildLink(context,"Hochschul-WLAN einrichten", const ManualWlan()),
          buildHeadline('Karte'),
          buildGreenLine(),
          buildLink(context,"Karte mit Guthaben aufladen", const ManualLoadMoney()),
          buildLink(context,"Karte validieren", const ManualValidateCard()),
          buildHeadline('Unterricht'),
          buildGreenLine(),
          buildLink(context,"Unterrichtsraum finden", const ManualFindRoom()),
          buildLink(context,"Stundenplan in die App einbinden", const ManualOverview()),
        ],
      ),
    );
  }

  Padding buildGreenLine() {
    return Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset('assets/line_green.PNG', width: 60,),
        );
  }

  Padding buildHeadline(name) {
    return Padding(
          padding: EdgeInsets.only(left: 20, top: 50),
          child: SizedBox(
              child: Text(name,
                  style:
                      TextStyle(fontSize: 28, fontWeight: FontWeight.bold))),
        );
  }

  Padding buildLink(BuildContext context, name, link) {
    return Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Center(
            child: ElevatedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  elevation: 8,
                  shadowColor: Color.fromRGBO(127, 201, 16, 1.0),
                  fixedSize: Size.fromWidth(350),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => link),
                  );
                },
                child: Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
          ),
        );
  }
}
