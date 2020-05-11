import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dplasma/constants.dart';
import 'package:dplasma/screens/login_hematologist_screen.dart';
import 'package:flutter/material.dart';
import 'package:dplasma/models/registration_form.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MtSinaiHospitalActionScreen extends StatefulWidget {
  static const String id = 'MtSinaihospitalAction_screen';

  @override
  _MtSinaiHospitalActionScreenState createState() =>
      _MtSinaiHospitalActionScreenState();
}

class _MtSinaiHospitalActionScreenState
    extends State<MtSinaiHospitalActionScreen> {
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
              personaImage: ('assets/images/mtsinaihospital.jpg'),
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, HematologistLoginScreen.id);
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text(
                'Mt Sinai Hospital\n'
                '\n'
                'Main Directory',
                style: hospitalFont),
            SizedBox(
              height: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text('A -',
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
                              onPressed: () {
                                //TODO: execute this button. ONLY
                                // HEMATOLOGIST CAN CLICK. No modern pop up
                                // message. Use hospitalFonts (at constants
                                // .dart)
//                                  "yes, NY Blood Bank is sending you a A- "
//                                      "plasma bag",
                                String role = prefs.getString('role');
                                print(role);
                                if (role == "Hematologist") {
                                  showSucessMessage(
                                      "Yes, NY Blood Bank is sending you a A- plasma bag");
                                } else {
                                  showInfoMessage(
                                      "User not Hematologist");
                                }
                              },
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
                              onPressed: () {},
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
                              onPressed: () {},
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

                //button only visible to hematologist.
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
                        textStyle: TextStyle(
                            fontSize: 12.0, color: Colors.blueAccent))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
