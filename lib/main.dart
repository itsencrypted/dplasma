import 'package:dplasma/screens/action_bloodbank_screen.dart';
import 'package:dplasma/screens/action_doctor_screen.dart';
import 'package:dplasma/screens/action_donor_screen.dart';
import 'package:dplasma/screens/action_familymember_screen.dart';
import 'package:dplasma/screens/action_hematologist_screen.dart';
import 'package:dplasma/screens/action_hospital_screen.dart';
import 'package:dplasma/screens/login_bloodbank_screen.dart';
import 'package:dplasma/screens/login_doctor_screen.dart';
import 'package:dplasma/screens/login_donor_screen.dart';
import 'package:dplasma/screens/login_familymember_screen.dart';
import 'package:dplasma/screens/login_hematologist_screen.dart';
import 'package:dplasma/screens/login_hospital_screen.dart';
import 'package:dplasma/screens/registration_bloodbank_screen.dart';
import 'package:dplasma/screens/registration_doctor_screen.dart';
import 'package:dplasma/screens/registration_donor_screen.dart';
import 'package:dplasma/screens/registration_familymember_screen.dart';
import 'package:dplasma/screens/registration_hematologist_screen.dart';
import 'package:dplasma/screens/registration_hospital_screen.dart';
import 'package:flutter/material.dart';
import 'package:dplasma/screens/welcome_screen.dart';

void main() => runApp(DPlasma());

class DPlasma extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        DonorSignUpScreen.id: (context) => DonorSignUpScreen(),
        FamilyMemberSignUpScreen.id: (context) => FamilyMemberSignUpScreen(),
        HospitalSignUpScreen.id: (context) => HospitalSignUpScreen(),
        BloodBankSignUpScreen.id: (context) => BloodBankSignUpScreen(),
        DoctorSignUpScreen.id: (context) => DoctorSignUpScreen(),
        HematologistSignUpScreen.id: (context) => HematologistSignUpScreen(),
        DonorLoginScreen.id: (context) => DonorLoginScreen(),
        FamilyMemberLoginScreen.id: (context) => FamilyMemberLoginScreen(),
        HospitalLoginScreen.id: (context) => HospitalLoginScreen(),
        BloodBankLoginScreen.id: (context) => BloodBankLoginScreen(),
        DoctorLoginScreen.id: (context) => DoctorLoginScreen(),
        HematologistLoginScreen.id: (context) => HematologistLoginScreen(),
        DonorActionScreen.id: (context) => DonorActionScreen(),
        FamilyMemberActionScreen.id: (context) => FamilyMemberActionScreen(),
        HospitalActionScreen.id: (context) => HospitalActionScreen(),
        BloodBankActionScreen.id: (context) => BloodBankActionScreen(),
        DoctorActionScreen.id: (context) => DoctorActionScreen(),
        HematologistActionScreen.id: (context) => HematologistActionScreen(),
      },
    );
  }
}