import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dplasma/components/dharma_button.dart';
import 'package:dplasma/models/hospitals.dart';
import 'package:dplasma/screens/action_nyuhospital_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HematologistLoginScreen extends StatefulWidget {
  static const String id = 'hematologistLogin_screen';


  @override
  _HematologistLoginScreenState createState() => _HematologistLoginScreenState();
}

class _HematologistLoginScreenState extends State<HematologistLoginScreen>
    with SingleTickerProviderStateMixin{

  SharedPreferences prefs;
  AnimationController controller;
  Animation animation;


  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
        prefs = await SharedPreferences.getInstance();
        if(prefs.getString('privateKey') != null) {

        } else {
          
        }
    });

    controller = AnimationController(
      duration: Duration(seconds: 8),
      vsync: this,
    );
    animation =
        ColorTween(begin: Colors.white, end: Colors.black).animate(controller);
    controller.forward();
    controller.addListener(() {
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
      backgroundColor: Colors.black87,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              width: 450.0,
              child: ColorizeAnimatedTextKit(
                  onTap: () {
                    print("Tap Event");
                  },
                  text: [
                    'Welcome to dPlasma',
                    'Request Convalescent Plasma',
                    'Welcome to dPlasma',
                    'Request Convalescent Plasma',
                  ],
                  textStyle: TextStyle(
                    fontSize: 40.0,
                    fontFamily: "Horizon",
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                  colors: [
                    Colors.purple,
                    Colors.blue,
                    Colors.yellow,
                    Colors.red,
                  ],
                  textAlign: TextAlign.center,
                  alignment: AlignmentDirectional
                      .topStart // or Alignment.topLeft
              ),
            ),

            DharmaButton(titleOfButton: 'Login at Mt Sinai Hospital',
            onPressed: (){Navigator.pushNamed(context,
          MtSinaiHospitalActionScreen.id);}),
            SizedBox(height: 10,),
            DharmaButton(titleOfButton: 'Login at NYU Hospital',
              onPressed: (){Navigator.pushNamed(context, NYUHospitalActionScreen.id);}
            ),

//          SizedBox(
//            child: (signatureHematologist != "")
//                ? HandwrittenSignature(handwrittingStyle:
//            hematologistHandwritting, signaturePersona: signatureHematologist,)
//                : Text(''),
//          ),
          Row(children: <Widget>[
            SizedBox(
              width: 410.0,
              child: TyperAnimatedTextKit(
                  onTap: () {
                    print("Tap Event");
                  },
                  text: [
                    "Hematologist signature",],
                  textStyle: GoogleFonts.homemadeApple(
                    textStyle: TextStyle(
                      fontSize: 30.0,
                      color: Colors.red,
                    ),
                  ),
                  textAlign: TextAlign.center,
                  alignment: AlignmentDirectional
                      .topStart // or Alignment.topLeft
              ),
            ),
          ],),
          ],

        ),

      )
    );
  }
}
