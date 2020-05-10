import 'package:dplasma/models/blood_bank.dart';
import 'package:dplasma/screens/login_bloodbank_screen.dart';
import 'package:flutter/material.dart';
import 'package:dplasma/constants.dart';
import 'package:dplasma/components/dharma_button.dart';
import 'package:dplasma/models/registration_form.dart';
import 'package:dplasma/utils/ethereum_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class BloodBankActionScreen extends StatefulWidget {
  static const String id = 'bloodbankAction_screen';

  @override
  _BloodBankActionScreenState createState() => _BloodBankActionScreenState();
}

class _BloodBankActionScreenState extends State<BloodBankActionScreen> {
  SharedPreferences prefs;
  String bloodType = "select";
  TextEditingController nameController = TextEditingController();

  String signatureBloodBank = "";
  bool buttonEnabled = false;
  bool isLoading = false;

  Widget loadingComponent = Center(child: CircularProgressIndicator());

  void checkIfAllIsValid() {
    if ( bloodType == 'select' ||  nameController.text.isEmpty) {
      setState(() {
        buttonEnabled = false;
      });
    } else {
      setState(() {
        buttonEnabled = true;
      });
    }
  }

  void bloodbankSignup() async {
    setState(() {
      signatureBloodBank = nameController.text;
      isLoading = true;
    });
    prefs.setString('role', 'Blood Bank');
    prefs.setString('pubKey', await BloodBank.getPubKeyBloodBank());

    var res = await EthereumUtils.sendInformationToContract(
        pvteKeyBloodBank.toString(), 'bloodbankSignup', [
      nameController.text,
    ]);
    print('txHash=' + res.toString());
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

  void registrationOnChanged(value) {
    checkIfAllIsValid();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            PersonaActionAvatar(
              personaImage: ('assets/images/icon-donate.png'),
              onPressed: (){ Navigator.pushNamed(context, BloodBankLoginScreen
                  .id);},
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 400,
              child: TextLiquidFill(
                text: 'Convalescent Plasma Program',
                waveColor: Colors.amber,
                boxBackgroundColor: Colors.black,
                textStyle: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
                boxHeight: 113.0,
              ),
            ),
            Column(
              children: isLoading
                  ? <Widget>[loadingComponent]
                  : [
                Text('NY Blood Bank Center',style: TextStyle
                (fontWeight:
                FontWeight
                .bold, fontSize: 20, color: Colors.amber)),
                SizedBox(
                  height: 20,
                ),
                AnimatedContainer(
                  duration: Duration(seconds: 10),
                ),
                SizedBox(
                  height: 20,
                ),
                DharmaButton(onPressed: (){}, titleOfButton: 'Collect '
                    'Donation',),
                SizedBox(height:20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        CircleAvatar(backgroundImage:
                        AssetImage('assets/images/plasmabag_donor1_A-.jpg'), radius:
                        70,),
                        Text( 'A -', style: TextStyle
                          (fontWeight:
                        FontWeight
                            .bold, fontSize: 20, color: Colors.amber),),
                        Text( 'available: 1', style: TextStyle
                          (fontWeight:
                        FontWeight
                            .bold, fontSize: 14, color: Colors.green),)
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        CircleAvatar(backgroundImage:
                        AssetImage('assets/images/plasmabag_donor2_A+.png'), radius:
                        70,),
                        Text( 'A +', style: TextStyle(fontWeight: FontWeight
                            .bold, fontSize: 20, color: Colors.amber),),
                        Text( 'available: 1', style: TextStyle
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
                        AssetImage('assets/images/plasmabag_donor3_B+.png'), radius:
                        70,),
                        Text( 'B +', style: TextStyle
                          (fontWeight:
                        FontWeight
                            .bold, fontSize: 20, color: Colors.amber),),
                        Text( 'available: 1', style: TextStyle
                          (fontWeight:
                        FontWeight
                            .bold, fontSize: 14, color: Colors.green),)
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        CircleAvatar(backgroundImage:
                        AssetImage('assets/images/plasmabagAB.png'), radius:
                        70,),
                        Text( 'AB +', style: TextStyle(fontWeight: FontWeight
                            .bold, fontSize: 20, color: Colors.amber),),
                        Text( 'available: empty', style: TextStyle
                          (fontWeight:
                        FontWeight
                            .bold, fontSize: 14, color: Colors.red),)
                      ],
                    ),
                  ],
                ),
                SizedBox(height:20),
                Container(
                  width: double.maxFinite,
                  height: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: AssetImage('assets/images/plasma_inventories_bl_bank_A+A-B+.png'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(height:20),
                DharmaButton(
                  onPressed: buttonEnabled ? bloodbankSignup : null,
                  titleOfButton: 'Publish Inventories in the Blockchain',
                ),
              ],
            ),
            SizedBox(
              child: (signatureBloodBank != "")
                  ? HandwrittenSignature(
                handwrittingStyle: bloodbankHandwritting,
                signaturePersona: signatureBloodBank,
              )
                  : Text(''),
            ),
          ],
        ),
      ),
    );
  }
}

