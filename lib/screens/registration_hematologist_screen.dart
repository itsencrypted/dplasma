import 'dart:collection';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dplasma/utils/ethereum_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HematologistSignUpScreen extends StatefulWidget {
  static const String id = 'hematologistReg_screen';

  @override
  _HematologistSignUpScreenState createState() =>
      _HematologistSignUpScreenState();
}

class _HematologistSignUpScreenState extends State<HematologistSignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  String signature = "";
  bool buttonEnabled = false;
  bool isLoading = false;
  SharedPreferences prefs;

  void checkIfAllIsValid() {
    if (nameController.text.isEmpty || cityController.text.isEmpty) {
      setState(() {
        buttonEnabled = false;
      });
    } else {
      setState(() {
        buttonEnabled = true;
      });
    }
  }

  void signUp() async {
    setState(() {
      signature = nameController.text;
      isLoading = true;
    });

    HashMap wallet = await EthereumUtils.createWallet();
    var privateKeyHM = "E89A693768D25915C91BAC74E02E2E347E593C533304047C992C1DC0067BE159";
    prefs.setString('privKey',privateKeyHM );
    prefs.setString('pubKey', wallet['pubKey'].toString());
    prefs.setString('role', 'hematologist');

    var res = await EthereumUtils.sendInformationToContract(
        privateKeyHM.toString(), 'HematologistSignup', [
      true,
      cityController.text,
    ]);
    print('txHash='+res.toString());
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      prefs = await SharedPreferences.getInstance();
    });
  }

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
            Column(
              children: isLoading
                  ? <Widget>[Center(child: CircularProgressIndicator())]
                  : [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, right: 18),
                        child: TextFormField(
                          onChanged: (value) {
                            checkIfAllIsValid();
                          },
                          controller: nameController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Full Name'),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, right: 18),
                        child: TextFormField(
                          onChanged: (value) {
                            checkIfAllIsValid();
                          },
                          controller: cityController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), labelText: 'City'),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 18.0, right: 18),
                          child: MaterialButton(
                            onPressed: buttonEnabled ? signUp : null,
                            child: Text('Generate Signature'),
                            minWidth: double.maxFinite,
                            color: Color(0xFF95E08E),
                          )),
                    ],
            ),
            SizedBox(
              // width: 250.0,
              child: (signature != "")
                  ? TyperAnimatedTextKit(
                      onTap: () {
                        print("Tap Event");
                      },
                      text: [
                        signature,
                      ],
                      textStyle: GoogleFonts.homemadeApple(
                        textStyle: TextStyle(
                          fontSize: 30.0,
                          color: Colors.red,
                        ),
                      ),
                      speed: Duration(milliseconds: 500),
                      textAlign: TextAlign.start,
                      alignment:
                          AlignmentDirectional.topStart // or Alignment.topLeft
                      )
                  : Text(''),
            ),
          ],
        ),
      ),
    );
  }
}
