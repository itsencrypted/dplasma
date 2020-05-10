import 'package:flutter/material.dart';

class DonorLoginScreen extends StatefulWidget {
  static const String id = 'donorLogin_screen';

  @override
  _DonorLoginScreenState createState() => _DonorLoginScreenState();
}

class _DonorLoginScreenState extends State<DonorLoginScreen> {
  @override
  Widget build(BuildContext context) {
    //Todo : esta tela vai receber a public key do doador
    // mesma coisa do ambherdata, quando ele esta 
    // escolher cidade, nova york please display
    return Scaffold(
        body: Center(
            child: Column(
                children: <Widget>[
                  Text('This is Donor Login Screen'),
                  Text('Please select your city'),
                  Text('Welcome to NY, please click to find the closest Blood'
                      ' Bank'),
                ]
            )
        ));
  }
}

