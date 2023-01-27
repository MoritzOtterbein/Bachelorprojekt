import 'package:flutter/material.dart';
import 'dart:convert';
import 'plan.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

Future<Plan> getPlan() async {
  final response = await http.get(Uri.parse(
      'https://uni-giessen.maxmanager.xyz/extern/mensa-hochschule-fulda.json'));
  if (200 == response.statusCode) {
    return planFromJson(response.body);
  } else {
    throw Exception('Failed');
  }
}

class Mensa extends StatefulWidget {
  const Mensa({Key? key}) : super(key: key);

  @override
  State<Mensa> createState() => _MensaState();
}

class _MensaState extends State<Mensa> {
  late Future<Plan> futurePlan;

  @override
  void initState() {
    super.initState();
    futurePlan = getPlan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Center(
            child: SizedBox(
              child: Text(
                DateFormat('EEEE').format(DateTime.now()),
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Center(
            child: SizedBox(
              child: Text(
                DateFormat('dd-MM-yyyy').format(DateTime.now()),
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(),
                child: Image.asset(
                  'assets/line_green.PNG',
                ),
              ),
            ),
            Expanded(
                child:Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Center(
                    child: SizedBox(
                      child: Text(
                        'Mittagessen',
                        style: TextStyle(fontSize: 23),
                      ),
                    ),
                  ),
                ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(),
                child: Image.asset(
                  'assets/line_green180.PNG',
                ),
              ),
            ),

          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Center(
            child: SizedBox(
              child: Text(
                '11:15 - 14:00 Uhr',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
        ),
        buildMenu(0),
        buildMenu(1),
        buildMenu(2),
        buildMenu(3),
        buildMenu(4),
        buildMenu(5),
      ],
    )

        /*Center(
        child: FutureBuilder<Plan>(
          future: futurePlan,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.items[5].descriptionClean);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),*/
        );
  }

  Container buildMenu(index) {
    ;
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30, left: 30),
                    child: SizedBox(
                      child: FutureBuilder<Plan>(
                        future: futurePlan,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              snapshot.data!.items[index].artikelClean,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            );
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }
                          return const CircularProgressIndicator();
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30, right: 30),
                    child: SizedBox(
                      child: FutureBuilder<Plan>(
                        future: futurePlan,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              snapshot.data!.items[index].prices.student + '€',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.end,
                            );
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }
                          return const CircularProgressIndicator();
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.only(top: 5, left: 30),
              child: SizedBox(
                child: FutureBuilder<Plan>(
                  future: futurePlan,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data!.items[index].beschreibungClean,
                        style: TextStyle(fontSize: 15),
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
