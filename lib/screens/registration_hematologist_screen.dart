import 'package:dplasma/components/dharma_button.dart';
import 'package:dplasma/constants.dart';
import 'package:dplasma/models/registration_form.dart';
import 'package:dplasma/utils/ethereum_utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HematologistSignUpScreen extends StatefulWidget {
  static const String id = 'hematologistReg_screen';

  @override
  _HematologistSignUpScreenState createState() =>
      _HematologistSignUpScreenState();
}

class _HematologistSignUpScreenState extends State<HematologistSignUpScreen> {
  SharedPreferences prefs;

  TextEditingController nameController = TextEditingController();
  bool isHematologist = false;
  TextEditingController cityController = TextEditingController();

  String signatureHematologist = "";
  bool buttonEnabled = false;
  bool isLoading = false;

  Widget loadingComponent = Center(child: CircularProgressIndicator());

  void checkIfAllIsValid() {
    if (nameController.text.isEmpty || cityController.text.isEmpty ||
        isHematologist == false) {
      setState(() {
        buttonEnabled = false;
      });
    } else {
      setState(() {
        buttonEnabled = true;
      });
    }
  }

  void hematologistSignUp() async {
    setState(() {
      signatureHematologist = nameController.text;
      isLoading = true;
    });
    prefs.setString('role', 'hematologist');

    var res = await EthereumUtils.sendInformationToContract(
        pvteKeyHematologist.toString(), 'HematologistSignup', [
      isHematologist,
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

  void registrationOnChanged(value){
    checkIfAllIsValid();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            PersonaAvatar(personaImage: hematologistImage,),
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
                  registrationLabel: 'Full Name',
                ),
              BoolQuestion(
                isParameterTrue: isHematologist,
                question: 'Are you an accredited hematologist?',
                onChanged: (value){
                  setState(() {
                    isHematologist = value;
                  });
                },
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
                  onPressed: buttonEnabled ? hematologistSignUp : null,
                  titleOfButton: 'Register in the Blockchain',
                ),
              ],
            ),
            SizedBox(
              child: (signatureHematologist != "")
                  ? HandwrittenSignature(handwrittingStyle:
              hematologistHandwritting, signaturePersona: signatureHematologist,)
                  : Text(''),
            ),
          ],
        ),
      ),
    );
  }
}
