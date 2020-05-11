import 'package:flutter/material.dart';

class PatientLoginScreen extends StatefulWidget {
  static const String id = 'PatientLogin_screen';

  @override
  _PatientLoginScreenState createState() => _PatientLoginScreenState();
}

class _PatientLoginScreenState extends State<PatientLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Column(
        children: <Widget>[
      Text('Inactive Screen.', style: TextStyle(color: Colors.white),),
        ],
      ),
    );
  }
}
