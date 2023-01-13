import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Nicos App",
          ),
        ),
        body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 200,
                      width: 200,
                      child: Image.asset("sheldon.jpg"),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async{
                    print("Hello World");
                  }, child: Text("Hallo")),
                  machZeile("24"),
                  machZeile("Augenfarbe: blau"),
                ],
              ),
            )));
  }

  Widget machZeile(a, {text: "42"}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 300,
        color: Colors.black12,
        child: Text(
          a,
          style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 48.0
          ),
        ),
      ),
    );
  }
}

// stl
// Container -> alt enter import material
// Parameter -> strg space
// padding: alt enter container -> padding