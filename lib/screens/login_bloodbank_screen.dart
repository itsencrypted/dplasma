import 'package:dplasma/components/dharma_button.dart';
import 'package:dplasma/models/registration_form.dart';
import 'package:flutter/material.dart';

class BloodBankLoginScreen extends StatefulWidget {
  static const String id = 'bloodbankLogin_screen';

  @override
  _BloodBankLoginScreenState createState() => _BloodBankLoginScreenState();
}

class _BloodBankLoginScreenState extends State<BloodBankLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            PersonaActionAvatar(
              personaImage: ('assets/images/icon-patient.png'),
              onPressed: (){Navigator.pop(context);},
            ),
            SizedBox(
              height: 20,
            ),
            DharmaButton(titleOfButton: 'Check in Donors',),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    CircleAvatar(backgroundImage:
                    AssetImage('assets/images/donor1.png'), radius:
                    70,),
                    Text( 'A -', style: TextStyle
                      (fontWeight:
                    FontWeight
                        .bold, fontSize: 20, color: Colors.amber),),
                    Text( 'Donor 1', style: TextStyle
                      (fontWeight:
                    FontWeight
                        .bold, fontSize: 14, color: Colors.green),)
                  ],
                ),
                Column(
                  children: <Widget>[
                    CircleAvatar(backgroundImage:
                    AssetImage('assets/images/donor2.png'), radius:
                    70,),
                    Text( 'A +', style: TextStyle(fontWeight: FontWeight
                        .bold, fontSize: 20, color: Colors.amber),),
                    Text( 'Donor 2', style: TextStyle
                      (fontWeight:
                    FontWeight
                        .bold, fontSize: 14, color: Colors.green),)
                  ],
                ),
              ],
            ),
            SizedBox(height:20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    CircleAvatar(backgroundImage:
                    AssetImage('assets/images/donor3.png'), radius:
                    70,),
                    Text( 'B +', style: TextStyle
                      (fontWeight:
                    FontWeight
                        .bold, fontSize: 20, color: Colors.amber),),
                    Text( 'Donor 3', style: TextStyle
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
                Image.asset('assets/images/icon-check.png', height: 200,),
                Text( 'DONATED', style: TextStyle(fontWeight: FontWeight
                    .bold, fontSize: 20, color: Colors.amber),),
                Text( 'Check In', style: TextStyle
                  (fontWeight:
                FontWeight
                    .bold, fontSize: 14, color: Colors.green),)
              ],
            ),
            SizedBox(height: 60,),
            DharmaButton(titleOfButton: 'Add plasma bag to inventories',),
          ],
        ),
      ),
    );
  }
}
