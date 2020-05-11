import 'package:dplasma/components/dharma_button.dart';
import 'package:dplasma/models/registration_form.dart';
import 'package:dplasma/screens/action_nyuhospital_screen.dart';
import 'package:flutter/material.dart';

class NYUDoctorActionScreen extends StatefulWidget {
  static const String id = 'nyu_doctorAction_screen';

  @override
  _NYUDoctorActionScreenState createState() => _NYUDoctorActionScreenState();
}

class _NYUDoctorActionScreenState extends State<NYUDoctorActionScreen> {
  @override
  Widget build(BuildContext context) {

    //TODO: Bruno - Depends on who is logged in Return MtSinaiDoctorScreen or
    // NYUDoctorScreen - take a look at models/doctor.dart

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            PersonaActionAvatar(
              personaImage: ('assets/images/doctorNYU.jpg'),
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
                    AssetImage('assets/images/patient1.jpg'), radius:
                    70,),
                    Text( 'B - ', style: TextStyle
                      (fontWeight:
                    FontWeight
                        .bold, fontSize: 20, color: Colors.amber),),
                    Text( 'Patient NYU Hospital', style: TextStyle
                      (fontWeight:
                    FontWeight
                        .bold, fontSize: 14, color: Colors.green),)
                  ],
                ),
                Column(
                  children: <Widget>[
                    CircleAvatar(backgroundImage:
                    AssetImage('assets/images/patient2.jpg'), radius:
                    70,),
                    Text( 'AB + ', style: TextStyle
                      (fontWeight:
                    FontWeight
                        .bold, fontSize: 20, color: Colors.amber),),
                    Text( 'Patient NYU Hospital', style: TextStyle
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
                Text( 'Request 2 x 300 ml Convalescent Plasma', style: TextStyle
                  (fontWeight: FontWeight
                    .bold, fontSize: 20, color: Colors.amber),),
              ],
            ),
            SizedBox(height: 60,),
            DharmaButton(titleOfButton: 'Add request to hospital system',
            onPressed: (){
              //TODO: lembrar de direcionar para hospital certo
              Navigator.pop(context);
            },),
          ],
        ),
      ),
    );
  }
}
