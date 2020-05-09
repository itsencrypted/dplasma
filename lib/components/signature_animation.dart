import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';


class AnimatedSignature extends StatefulWidget {
//  TextEditingController nameController = TextEditingController();
//  TextEditingController cityController = TextEditingController();
//  String signature = "";
//  bool buttonEnabled = false;
//  bool isLoading = false;
//  SharedPreferences prefs;
//
//  void checkIfAllIsValid() {
//    if (nameController.text.isEmpty || cityController.text.isEmpty) {
//      setState(() {
//        buttonEnabled = false;
//      });
//    } else {
//      setState(() {
//        buttonEnabled = true;
//      });
//    }
//  }
//
//  void signUp() async {
//    setState(() {
//      signature = nameController.text;
//      isLoading = true;
//    });
//  }
//
//  @override
//  void initState() {
//    super.initState();
//    Future.delayed(Duration.zero, () async {
//      prefs = await SharedPreferences.getInstance();
//    });
//  }


    AnimatedSignature({
//    this.signature,
    this.onPressed, this.selectedHandwritting});

//  final String signature;
  final Function onPressed;
  final GoogleFonts selectedHandwritting;

  @override
  _AnimatedSignatureState createState() => _AnimatedSignatureState();
}

class _AnimatedSignatureState extends State<AnimatedSignature> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0,
//      child: (widget.signatureHematologist != "")
//          ? TyperAnimatedTextKit(
//          onTap: () {
//            print("Tap Event");
//          },
//          text: [
////            widget.signature,
//          ],
////          textStyle: GoogleFonts.homemadeApple(
//      textStyle: GoogleFonts.homemadeApple(
//            textStyle: TextStyle(
//              fontSize: 30.0,
//              color: Colors.red,
//            ),
//          ),
//          speed: Duration(milliseconds: 500),
//          textAlign: TextAlign.start,
//          alignment:
//          AlignmentDirectional.topStart // or Alignment.topLeft
//      )
//          :
//      Text(''),
    );
  }
}



