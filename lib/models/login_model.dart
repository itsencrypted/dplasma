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

import '../constants.dart';

void login(selectedItem, pvteKey, context, setErrorMessage) {
  switch (selectedItem) {
    case "Donor":
      if (pvteKey == pvteKeyDonor1) {
        Navigator.pushNamed(context, DonorLoginScreen.id);
      } else {
        setErrorMessage(
            "Sorry, you're not registered as a Donor. Please sign up as a Donor");
      }
      break;
    case "Hematologist":
      if (pvteKey == pvteKeyHematologist) {
        Navigator.pushNamed(context, HematologistLoginScreen.id);
      } else {
        setErrorMessage(
            "Sorry, you're not registered as a Hematologist. Please sign up as a Hematologist");
      }
      break;
    case "Patient/Family Member":
      if (pvteKey == pvteKeyPatient1NYU ||
          pvteKey == pvteKeyPatient2NYU ||
          pvteKey == pvteKeyPatient3MtSinai) {
        Navigator.pushNamed(context, PatientLoginScreen.id);
      } else {
        setErrorMessage(
            "Sorry, you're not registered as a Patient/Family Member. Please sign up as a Patient/Family Member");
      }
      break;
    case "Blood Bank":
      if (pvteKey == pvteKeyBloodBank) {
        Navigator.pushNamed(context, BloodBankLoginScreen.id);
      } else {
        setErrorMessage(
            "Sorry, you're not registered as a Blood Bank. Please sign up as a Blood Bank");
      }
      break;
    case "Hospital":
      if (pvteKey == pvteKeyHospitalNYU || pvteKey == pvteKeyHospitalMtSinai) {
        Navigator.pushNamed(context, HospitalLoginScreen.id);
      } else {
        setErrorMessage(
            "Sorry, you're not registered as a Hospital. Please sign up as a Hospital");
      }
      break;
    case "Doctor":
      if (pvteKey == pvteKeyDoctorNYU || pvteKey == pvteKeyDoctorMtSinai) {
        Navigator.pushNamed(context, HospitalLoginScreen.id);
      } else {
        setErrorMessage(
            "Sorry, you're not registered as a Doctor. Please sign up as a Doctor");
      }
      break;
  }
}
