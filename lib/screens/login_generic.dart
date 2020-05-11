import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dplasma/components/dharma_button.dart';
import 'package:dplasma/constants.dart';
import 'package:dplasma/models/blood_bank.dart';
import 'package:dplasma/models/doctor.dart';
import 'package:dplasma/models/donor.dart';
import 'package:dplasma/models/hematogist.dart';
import 'package:dplasma/models/hospitals.dart';
import 'package:dplasma/models/login_model.dart';
import 'package:dplasma/models/patient.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3dart/web3dart.dart';

class LoginGenericScreen extends StatefulWidget {
  static const String id = 'login_generic';
  var role = "";
  LoginGenericScreen({this.role});

  @override
  _LoginGenericScreenState createState() => _LoginGenericScreenState();
}

class _LoginGenericScreenState extends State<LoginGenericScreen> {
  SharedPreferences prefs;
  String pubKey = "";
  bool isLoading = false;

  Future<String> frontEndKeyValidation() async {
    if (widget.role == "Donor") {
      if (pubKey.toLowerCase() == await Donor.getPubKeyDonor1()) {
        return pvteKeyDonor1;
      } else if (pubKey.toLowerCase() == await Donor.getPubKeyDonor2()) {
        return pvteKeyDonor2;
      } else if (pubKey.toLowerCase() == await Donor.getPubKeyDonor3()) {
        return pvteKeyDonor3;
      } else {
        return "";
      }
    } else if (widget.role == "Hematologist") {
      if (pubKey.toLowerCase() == await Hematologist.getPubKeyHematologist()) {
        return pvteKeyHematologist;
      } else {
        return "";
      }
    } else if (widget.role == "Patient/Family Member") {
      print('here');
      print(pubKey);
      print(Patient.getPubKeyPatient1NYU());
      if (pubKey.toLowerCase() == await Patient.getPubKeyPatient1NYU()) {
        return pvteKeyPatient1NYU;
      } else if (pubKey.toLowerCase() == await Patient.getPubKeyPatient2NYU()) {
        return pvteKeyPatient2NYU;
      } else if (pubKey.toLowerCase() == await Patient.getPubKeyPatient3MtSinai()) {
        return pvteKeyPatient3MtSinai;
      } else {
        return "";
      }
    } else if (widget.role == "Blood Bank") {
      if (pubKey.toLowerCase() == await BloodBank.getPubKeyBloodBank()) {
        return pvteKeyBloodBank;
      } else {
        return "";
      }
    } else if (widget.role == "Hospital") {
      if (pubKey.toLowerCase() == await Hospital.getPubKeyHospitalMtSinai()) {
        return pvteKeyHospitalMtSinai;
      } else if (pubKey.toLowerCase() == await Hospital.getPubKeyHospitalNYU()) {
        return pvteKeyHospitalNYU;
      } else {
        return "";
      }
    } else if (widget.role == "Doctor") {
      if (pubKey.toLowerCase() == await Doctor.getPubKeyDoctorMtSinai()) {
        return pvteKeyDoctorMtSinai;
      } else if (pubKey.toLowerCase() == await Doctor.getPubKeyDoctorNYU()) {
        return pvteKeyDoctorNYU;
      } else {
        return "";
      }
    } else {
      return "";
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      prefs = await SharedPreferences.getInstance();
    });
  }

  void showErrorMessage(msg) {
    AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.BOTTOMSLIDE,
            tittle: 'Attention',
            desc: msg,
            btnCancelOnPress: () {},
            btnOkOnPress: () {})
        .show();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () async {
      print(await Hospital.getPubKeyHospitalMtSinai());
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Image.asset(
                'assets/images/logo-transparent.png',
                height: 220,
              ),
              Container(
                height: 250,
                width: double.maxFinite,
                padding: EdgeInsets.all(22),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Text('Please, identify yourself with the Public Key'),
                        SizedBox(
                          height: 20,
                        ),
                        (isLoading)
                            ? CircularProgressIndicator()
                            : TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(Icons.lock_outline)),
                                onChanged: (value) {
                                  pubKey = value;
                                },
                              ),
                        SizedBox(
                          height: 20,
                        ),
                        DharmaButton(
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });
                            var res = await frontEndKeyValidation();
                            print(res);
                            if (res.isEmpty) {
                              showErrorMessage("No local keys found, please sign up!");
                            } else {
                              var isItOnBlockchain = await loginBlockchain(
                                  res.toString(), widget.role);
                              
                              if(isItOnBlockchain['isValid']) {
                                prefs.setString('privateKey', res);
                                whereToGo(context, pubKey, widget.role);
                              } else {
                                showErrorMessage("Local key valid, but not found on blockchain");
                              }
                            }
                            setState(() {
                              isLoading = false;
                            });
                          },
                          titleOfButton: 'VALIDATE VIA BLOCKCHAIN',
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
