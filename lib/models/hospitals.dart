import 'package:dplasma/constants.dart';
import 'package:dplasma/utils/ethereum_utils.dart';
import 'package:web3dart/credentials.dart';
import 'package:flutter/material.dart';
import 'package:dplasma/models/registration_form.dart';
import 'package:google_fonts/google_fonts.dart';

class Hospital {
//  address hospitalAddress;
  String city;

  static getPubKeyHospitalNYU() async {
    EthereumAddress pubKeyHospitalNYU =
        await EthereumUtils.getPublicKey(pvteKeyHospitalNYU);
    return pubKeyHospitalNYU.hex;
  }

  static getPubKeyHospitalMtSinai() async {
    EthereumAddress pubKeyHospitalMtSinai =
        await EthereumUtils.getPublicKey(pvteKeyHospitalMtSinai);
    return pubKeyHospitalMtSinai.hex;
  }
}

class HospitalGeolocation {
  String city;
//  Lat latitude;
//  Long longitude;

}

//NYU Hospital @40.742746,-73.9759226,
//Mount Sinai Hospital @40.7899953,-73.9571022



//class NYUHospitalActionScreen extends StatefulWidget {
//  static const String id = 'NYUhospitalAction_screen';
//
//  @override
//  _NYUHospitalActionScreenState createState() =>
//      _NYUHospitalActionScreenState();
//}
//
//class _NYUHospitalActionScreenState extends State<NYUHospitalActionScreen> {
//  @override
//  Widget build(BuildContext context) {
//
//    return Scaffold(
//      backgroundColor: Colors.black,
//      body: SingleChildScrollView(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          children: <Widget>[
//            PersonaActionAvatar(
//              personaImage: ('assets/images/nyuhospital.jpg'),
//              onPressed: (){Navigator.pop(context);},
//            ),
//            SizedBox(
//              height: 20,
//            ),
//            Text('NYU Hospital\n'
//                '\n'
//                'Main Directory', style: hospitalFont),
//            SizedBox(height: 50,),
//            Column(
//              mainAxisAlignment: MainAxisAlignment.start,
//              children: <Widget>[
//                Text( 'B -',
//                    style: GoogleFonts
//                        .pressStart2p(
//                        textStyle: TextStyle(
//                          fontSize: 16.0,
//                          color: Colors.yellow,))),
//                Text( 'Request quantity:[1]',  textAlign: TextAlign.left,
//                    style: GoogleFonts
//                        .pressStart2p(
//                        textStyle: TextStyle(
//                            fontSize: 16.0,
//                            color: Colors.yellow))),
//                SizedBox(height: 30,),
//                Text( 'AB +',  textAlign: TextAlign.left,
//                    style: GoogleFonts
//                        .pressStart2p(
//                        textStyle: TextStyle(
//                            fontSize: 16.0,
//                            color: Colors.yellow))),
//                Text( 'Request quantity:[1]',  textAlign: TextAlign.left,
//                    style: GoogleFonts
//                        .pressStart2p(
//                        textStyle: TextStyle(
//                            fontSize: 16.0,
//                            color: Colors.yellow))),
//              ],
//            ),
//
//            SizedBox(height:30),
//            Column(
//              children: <Widget>[
//                Text( 'Convalescent Plasma Program_', style:
//                hospitalFont),
//                Row(
//                  children: <Widget>[
//                    ButtonBar(
//                      children: <Widget>[
//                        SizedBox(width: 50,),
//                        FlatButton(onPressed: (){},
//                          child: Text('A+', style: smallhospitalFont,),
//                          color: Colors.white54,),
//                        FlatButton(onPressed: (){},
//                          child: Text('A-', style: smallhospitalFont,),
//                          color: Colors.white54,),
//                        FlatButton(onPressed: (){},
//                          child: Text('B+', style: smallhospitalFont,),
//                          color: Colors.white54,),
//                        FlatButton(onPressed: (){},
//                          child: Text('B-', style: smallhospitalFont,),
//                          color: Colors.white54,),
//                      ],
//                    ),
//                  ],
//                ),
//                Row(
//                  children: <Widget>[
//                    ButtonBar(children: <Widget>[
//                      SizedBox(width: 50,),
//                      FlatButton(onPressed: (){},
//                        child: Text('AB+', style: smallhospitalFont,),
//                        color: Colors.white54,),
//                      FlatButton(onPressed: (){},
//                        child: Text('AB-', style: smallhospitalFont,),
//                        color: Colors.white54,),
//                      FlatButton(onPressed: (){},
//                        child: Text('O+', style: smallhospitalFont,),
//                        color: Colors.white54,),
//                      FlatButton(onPressed: (){},
//                        child: Text('O-', style: smallhospitalFont,),
//                        color: Colors.white54,),
//                    ],)
//                  ],
//                )
//              ],
//            ),
//            Text( 'Press to Request',  textAlign: TextAlign.left,
//                style: GoogleFonts
//                    .pressStart2p(
//                    textStyle: TextStyle(
//                        fontSize: 16.0,
//                        color: Colors.yellow))),
//            SizedBox(height: 20,),
//            Text( 'Provider: NY Blood Center',  textAlign: TextAlign.left,
//                style: GoogleFonts
//                    .pressStart2p(
//                    textStyle: TextStyle(
//                        fontSize: 12.0,
//                        color: Colors.blueAccent))),
//          ],
//        ),
//      ),
//    );
//  }
//}


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
                  Navigator.pop(context);
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