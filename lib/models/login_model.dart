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
