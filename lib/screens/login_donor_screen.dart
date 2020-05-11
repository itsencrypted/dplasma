import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dplasma/components/dharma_button.dart';
import 'package:dplasma/screens/map_bloodbanks_ny_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DonorLoginScreen extends StatefulWidget {
  static const String id = 'donorLogin_screen';

  @override
  _DonorLoginScreenState createState() => _DonorLoginScreenState();
}

class _DonorLoginScreenState extends State<DonorLoginScreen> with SingleTickerProviderStateMixin{
  var cities = ['New York', 'Paris', 'Miami', 'São Paulo'];


  SharedPreferences prefs;
  AnimationController controller;
  Animation animation;



  String selectedItem = "select";
  List<DropdownMenuItem<String>> cities_dropdown = List();

  @override
  void initState() {
    super.initState();
    cities_dropdown.clear();

    cities_dropdown.add(
      DropdownMenuItem(
        value: 'select',
        child: Text('Please select your city:'),
      ),
    );

    var i = 0;
    while (i < cities.length) {
      cities_dropdown.add(DropdownMenuItem(
        value: cities[i],
        child: Text(cities[i]),
      ));
      i++;
    }
    setState(() {});



  controller = AnimationController(
  duration: Duration(seconds: 8),
  vsync: this,
  );
  animation =
  ColorTween(begin: Colors.white, end: Colors.black).animate(controller);
  controller.forward();
  controller.addListener(() {
  setState(() {});
  });
}


@override
void dispose() {
  controller.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    //Todo : esta tela vai receber a public key do doador
    // mesma coisa do ambherdata, quando ele esta
    // escolher cidade, nova york please display
    return Scaffold(
      backgroundColor: Colors.black,
        body: Center(
            child: Column(children: <Widget>[
              SizedBox(height: 50),
              Image.asset('assets/images/icon-donate.png', height: 400,),
              SizedBox(
                width: 450.0,
                child: ColorizeAnimatedTextKit(
                    onTap: () {
                      print("Tap Event");
                    },
                    text: [
                      'Welcome to dPlasma',
                      'Please select your current city',
                      'Welcome to dPlasma',
                      'Please select your current city',
                    ],
                    textStyle: TextStyle(
                      fontSize: 40.0,
                      fontFamily: "Horizon",
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                    colors: [
                      Colors.purple,
                      Colors.blue,
                      Colors.yellow,
                      Colors.red,
                    ],
                    textAlign: TextAlign.center,
                    alignment: AlignmentDirectional
                        .topStart // or Alignment.topLeft
                ),
              ),
              DropdownButton(
                style: TextStyle(color: Colors.grey.shade700),
                items: cities_dropdown,
                value: selectedItem,
                onChanged: (value) {
                  setState(() {
                    selectedItem = value;
                  });
                },
              ),
              DharmaButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, MapBloodBanksScreen.id);
                },
                titleOfButton: 'Find the closest Blood Bank',
              ),
            ])));
  }
}
