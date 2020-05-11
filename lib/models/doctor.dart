import 'package:dplasma/constants.dart';
import 'package:dplasma/screens/action_mtsinaihospital_screen.dart';
import 'package:dplasma/utils/ethereum_utils.dart';
import 'package:web3dart/credentials.dart';
import 'package:dplasma/components/dharma_button.dart';
import 'package:dplasma/models/registration_form.dart';
import 'package:flutter/material.dart';

class Doctor {
//  address doctorAddress;
  bool ishematologistDoctor;

  static getPubKeyDoctorMtSinai() async {
    EthereumAddress pubKeyDoctorMtSinai =
        await EthereumUtils.getPublicKey(pvteKeyDoctorMtSinai);
    return pubKeyDoctorMtSinai.hex;
  }

   static getPubKeyDoctorNYU() async {
    EthereumAddress pubKeyDoctorNYU =
        await EthereumUtils.getPublicKey(pvteKeyDoctorNYU);
    return pubKeyDoctorNYU.hex;
  }
}




//class NYUDoctorScreen extends StatefulWidget {
//  static const String id = 'doctorNYUAction_screen';
//  @override
//  _NYUDoctorScreenState createState() => _NYUDoctorScreenState();
//}
//
//class _NYUDoctorScreenState extends State<NYUDoctorScreen> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.black,
//      body: SingleChildScrollView(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          children: <Widget>[
//            PersonaActionAvatar(
//              personaImage: ('assets/images/doctorMtSinai.png'),
//              onPressed: (){Navigator.pop(context);},
//            ),
//            SizedBox(
//              height: 20,
//            ),
//            DharmaButton(titleOfButton: 'Report Patients under IND Program',),
//            SizedBox(height: 20,),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              children: <Widget>[
//                Column(
//                  children: <Widget>[
//                    CircleAvatar(backgroundImage:
//                    AssetImage('assets/images/patient3.jpg'), radius:
//                    70,),
//                    Text( 'A - ', style: TextStyle
//                      (fontWeight:
//                    FontWeight
//                        .bold, fontSize: 20, color: Colors.amber),),
//                    Text( 'Patient Mt Sinai', style: TextStyle
//                      (fontWeight:
//                    FontWeight
//                        .bold, fontSize: 14, color: Colors.green),)
//                  ],
//                ),
//              ],
//            ),
//            SizedBox(height:20),
//            Column(
//              children: <Widget>[
//                Image.asset('assets/images/icon-patient.png', height: 200,),
//                Text( 'Request 300 ml Convalescent Plasma', style: TextStyle
//                  (fontWeight: FontWeight
//                    .bold, fontSize: 20, color: Colors.amber),),
//              ],
//            ),
//            SizedBox(height: 60,),
//            DharmaButton(titleOfButton: 'Add request to hospital system',),
//          ],
//        ),
//      ),
//    );
//  }
//}
