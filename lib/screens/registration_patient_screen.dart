import 'package:dplasma/models/blood_types.dart';
import 'package:flutter/material.dart';
import 'package:dplasma/components/dharma_button.dart';
import 'package:dplasma/constants.dart';
import 'package:dplasma/models/registration_form.dart';
import 'package:dplasma/utils/ethereum_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientSignUpScreen extends StatefulWidget {
  static const String id = 'patientReg_screen';

  @override
  _PatientSignUpScreenState createState() => _PatientSignUpScreenState();
}

class _PatientSignUpScreenState extends State<PatientSignUpScreen> {
  SharedPreferences prefs;

  TextEditingController nameController = TextEditingController();
  TextEditingController hospitalController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  String bloodType = "select";
  bool isINDregistered = false;

  String signaturePatient = "";
  bool buttonEnabled = false;
  bool isLoading = false;

  Widget loadingComponent = Center(child: CircularProgressIndicator());



  void checkIfAllIsValid() {
    print(bloodType);
    print (isINDregistered);
    if (nameController.text.isEmpty || cityController.text.isEmpty ||
    hospitalController.text.isEmpty || isINDregistered == false
       || bloodType == 'select'
    ) {
      setState(() {
        buttonEnabled = false;
      });
    } else {
      setState(() {
        buttonEnabled = true;
      });
    }
  }

  void patientSignup() async {
    setState(() {
      signaturePatient = nameController.text;
      isLoading = true;
    });
    prefs.setString('role', 'Patient/Family Member');

    var res = await EthereumUtils.sendInformationToContract(
        pvteKeyPatient1NYU.toString(), 'patientSignup', [
      nameController.text,
      hospitalController.text,
      cityController.text,
      bloodType,
      isINDregistered,
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
            PersonaAvatar(personaImage: patient1Image,),
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
                  registrationLabel: 'Name of Patient',
                ),
                SizedBox(
                  height: 20,
                ),
                RegistrationField(
                  onChanged: registrationOnChanged,
                  controllerName: hospitalController,
                  registrationLabel: 'Hospital',
                ),
                SizedBox(
                  height: 30,
                ),
                SelectBloodType(
                  onChanged: (selectedBloodType){
                    setState(() {
                      bloodType = selectedBloodType;
                    });
                    checkIfAllIsValid();
                  },
                  selectedBloodType: bloodType,
                ),
                SizedBox(
                  height: 30,
                ),
                RegistrationField(
                  onChanged: registrationOnChanged,
                  controllerName: cityController,
                  registrationLabel: 'City',
                ),
                SizedBox(
                  height: 30,
                ),
                BoolQuestion(
                  isParameterTrue: isINDregistered,
                  question: 'Is the patient registered in the IND Program?',
                  onChanged: (value){
                    setState(() {
                      isINDregistered = value;
                    });
                    checkIfAllIsValid();
                  },
                ),
                DharmaButton(
                  onPressed: buttonEnabled ? patientSignup : null,
                  titleOfButton: 'Register in the Blockchain',
                ),
              ],
            ),
            SizedBox(
              child: (signaturePatient != "")
                  ? HandwrittenSignature(handwrittingStyle:
              patientHandwritting, signaturePersona: signaturePatient,)
                  : Text(''),
            ),
          ],
        ),
      ),
    );
  }
}