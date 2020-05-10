import 'package:dplasma/constants.dart';
import 'package:flutter/material.dart';
import 'package:dplasma/models/registration_form.dart';
import 'package:google_fonts/google_fonts.dart';

class NYUHospitalActionScreen extends StatefulWidget {
  static const String id = 'NYUhospitalAction_screen';

  @override
  _NYUHospitalActionScreenState createState() =>
      _NYUHospitalActionScreenState();
}

class _NYUHospitalActionScreenState extends State<NYUHospitalActionScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            PersonaActionAvatar(
              personaImage: ('assets/images/nyuhospital.jpg'),
              onPressed: (){Navigator.pop(context);},
            ),
            SizedBox(
              height: 20,
            ),
            Text('NYU Hospital\n'
                '\n'
                'Main Directory', style: hospitalFont),
            SizedBox(height: 50,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text( 'B -',
                    style: GoogleFonts
                        .pressStart2p(
                        textStyle: TextStyle(
                          fontSize: 16.0,
                          color: Colors.yellow,))),
                Text( 'Request quantity:[1]',  textAlign: TextAlign.left,
                    style: GoogleFonts
                        .pressStart2p(
                        textStyle: TextStyle(
                            fontSize: 16.0,
                            color: Colors.yellow))),
                SizedBox(height: 30,),
                Text( 'AB +',  textAlign: TextAlign.left,
                    style: GoogleFonts
                        .pressStart2p(
                        textStyle: TextStyle(
                            fontSize: 16.0,
                            color: Colors.yellow))),
                Text( 'Request quantity:[1]',  textAlign: TextAlign.left,
                    style: GoogleFonts
                        .pressStart2p(
                        textStyle: TextStyle(
                            fontSize: 16.0,
                            color: Colors.yellow))),
              ],
            ),

            SizedBox(height:30),
            Column(
              children: <Widget>[
                Text( 'Convalescent Plasma Program_', style:
                hospitalFont),
                Row(
                  children: <Widget>[
                    ButtonBar(
                      children: <Widget>[
                        SizedBox(width: 50,),
                        FlatButton(onPressed: (){},
                          child: Text('A+', style: smallhospitalFont,),
                          color: Colors.white54,),
                        FlatButton(onPressed: (){},
                          child: Text('A-', style: smallhospitalFont,),
                          color: Colors.white54,),
                        FlatButton(onPressed: (){},
                          child: Text('B+', style: smallhospitalFont,),
                          color: Colors.white54,),
                        FlatButton(onPressed: (){},
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
                      FlatButton(onPressed: (){},
                        child: Text('AB+', style: smallhospitalFont,),
                        color: Colors.white54,),
                      FlatButton(onPressed: (){},
                        child: Text('AB-', style: smallhospitalFont,),
                        color: Colors.white54,),
                      FlatButton(onPressed: (){},
                        child: Text('O+', style: smallhospitalFont,),
                        color: Colors.white54,),
                      FlatButton(onPressed: (){},
                        child: Text('O-', style: smallhospitalFont,),
                        color: Colors.white54,),
                    ],)
                  ],
                )
              ],
            ),
            Text( 'Press to Request',  textAlign: TextAlign.left,
                style: GoogleFonts
                    .pressStart2p(
                    textStyle: TextStyle(
                        fontSize: 16.0,
                        color: Colors.yellow))),
            SizedBox(height: 20,),
            Text( 'Provider: NY Blood Center',  textAlign: TextAlign.left,
                style: GoogleFonts
                    .pressStart2p(
                    textStyle: TextStyle(
                        fontSize: 12.0,
                        color: Colors.blueAccent))),
          ],
        ),
      ),
    );
  }
}