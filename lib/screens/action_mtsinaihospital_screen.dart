import 'package:dplasma/constants.dart';
import 'package:dplasma/screens/login_hematologist_screen.dart';
import 'package:flutter/material.dart';
import 'package:dplasma/models/registration_form.dart';
import 'package:google_fonts/google_fonts.dart';

class MtSinaiHospitalActionScreen extends StatefulWidget {
  static const String id = 'MtSinaihospitalAction_screen';

  @override
  _MtSinaiHospitalActionScreenState createState() =>
      _MtSinaiHospitalActionScreenState();
}

class _MtSinaiHospitalActionScreenState extends
State<MtSinaiHospitalActionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              PersonaActionAvatar(
                personaImage: ('assets/images/mtsinaihospital.jpg'),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, HematologistLoginScreen.id);
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text('Mt Sinai Hospital\n'
                  '\n'
                  'Main Directory', style: hospitalFont),
              SizedBox(height: 50,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('A -',
                      style: GoogleFonts
                          .pressStart2p(
                          textStyle: TextStyle(
                            fontSize: 16.0,
                            color: Colors.yellow,))),
                  Text('Request quantity:[1]', textAlign: TextAlign.left,
                      style: GoogleFonts
                          .pressStart2p(
                          textStyle: TextStyle(
                              fontSize: 16.0,
                              color: Colors.yellow))),
                  SizedBox(height: 30),
                  Column(
                    children: <Widget>[
                      Text('Convalescent Plasma Program_', style:
                      hospitalFont),
                      Row(
                        children: <Widget>[
                          ButtonBar(
                            children: <Widget>[
                              SizedBox(width: 50,),
                              FlatButton(onPressed: () {},
                                child: Text('A+', style: smallhospitalFont,),
                                color: Colors.white54,),
                              FlatButton(onPressed: () {},
                                child: Text('A-', style: smallhospitalFont,),
                                color: Colors.white54,),
                              FlatButton(onPressed: () {},
                                child: Text('B+', style: smallhospitalFont,),
                                color: Colors.white54,),
                              FlatButton(onPressed: () {},
                                child: Text('B-', style: smallhospitalFont,),
                                color: Colors.white54,),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          ButtonBar(children: <Widget>[
                            SizedBox(width: 50,),
                            FlatButton(onPressed: () {},
                              child: Text('AB+', style: smallhospitalFont,),
                              color: Colors.white54,),
                            FlatButton(onPressed: () {},
                              child: Text('AB-', style: smallhospitalFont,),
                              color: Colors.white54,),
                            FlatButton(onPressed: () {},
                              child: Text('O+', style: smallhospitalFont,),
                              color: Colors.white54,),
                            FlatButton(onPressed: () {},
                              child: Text('O-', style: smallhospitalFont,),
                              color: Colors.white54,),
                          ],)
                        ],
                      )
                    ],
                  ),
                  Text('Press to Request', textAlign: TextAlign.left,
                      style: GoogleFonts
                          .pressStart2p(
                          textStyle: TextStyle(
                              fontSize: 16.0,
                              color: Colors.yellow))),
                  SizedBox(height: 20,),
                  Text('Provider: NY Blood Center', textAlign: TextAlign.left,
                      style: GoogleFonts
                          .pressStart2p(
                          textStyle: TextStyle(
                              fontSize: 12.0,
                              color: Colors.blueAccent))),
                ],
              ),
            ],
          ),
        )
    );
  }
}