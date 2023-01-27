import 'package:flutter/material.dart';
import 'package:full_projekt/manual_FindRoom.dart';
import 'package:full_projekt/manual_overview.dart';
import 'package:full_projekt/manual_ValidateCard.dart';
import 'package:full_projekt/manual_WLAN.dart';

class Overview extends StatelessWidget {
  const Overview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Image.asset(
              'assets/logo2.PNG',
              alignment: Alignment.center,
            ),
          ),
          Container(
            child: Image.asset(
              'assets/lessons.PNG',
              alignment: Alignment.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: SizedBox(
              child: Text("Brauchst du Hilfe?",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: buildLink(context,"WLAN einrichten", const ManualWlan()),
              ),
              Expanded(
                  child: buildLink(context,"Karte validieren", const ManualValidateCard()),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: buildLink(context,"Raum finden", const ManualFindRoom()),
              ),
              Expanded(
                  child: buildLink(context,"...", const ManualOverview()),
              ),
            ],
          )
        ],
      ),
    );
  }
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
            fixedSize: Size.fromWidth(170),
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
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          )),
    ),
  );
}

