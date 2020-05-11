import 'dart:collection';

import 'package:dplasma/models/blood_bank.dart';
import 'package:dplasma/models/doctor.dart';
import 'package:dplasma/models/donor.dart';
import 'package:dplasma/models/hematogist.dart';
import 'package:dplasma/models/hospitals.dart';
import 'package:dplasma/models/patient.dart';
import 'package:dplasma/screens/action_bloodbank_screen.dart';
import 'package:dplasma/screens/action_donor_screen.dart';
import 'package:dplasma/screens/action_hematologist_screen.dart';
import 'package:dplasma/screens/action_mtsinai_doctor_screen.dart';
import 'package:dplasma/screens/action_nyu_doctor_screen.dart';
import 'package:dplasma/screens/action_nyuhospital_screen.dart';
import 'package:dplasma/screens/action_patient_screen.dart';
import 'package:dplasma/screens/login_bloodbank_screen.dart';
import 'package:dplasma/screens/login_donor_screen.dart';
import 'package:dplasma/screens/login_hematologist_screen.dart';
import 'package:dplasma/screens/login_hospital_screen.dart';
import 'package:dplasma/screens/login_patient_screen.dart';
import 'package:dplasma/screens/registration_bloodbank_screen.dart';
import 'package:dplasma/screens/registration_doctor_screen.dart';
import 'package:dplasma/screens/registration_hospital_screen.dart';
import 'package:dplasma/utils/ethereum_utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3dart/web3dart.dart';

import '../constants.dart';

void login(selectedItem, pvteKey, context, setErrorMessage) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String role = prefs.getString('role');
  if (role == null) {
    setErrorMessage("Please, sign up as a " + selectedItem);
    return;
  }

  switch (role) {
    case "Donor":
      if (selectedItem == "Donor") {
        Navigator.pushNamed(context, DonorLoginScreen.id);
      } else {
        setErrorMessage("Please, sign up as a " + selectedItem);
      }
      break;
    case "Hematologist":
      if (selectedItem == "Hematologist") {
        Navigator.pushNamed(context, HematologistLoginScreen.id);
      } else {
        setErrorMessage("Please, sign up as a " + selectedItem);
      }

      break;
    case "Patient/Family Member":
      if (selectedItem == "Patient/Family Member") {
        Navigator.pushNamed(context, PatientLoginScreen.id);
      } else {
        setErrorMessage("Please, sign up as a " + selectedItem);
      }

      break;
    case "Blood Bank":
      if (selectedItem == "Blood Bank") {
        Navigator.pushNamed(context, BloodBankLoginScreen.id);
      } else {
        setErrorMessage("Please, sign up as a " + selectedItem);
      }

      break;
    case "Hospital":
      if (selectedItem == "Hospital") {
        Navigator.pushNamed(context, HospitalLoginScreen.id);
      } else {
        setErrorMessage("Please, sign up as a " + selectedItem);
      }

      break;
    case "Doctor":
      if (selectedItem == "Doctor") {
        Navigator.pushNamed(context, HospitalLoginScreen.id);
      } else {
        setErrorMessage("Please, sign up as a " + selectedItem);
      }

      break;
  }
}

Future<dynamic> loginBlockchain(String privateKey, String role) async {
  EthereumAddress pubKey = await EthereumUtils.getPublicKey(privateKey);
  List isBloodBank = await EthereumUtils.getInformationFromContract(
      privateKey, "bloodBanks", [pubKey]);
  List isDoctor = await EthereumUtils.getInformationFromContract(
      privateKey, "doctors", [pubKey]);
  List isDonor = await EthereumUtils.getInformationFromContract(
      privateKey, "donors", [pubKey]);
  List isHematologist = await EthereumUtils.getInformationFromContract(
      privateKey, "hematologists", [pubKey]);
  List isHospital = await EthereumUtils.getInformationFromContract(
      privateKey, "hospitals", [pubKey]);
  List isPatient = await EthereumUtils.getInformationFromContract(
      privateKey, "patients", [pubKey]);

  print(isBloodBank);
  print(isDoctor);
  print(isDonor);
  print(isHematologist);
  print(isHospital);
  print(isPatient);

  var obj = {};

  if (isBloodBank[0].toString() !=
      "0x0000000000000000000000000000000000000000") {
    obj['isValid'] = true;
    obj['data'] = isBloodBank;
  } else if (isDoctor[0].toString() !=
      "0x0000000000000000000000000000000000000000") {
    obj['isValid'] = true;
    obj['data'] = isDoctor;
  } else if (isDonor[0].toString() !=
      "0x0000000000000000000000000000000000000000") {
    obj['isValid'] = true;
    obj['data'] = isDonor;
  } else if (isHematologist[0].toString() !=
      "0x0000000000000000000000000000000000000000") {
    obj['isValid'] = true;
    obj['data'] = isHematologist;
  } else if (isHospital[0].toString() !=
      "0x0000000000000000000000000000000000000000") {
    obj['isValid'] = true;
    obj['data'] = isHospital;
  } else if (isPatient[0].toString() !=
      "0x0000000000000000000000000000000000000000") {
    obj['isValid'] = true;
    obj['data'] = isPatient;
  } else {
    obj['isValid'] = false;
    obj['data'] = [];
  }

  return obj;
}

void whereToGo(context, pubKey, role) async {
  pubKey = pubKey.toString().toLowerCase();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('role', role);
  if (role == "Donor") {
    if (pubKey == await Donor.getPubKeyDonor1()) {
      Navigator.pushReplacementNamed(context, DonorLoginScreen.id);
    } else if (pubKey == await Donor.getPubKeyDonor2()) {
      Navigator.pushReplacementNamed(context, DonorLoginScreen.id);
    } else if (pubKey == await Donor.getPubKeyDonor3()) {
      Navigator.pushReplacementNamed(context, DonorLoginScreen.id);
    } else {
      print('not found');
    }
  } else if (role == "Hematologist") {
    if (pubKey == await Hematologist.getPubKeyHematologist()) {
      Navigator.pushReplacementNamed(context, HematologistLoginScreen.id);
    }
  } else if (role == "Patient/Family Member") {
    if (pubKey == await Patient.getPubKeyPatient1NYU()) {
      Navigator.pushReplacementNamed(context, PatientActionScreen.id);
    } else if (pubKey == await Patient.getPubKeyPatient2NYU()) {
      Navigator.pushReplacementNamed(context, PatientActionScreen.id);
    } else if (pubKey == await Patient.getPubKeyPatient3MtSinai()) {
      Navigator.pushReplacementNamed(context, PatientActionScreen.id);
    } else {
      print('not found');
    }
  } else if (role == "Blood Bank") {
    if (pubKey == await BloodBank.getPubKeyBloodBank()) {
      Navigator.pushReplacementNamed(context, BloodBankActionScreen.id);
    } else {
      print('not found');
    }
  } else if (role == "Hospital") {
    if (pubKey == await Hospital.getPubKeyHospitalMtSinai()) {
      Navigator.pushReplacementNamed(context, MtSinaiHospitalActionScreen.id);
    } else if (pubKey == await Hospital.getPubKeyHospitalNYU()) {
      Navigator.pushReplacementNamed(context, NYUHospitalActionScreen.id);
    } else {
      print('not found');
    }
  } else if (role == "Doctor") {
    if (pubKey == await Doctor.getPubKeyDoctorMtSinai()) {
      Navigator.pushReplacementNamed(context, MtSinaiDoctorActionScreen.id);
    } else if (pubKey == await Doctor.getPubKeyDoctorNYU()) {
      Navigator.pushReplacementNamed(context, NYUDoctorActionScreen.id);
    } else {
      print('not found');
    }
  } else {
    print('not found');
  }
}
