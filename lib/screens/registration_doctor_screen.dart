import 'package:dplasma/models/doctor.dart';
import 'package:dplasma/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:dplasma/components/dharma_button.dart';
import 'package:dplasma/constants.dart';
import 'package:dplasma/models/registration_form.dart';
import 'package:dplasma/utils/ethereum_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3dart/credentials.dart';

class DoctorSignUpScreen extends StatefulWidget {
  static const String id = 'doctorReg_screen';

  @override
  _DoctorSignUpScreenState createState() => _DoctorSignUpScreenState();
}

class _DoctorSignUpScreenState extends State<DoctorSignUpScreen> {
  SharedPreferences prefs;

  TextEditingController nameController = TextEditingController();
  TextEditingController hospitalController = TextEditingController();

  String signatureDoctor = "";
  bool buttonEnabled = false;
  bool isLoading = false;

  Widget loadingComponent = Center(child: CircularProgressIndicator());

  void checkIfAllIsValid() {
    if (nameController.text.isEmpty || hospitalController.text.isEmpty) {
      setState(() {
        buttonEnabled = false;
      });
    } else {
      setState(() {
        buttonEnabled = true;
      });
    }
  }

  void doctorSignup() async {
    setState(() {
      signatureDoctor = nameController.text;
      isLoading = true;
    });

    prefs.setString('role', 'Doctor');
    String pvteKey = "";
    if (hospitalController.text.toLowerCase() == "nyu hospital") {
      prefs.setString('pubKey', await Doctor.getPubKeyDoctorNYU());
      pvteKey = pvteKeyDoctorNYU;
    } else if (hospitalController.text.toLowerCase() == "mt sinai hospital") {
      prefs.setString('pubKey', await Doctor.getPubKeyDoctorMtSinai());
      pvteKey = pvteKeyDoctorMtSinai;
    } else {
      prefs.setString('pubKey', await Doctor.getPubKeyDoctorNYU());
      pvteKey = pvteKeyDoctorNYU;
    }

    var res =
        await EthereumUtils.sendInformationToContract(pvteKey, 'doctorSignup', [
      hospitalController.text,
      nameController.text,
    ]);
    print('txHash=' + res.toString());
    Future.delayed(Duration(seconds: 10), () {
      prefs.setString('privateKey', pvteKey.toString());
      Navigator.pushReplacementNamed(context, WelcomeScreen.id);
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
            PersonaAvatar(
              personaImage: doctorNYUImage,
            ),
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
                      AnimatedContainer(
                        duration: Duration(seconds: 10),
                      ),
                      RegistrationField(
                        onChanged: registrationOnChanged,
                        controllerName: nameController,
                        registrationLabel: 'Doctor Name',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RegistrationField(
                        onChanged: registrationOnChanged,
                        controllerName: hospitalController,
                        registrationLabel: 'What Hospital do you work for?',
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      DharmaButton(
                        onPressed: buttonEnabled ? doctorSignup : null,
                        titleOfButton: 'Register in the Blockchain',
                      ),
                    ],
            ),
            SizedBox(
              child: (signatureDoctor != "")
                  ? HandwrittenSignature(
                      handwrittingStyle: doctorHandwritting,
                      signaturePersona: signatureDoctor,
                    )
                  : Text(''),
            ),
          ],
        ),
      ),
    );
  }
}
