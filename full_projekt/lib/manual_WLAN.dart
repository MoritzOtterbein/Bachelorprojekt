import 'package:flutter/material.dart';

class ManualWlan extends StatelessWidget {
  const ManualWlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 60, left: 30),
            child: SizedBox(
                child: Text('Hochschul-WLAN einrichten',
                    style:
                        TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
          ),
          buildGreenLine(),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
            child: SizedBox(
              child: Text(
                '1. Bitte installiere die App "eduroam CAT" im App oder Play Store, um das benötigte Konfigurationsprofil zu installieren. '
                '\n\n2. Bei öffnen von "eduroam CAT" ist die Freigabe für Ihr Gerätestandort nicht notwendig. \n\n 3. Starte eine manuelle Suche und gebe "Fulda" in das Suchfeld ein. '
                '\n\n4. Wähle "Hochschule Fulda" aus. '
                '\n\n5. Nun verlangt die App Zugriff auf "Fotos, Medien und Dateien". Diese Berechtigung ist zwingend notwendig, da im weiteren Verlauf Zertifikate im Gerätespeicher abgelegt werden müssen.'
                '\n\n6. Tippe auf "Installieren". '
                '\n\n7. Geben sie Ihre fd-Nummer@hs-fulda.de und Ihr Passwort ein. '
                '\n\n8. Tippe zuletzt erneut auf "Installieren".)',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
            child: SizedBox(
              child: Text(
                'Wähle eduroam aus.'
                '\n\n Benutzername: \t <FD-Kennung>@hs-fulda.de'
                '\n\n Passwort: \t Passwort deiner FD-Kennung',
                style: TextStyle(fontSize: 15),
              ),
            ),
          )
        ],
      ),
    );
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
