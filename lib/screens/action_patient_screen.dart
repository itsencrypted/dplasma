import 'dart:ui';

import 'package:dplasma/components/dharma_button.dart';
import 'package:dplasma/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class PatientActionScreen extends StatefulWidget {
  static const String id = 'PatientAction_screen';

  @override
  _PatientActionScreenState createState() => _PatientActionScreenState();
}

class _PatientActionScreenState extends State<PatientActionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 100,),
            Image.asset('assets/images/patient1.jpg', height: 120,),
            Center(
              child: Text('Nothing you can do at this point, please hope for a '
                  'plasma '
                  'donor to save your life.', style: TextStyle(color: Colors
                  .amber, fontSize: 30,),),
            ),
            Image.asset('assets/images/icon-patient.png'),
            DharmaButton(titleOfButton: 'Return',
            onPressed: (){
              Navigator.pushReplacementNamed(context, WelcomeScreen.id);
            },)
          ],
        ),
      ),
    );
  }
}
