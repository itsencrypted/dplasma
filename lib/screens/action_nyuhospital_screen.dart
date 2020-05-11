import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dplasma/constants.dart';
import 'package:dplasma/screens/login_hematologist_screen.dart';
import 'package:flutter/material.dart';
import 'package:dplasma/models/registration_form.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NYUHospitalActionScreen extends StatefulWidget {
  static const String id = 'NYUhospitalAction_screen';

  @override
  _NYUHospitalActionScreenState createState() =>
      _NYUHospitalActionScreenState();
}

class _NYUHospitalActionScreenState extends State<NYUHospitalActionScreen> {
  SharedPreferences prefs;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      prefs = await SharedPreferences.getInstance();
    });
  }

 showSucessMessage(msg) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              // title: Text('Good'),
              content: Text(
                msg,
                style: GoogleFonts.pressStart2p(
                  textStyle: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ),
              actions: <Widget>[
                FlatButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ]);
        });
  }

  showInfoMessage(msg) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              // title: Text('Good'),
              content: Text(
                msg,
                style: GoogleFonts.pressStart2p(
                  textStyle: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ),
              actions: <Widget>[
                FlatButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ]);
        });
  }

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
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text(
                'NYU Hospital\n'
                '\n'
                'Main Directory',
                style: hospitalFont),
            SizedBox(
              height: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text('B -',
                    style: GoogleFonts.pressStart2p(
                        textStyle: TextStyle(
                      fontSize: 16.0,
                      color: Colors.yellow,
                    ))),
                Text('Request quantity:[1]',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.pressStart2p(
                        textStyle:
                            TextStyle(fontSize: 16.0, color: Colors.yellow))),
                SizedBox(
                  height: 30,
                ),
                Text('AB +',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.pressStart2p(
                        textStyle:
                            TextStyle(fontSize: 16.0, color: Colors.yellow))),
                Text('Request quantity:[1]',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.pressStart2p(
                        textStyle:
                            TextStyle(fontSize: 16.0, color: Colors.yellow))),
              ],
            ),
            SizedBox(height: 30),
            Column(
              children: <Widget>[
                Text('Convalescent Plasma Program_', style: hospitalFont),
                Row(
                  children: <Widget>[
                    ButtonBar(
                      children: <Widget>[
                        SizedBox(
                          width: 50,
                        ),
                        FlatButton(
                          onPressed: () {},
                          child: Text(
                            'A+',
                            style: smallhospitalFont,
                          ),
                          color: Colors.white54,
                        ),
                        FlatButton(
                          onPressed: () {},
                          child: Text(
                            'A-',
                            style: smallhospitalFont,
                          ),
                          color: Colors.white54,
                        ),
                        FlatButton(
                          onPressed: () {},
                          child: Text(
                            'B+',
                            style: smallhospitalFont,
                          ),
                          color: Colors.white54,
                        ),
                        FlatButton(
                          onPressed: () {
                            //TODO: Execute this action
//                          "yes, NY Blood Bank is sending you a B- plasma bag",
                            String role = prefs.getString('role');
                            if (role == "Hematologist") {
                              showSucessMessage(
                                  "Yes, NY Blood Bank is sending you a B- plasma bag");
                            } else {
                              showInfoMessage(
                                  "Sorry, you're not a Hematologist");
                            }
                          },
                          child: Text(
                            'B-',
                            style: smallhospitalFont,
                          ),
                          color: Colors.white54,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    ButtonBar(
                      children: <Widget>[
                        SizedBox(
                          width: 50,
                        ),
                        FlatButton(
                          onPressed: () {
                            //TODO: Execute this action
//                        'unfortunately, no AB+ plasma bags available today'
                            String role = prefs.getString('role');
                            if (role == "Hematologist") {
                              showSucessMessage(
                                  "Sorry, unfortunately there's no AB+ plasma bag available");
                            } else {
                              showInfoMessage(
                                  "Sorry, you're not a Hematologist");
                            }
                          },
                          child: Text(
                            'AB+',
                            style: smallhospitalFont,
                          ),
                          color: Colors.white54,
                        ),
                        FlatButton(
                          onPressed: () {},
                          child: Text(
                            'AB-',
                            style: smallhospitalFont,
                          ),
                          color: Colors.white54,
                        ),
                        FlatButton(
                          onPressed: () {},
                          child: Text(
                            'O+',
                            style: smallhospitalFont,
                          ),
                          color: Colors.white54,
                        ),
                        FlatButton(
                          onPressed: () {},
                          child: Text(
                            'O-',
                            style: smallhospitalFont,
                          ),
                          color: Colors.white54,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            Text('Press to Request',
                textAlign: TextAlign.left,
                style: GoogleFonts.pressStart2p(
                    textStyle:
                        TextStyle(fontSize: 16.0, color: Colors.yellow))),
            SizedBox(
              height: 20,
            ),
            Text('Provider: NY Blood Center',
                textAlign: TextAlign.left,
                style: GoogleFonts.pressStart2p(
                    textStyle:
                        TextStyle(fontSize: 12.0, color: Colors.blueAccent))),
          ],
        ),
      ),
    );
  }
}
