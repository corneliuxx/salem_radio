import 'package:flutter/material.dart';
import 'rounded_bordered_container.dart';
//import 'package:flutter_ui_challenges/src/pages/invitation/inauth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:davistar_media/pages/sadaka.dart';

const TextStyle boldText = TextStyle(
  fontWeight: FontWeight.bold,
);

class Kawaida extends StatelessWidget {
  static final String path = "lib/kawaida.dart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "SADAKA KWA JUKWAA",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            const SizedBox(height: 15.0),

            RoundedContainer(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [

                  ListTile(
                    title: Text("Jukwaa hili limeanzishwa na vijana kama njia yao ya kumtumikia Mungu na kuhakikisha NENO la Ufalme wa mbinguni linawafikia wengi kote ulimwenguni."),
                  ),
                  ListTile(
                    title: Text("Katika uendeshaji kuna gharama mbali mbali ambazo zinatumika ili tuendelee kuwa live lakini pia tunayo maono ya kuboresha Zaidi Jukwaa hili."),
                  ),
                  ListTile(
                    title: Text("Endapo Mungu amekugusa kutoa sadaka yako kwa ajili ya kusupport unedeshwaji wa Jukwaa hili Tuma sadaka yako kwa namba zilizopo hapo chini au kama utahitaji kutoa sadaka kwa njia nyingine tafadhali wasiliana nasi kwa whatsapp au Kawaida kwa namba zifuatazo."),
                  ),
                ],
              ),

            ),
            RoundedContainer(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListTile(

                    title: Text("0754 222 800 – Jackson Swebe"),

                  ),
                  ListTile(
                    title: Text("0745 640 680 – Walter Kimaro"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20.0),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 32.0,
              ),

            )
          ],
        ),
      ),
    );
  }
}