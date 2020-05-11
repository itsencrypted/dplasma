import 'package:dplasma/models/hospitals.dart';
import 'package:flutter/material.dart';
import 'package:dplasma/components/dharma_button.dart';
import 'package:dplasma/constants.dart';
import 'package:dplasma/models/registration_form.dart';
import 'package:dplasma/utils/ethereum_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3dart/credentials.dart';

class HospitalSignUpScreen extends StatefulWidget {
  static const String id = 'hospitalReg_screen';

  @override
  _HospitalSignUpScreenState createState() => _HospitalSignUpScreenState();
}

class _HospitalSignUpScreenState extends State<HospitalSignUpScreen> {

  SharedPreferences prefs;

  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  String signatureHospital = "";
  bool buttonEnabled = false;
  bool isLoading = false;

  Widget loadingComponent = Center(child: CircularProgressIndicator());

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

  void hospitalSignup() async {
    setState(() {
      signatureHospital = nameController.text;
      isLoading = true;
    });
    
    prefs.setString('role', 'Hospital');
    String pvteKey = "";
    if (cityController.text.toLowerCase() == "new york") {
      prefs.setString('pubKey', await Hospital.getPubKeyHospitalNYU());
      pvteKey = pvteKeyHospitalNYU;
    } else if (cityController.text.toLowerCase() == "mt sinai") {
      prefs.setString('pubKey', await Hospital.getPubKeyHospitalMtSinai());
      pvteKey = pvteKeyHospitalMtSinai;
    } else {
      prefs.setString('pubKey', await Hospital.getPubKeyHospitalNYU());
      pvteKey = pvteKeyHospitalNYU;
    }

    var res = await EthereumUtils.sendInformationToContract(
        pvteKey, 'hospitalSignup', [
      nameController.text,
      cityController.text,
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            PersonaAvatar(personaImage: hospitalNYUImage,),
            SizedBox(
              height: 20,
            ),
            Column(
              children: isLoading
                  ? <Widget>[loadingComponent]
                  : [
                RegistrationTitle(),
                SizedBox(
                  height: 20,
                ),
                AnimatedContainer(duration: Duration(seconds: 10),),
                RegistrationField(
                  onChanged: registrationOnChanged,
                  controllerName: nameController,
                  registrationLabel: 'Hospital Name',
                ),
                SizedBox(
                  height: 20,
                ),
                RegistrationField(
                  onChanged: registrationOnChanged,
                  controllerName: cityController,
                  registrationLabel: 'City',
                ),
                SizedBox(
                  height: 30,
                ),
                DharmaButton(
                  onPressed: buttonEnabled ? hospitalSignup : null,
                  titleOfButton: 'Register in the Blockchain',
                ),
              ],
            ),
            SizedBox(
              child: (signatureHospital != "")
                  ? HandwrittenSignature(handwrittingStyle:
              hospitalHandwritting,
                signaturePersona: signatureHospital,)
                  : Text(''),
            ),
          ],
        ),
      ),
    );
  }
}
