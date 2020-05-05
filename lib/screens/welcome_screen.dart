import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

  AnimationController controller;
  Animation animation;

  final kLightBlueish = Color(0xFF33BBB5);
  final kLightGreen = Color(0xFF95E08E);

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animation = ColorTween(begin: kLightBlueish, end: kLightGreen).animate
      (controller);
    controller.forward();
    controller.addListener((){
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
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding (
        padding: EdgeInsets.symmetric (horizontal: 24.0),
        child: Center(
          child: SafeArea(
            child: Column (
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Hero(
                      tag: 'logo',
                      child: Container (
                          child: Image.asset('images/logo-transparent.png'),
                          height: 400),
                    ),
                  ),
                  Text ('Count on Me ', style: TextStyle (fontSize: 60.0, color: Color (0xFFFFFFFF)),),
                  Text('Platelets to Patients', style: TextStyle (fontSize: 20, color: Colors.white, letterSpacing: 2.5),),
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
                ]
            ),
          ),
        ),
      ),
    );
  }
}