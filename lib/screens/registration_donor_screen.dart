import 'package:dplasma/models/blood_types.dart';
import 'package:dplasma/models/donor.dart';
import 'package:dplasma/models/patient.dart';
import 'package:dplasma/screens/login_donor_screen.dart';
import 'package:dplasma/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:dplasma/components/dharma_button.dart';
import 'package:dplasma/constants.dart';
import 'package:dplasma/models/registration_form.dart';
import 'package:dplasma/utils/ethereum_utils.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3dart/credentials.dart';

class DonorSignUpScreen extends StatefulWidget {
  static const String id = 'donorReg_screen';

  @override
  _DonorSignUpScreenState createState() => _DonorSignUpScreenState();
}

class _DonorSignUpScreenState extends State<DonorSignUpScreen> {
  SharedPreferences prefs;
  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  String bloodType = "select";
  DateTime birthDate;
  MaskedTextController birthdayController = MaskedTextController(
      mask: '00/00'
          '/0000');
  bool hasNotDonatedLastFourWeeks = false;
  bool serologicalTestIsPositive = false;
  bool pcrResultIsNegative = false;
  bool isMale = false;
  String signaturePatient = "";
  bool buttonEnabled = false;
  bool isLoading = false;
  String signatureDonor = "";
  Widget loadingComponent = Center(child: CircularProgressIndicator());

  void checkIfAllIsValid() {
    print(bloodType);
    print(birthDate);
    print(hasNotDonatedLastFourWeeks);
    print(serologicalTestIsPositive);
    print(pcrResultIsNegative);
    print(isMale);
    if (cityController.text.isEmpty ||
        bloodType == 'select' ||
        birthDate != null ||
        hasNotDonatedLastFourWeeks == false ||
        serologicalTestIsPositive == false ||
        pcrResultIsNegative == false ||
        isMale == false) {
      setState(() {
        buttonEnabled = false;
      });
    } else {
      setState(() {
        buttonEnabled = true;
      });
    }
  }

  void donorSignup() async {
    setState(() {
      signatureDonor = nameController.text;
      isLoading = true;
    });
    String pvteKey = "";
    prefs.setString('role', 'Donor');
    if (bloodType == "0") {
      prefs.setString('pubKey', await Donor.getPubKeyDonor2());
      pvteKey = pvteKeyDonor2;
    } else if (bloodType == "1") {
      prefs.setString('pubKey', await Donor.getPubKeyDonor1());
      pvteKey = pvteKeyDonor1;
    } else if (bloodType == "2") {
      prefs.setString('pubKey', await Donor.getPubKeyDonor3());
      pvteKey = pvteKeyDonor3;
    }

    var res = await EthereumUtils.sendInformationToContract(
        pvteKey, 'donorSignup', [
      cityController.text,
      BigInt.from(int.parse(bloodType)),
      BigInt.from(convertDatetoTimeStamp(birthdayController.text)),
      hasNotDonatedLastFourWeeks,
      serologicalTestIsPositive,
      pcrResultIsNegative,
      isMale,
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
              personaImage: donor1Image,
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
                        registrationLabel: 'Name or Anonymously Register',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RegistrationField(
                        onChanged: registrationOnChanged,
                        controllerName: cityController,
                        registrationLabel: 'City you are now ready to donate',
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SelectBloodType(
                        onChanged: (selectedBloodType) {
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
                        controllerName: birthdayController,
                        registrationLabel: 'Birthday: in MM/DD/YYYY format',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      BoolQuestion(
                        isParameterTrue: hasNotDonatedLastFourWeeks,
                        question:
                            'Confirm that you HAVEN\'T DONATED in the past 4 '
                            'weeks?',
                        onChanged: (value) {
                          setState(() {
                            hasNotDonatedLastFourWeeks = value;
                          });
                          checkIfAllIsValid();
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      BoolQuestion(
                        isParameterTrue: serologicalTestIsPositive,
                        question: 'Confirm that you tested positive on the '
                            'Serological Test for Covid-19',
                        onChanged: (value) {
                          setState(() {
                            serologicalTestIsPositive = value;
                          });
                          checkIfAllIsValid();
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      BoolQuestion(
                        isParameterTrue: pcrResultIsNegative,
                        question:
                            'Confirm that you tested negative on the PCR Test '
                            'for Covid-19',
                        onChanged: (value) {
                          setState(() {
                            pcrResultIsNegative = value;
                          });
                          checkIfAllIsValid();
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      BoolQuestion(
                        isParameterTrue: isMale,
                        question: 'Confirm Male Gender',
                        onChanged: (value) {
                          setState(() {
                            isMale = value;
                          });
                          checkIfAllIsValid();
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DharmaButton(
                        onPressed: buttonEnabled ? donorSignup : null,
                        titleOfButton: 'Register in the Blockchain',
                      ),
                    ],
            ),
            SizedBox(
              child: (signatureDonor != "")
                  ? HandwrittenSignature(
                      handwrittingStyle: donorHandwritting,
                      signaturePersona: signatureDonor,
                    )
                  : Text(''),
            ),
          ],
        ),
      ),
    );
  }
}
