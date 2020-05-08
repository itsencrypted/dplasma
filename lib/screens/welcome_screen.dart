import 'package:dplasma/screens/login_donor_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  String selectedItem = "select";

  final kLightBlueish = Color(0xFF33BBB5);
  final kLightGreen = Color(0xFF95E08E);
  List<DropdownMenuItem<String>> types_dropdown = List();

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 15),
      vsync: this,
    );
    animation =
        ColorTween(begin: kLightBlueish, end: kLightGreen).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });

    types_dropdown.clear();

    types_dropdown.add(
      DropdownMenuItem(
        value: 'select',
        child: Text('Please select your role:'),
      ),
    );
    var types = [
      'Donor',
      'Patient/Family Member',
      'Blood Bank',
      'Hospital',
      'Doctor',
      'Hematologist'
    ];

    var i = 0;
    while (i < types.length) {
      types_dropdown.add(DropdownMenuItem(
        value: types[i],
        child: Text(types[i]),
      ));
      i++;
    }
    setState(() {});
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Hero(
                      tag: 'logo',
                      child: Container(
                          child: Image.asset('assets/images/virus.png'),
                          height: 400),
                    ),
                  ),
                  Text(
                    'dPlasma',
                    style: TextStyle(fontSize: 60.0, color: Color(0xFFFFFFFF)),
                  ),
                  Text(
                    'Passive Immunity to Patients',
                    style: TextStyle(
                        fontSize: 20, color: Colors.white, letterSpacing: 2.5),
                  ),
                  DropdownButton(
                    items: types_dropdown,
                    onChanged: (item) {
                      setState(() => selectedItem = item);
                    },
                    value: selectedItem,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  MaterialButton(onPressed: () {
                    switch (selectedItem) {
                      case "Donor":
                        Navigator.pushReplacementNamed(
                            context, DonorLoginScreen.id);
                        break;
                      case "Patient/Family Member":
                        break;
                      default:
                        break;
                    }
                    
                  },child: Text('LOGIN'),)
//                  RoundedButton(
//                    titleOfButton: 'I\'m a Patient | Family Member',
//                    colorOfButton: Colors.yellow,
//                    onPressed: () {Navigator.pushNamed(context, LoginScreen.id);},),
//                  RedRoundedButton(
//                    titleOfButton: 'I\'m here to Donate',
//                    onPressed: () {Navigator.pushNamed(context, LoginScreen.id);},),
//                  LittleBlackButton(
//                    titleOfButton: 'Sign up',
//                    onPressed: () {
//                      Navigator.pushNamed(context, RegistrationScreen.id);},),
//                  LittleBlackButton(
//                    titleOfButton: 'Sign up with Web3',
//                    onPressed: () {
//                      Navigator.pushNamed(context, Web3Screen.id);},),
//                  LittleBlackButton(
//                    titleOfButton: 'Connect with Amberdata',
//                    onPressed: () {
//                      Navigator.pushNamed(context, AmberdataScreen.id);},),
                ]),
          ),
        ),
      ),
    );
  }
}
