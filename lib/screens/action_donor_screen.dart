import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dplasma/components/dharma_button.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

class DonorActionScreen extends StatefulWidget {
  static const String id = 'donorAction_screen';

//  https://pub.dev/packages/geolocator#-readme-tab-

  @override
  _DonorActionScreenState createState() => _DonorActionScreenState();
}

class _DonorActionScreenState extends State<DonorActionScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void getCurrentLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

//NYU Hospital @40.742746,-73.9759226,
//Mount Sinai Hospital @40.7899953,-73.9571022

// New York Blood Center: @40.7494885,-73.9895941,
  final kLightGreen = Color(0xFF95E08E);
  @override
  Widget build(BuildContext context) {
    // Funcao ir no banco de sangue colido e "action" donation
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 400,
              child: TextLiquidFill(
                // loadDuration: Duration(
                //   seconds: 35
                // ),
                waveDuration: Duration(seconds: 35),
                text: 'Donating',
                waveColor: Colors.amber,
                boxBackgroundColor: Colors.black,
                textStyle: TextStyle(
                  fontSize: 80.0,
                  fontWeight: FontWeight.bold,
                ),
                boxHeight: 113.0,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            DharmaButton(
              onPressed: () {},
              titleOfButton: 'Register plasma donation in the Blockchain',
            ),
          ],
        ),
      ),
    );
  }
}
