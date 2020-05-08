import 'package:flutter/material.dart';

class HematologistSignUpScreen extends StatefulWidget {
  static const String id = 'hematologistReg_screen';

  @override
  _HematologistSignUpScreenState createState() =>
      _HematologistSignUpScreenState();
}

class _HematologistSignUpScreenState extends State<HematologistSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.maxFinite,
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  image: DecorationImage(
                      image: AssetImage('assets/images/hematologist.png'),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text('Sign Up', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'City'
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            
          ],
        ),
      ),
    );
  }
}
