import 'package:dplasma/components/dharma_button.dart';
import 'package:dplasma/constants.dart';
import 'package:dplasma/screens/login_hematologist_screen.dart';
import 'package:flutter/material.dart';
import 'package:dplasma/models/registration_form.dart';
import 'package:google_fonts/google_fonts.dart';

class MtSinaiDoctorActionScreen extends StatefulWidget {
static const String id = 'MtSinai_doctorAction_screen';
@override
_MtSinaiDoctorActionScreenState createState() =>
    _MtSinaiDoctorActionScreenState();
}

class _MtSinaiDoctorActionScreenState extends State<MtSinaiDoctorActionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            PersonaActionAvatar(
              personaImage: ('assets/images/doctorMtSinai.png'),
              onPressed: (){Navigator.pop(context);},
            ),
            SizedBox(
              height: 20,
            ),
            DharmaButton(titleOfButton: 'Report Patients under IND Program',),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    CircleAvatar(backgroundImage:
                    AssetImage('assets/images/patient3.jpg'), radius:
                    70,),
                    Text( 'A - ', style: TextStyle
                      (fontWeight:
                    FontWeight
                        .bold, fontSize: 20, color: Colors.amber),),
                    Text( 'Patient Mt Sinai', style: TextStyle
                      (fontWeight:
                    FontWeight
                        .bold, fontSize: 14, color: Colors.green),)
                  ],
                ),
              ],
            ),
            SizedBox(height:20),
            Column(
              children: <Widget>[
                Image.asset('assets/images/icon-patient.png', height: 200,),
                Text( 'Request 300 ml Convalescent Plasma', style: TextStyle
                  (fontWeight: FontWeight
                    .bold, fontSize: 20, color: Colors.amber),),
              ],
            ),
            SizedBox(height: 60,),
            DharmaButton(titleOfButton: 'Add request to hospital system',
              onPressed: (){
                Navigator.pop(context);
              },),
          ],
        ),
      ),
    );
  }
}