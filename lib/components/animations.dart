import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimationsExamples extends StatefulWidget {
  static const String id = 'allAnimations_screen';

  @override
  _AnimationsExamplesState createState() => _AnimationsExamplesState();
}

class _AnimationsExamplesState extends State<AnimationsExamples>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

//  final kLightBlueish = Color(0xFF33BBB5);
//  final kLightGreen = Color(0xFF95E08E);

  @override
  void initState() {
    super.initState();

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
//        backgroundColor: animation.value,
    backgroundColor: Colors.black,
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Center(
                child: SafeArea(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 400,
                            child: TextLiquidFill(
                              text: 'Donating',
                              waveColor: Colors.amber,
                              boxBackgroundColor: Colors.black,
                              textStyle: TextStyle(
                                fontSize: 80.0,
                                fontWeight: FontWeight.bold,
                              ),
                              boxHeight: 113.0,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            width: 250.0,
                            child: ColorizeAnimatedTextKit(
                                onTap: () {
                                  print("Tap Event");
                                },
                                text: [
                                  "Thank you!",
                                  "Your act of kindness",
                                  "is saving someone's life",
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
                          SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            width: 400.0,
                            child: ScaleAnimatedTextKit(
                              onTap: () {
                                print("Tap Event");
                              },
                              text: ["Think", "Build", "Ship"],
                              textStyle: GoogleFonts.germaniaOne(
                                textStyle: TextStyle(
                                    color: Colors.indigo,
                                    letterSpacing: .5,
                                    fontSize: 70,
                                    fontWeight: FontWeight.w400),
                              ),
                              textAlign: TextAlign.start,
                              alignment: AlignmentDirectional.topStart, // or
                              // Alignment.topLeft,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            width: 400.0,
                            child: TypewriterAnimatedTextKit(
                                onTap: () {
                                  print("Tap Event");
                                },
                                text: [
                                  "dPlasma",
                                  "Clinical trials of convalescent Plasma",
                                  "Consensys Health - Stop Covid19",
                                  "Data is the medicine we need",
                                ],
                                textStyle: GoogleFonts.courierPrime(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: .5,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w400),
                                ),
                                textAlign: TextAlign.start,
                                alignment: AlignmentDirectional
                                    .topStart // or Alignment.topLeft
                            ),
                          ),
                          SizedBox(
                            height: 80,
                          ),
                          SizedBox(
                            width: 250.0,
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
                                textAlign: TextAlign.start,
                                alignment: AlignmentDirectional
                                    .topStart // or Alignment.topLeft
                            ),
                          ),
                        ])))));
  }
}
