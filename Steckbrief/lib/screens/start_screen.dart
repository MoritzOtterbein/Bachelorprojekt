


class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Mo",
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
                    child: Image.asset("assets/malidiven.jpg")
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondScreen())
                  );
                }, child: Text("Grüss Dich"),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StackScreen())
                  );
                }, child: Text("Stack"),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DatenschutzScreen())
                  );
                }, child: Text("Datenschutz"),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Abindenurlaub())
                  );
                }, child: Text("AbindenUrlaub"),
              ),
              macheZeile(
                text: "Geburtstag: 08.09.2002",
              ),
              macheZeile(
                  text: "Augenfarbe: grün"
              ),
              macheZeile(
                  text: "Haarfarbe: braun"
              ),
              macheZeile(
                  text: "ich bin eine Nudel"
              ),
              macheZeile(
                  text: "mir fällt nichts mehr ein"
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget macheZeile({text: "hallo"}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 300,
        color: Colors.pink,
        child: Text(text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.blueAccent,
            fontSize: 48.0,
          ),
        ),
      ),
    );
  }
}
