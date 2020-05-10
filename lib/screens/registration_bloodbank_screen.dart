import 'package:dplasma/models/blood_bank.dart';
import 'package:flutter/material.dart';
import 'package:dplasma/components/dharma_button.dart';
import 'package:dplasma/constants.dart';
import 'package:dplasma/models/registration_form.dart';
import 'package:dplasma/utils/ethereum_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3dart/credentials.dart';

class BloodBankSignUpScreen extends StatefulWidget {
  static const String id = 'bloodbankReg_screen';

  @override
  _BloodBankSignUpScreenState createState() => _BloodBankSignUpScreenState();
}

class _BloodBankSignUpScreenState extends State<BloodBankSignUpScreen> {
  SharedPreferences prefs;

  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  String signatureBloodBank = "";
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
            PersonaAvatar(
              personaImage: bloodbankImage,
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
                        registrationLabel: 'Name of Blood Bank',
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
                        onPressed: buttonEnabled ? bloodbankSignup : null,
                        titleOfButton: 'Register in the Blockchain',
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
