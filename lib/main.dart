import 'package:dplasma/components/animations.dart';
import 'package:dplasma/screens/action_bloodbank_screen.dart';
import 'package:dplasma/screens/action_mtsinai_doctor_screen.dart';
import 'package:dplasma/screens/action_nyu_doctor_screen.dart';
import 'package:dplasma/screens/action_donor_screen.dart';
import 'package:dplasma/screens/action_nyuhospital_screen.dart';
import 'package:dplasma/screens/action_patient_screen.dart';
import 'package:dplasma/screens/action_hematologist_screen.dart';
import 'package:dplasma/screens/action_mtsinaihospital_screen.dart';
import 'package:dplasma/screens/login_bloodbank_screen.dart';
import 'package:dplasma/screens/login_doctor_screen.dart';
import 'package:dplasma/screens/login_donor_screen.dart';
import 'package:dplasma/screens/login_patient_screen.dart';
import 'package:dplasma/screens/login_hematologist_screen.dart';
import 'package:dplasma/screens/login_hospital_screen.dart';
import 'package:dplasma/screens/map_bloodbanks_ny_screen.dart';
import 'package:dplasma/screens/registration_bloodbank_screen.dart';
import 'package:dplasma/screens/registration_doctor_screen.dart';
import 'package:dplasma/screens/registration_donor_screen.dart';
import 'package:dplasma/screens/registration_patient_screen.dart';
import 'package:dplasma/screens/registration_hematologist_screen.dart';
import 'package:dplasma/screens/registration_hospital_screen.dart';
import 'package:flutter/material.dart';
import 'package:dplasma/screens/welcome_screen.dart';

void main() => runApp(DPlasma());

class DPlasma extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp (
//      initialRoute: WelcomeScreen.id,
//      initialRoute: HematologistLoginScreen.id,
//      initialRoute: BloodBankActionScreen.id,
//      initialRoute: BloodBankLoginScreen.id,
//      initialRoute: NYUHospitalActionScreen.id,
//      initialRoute: MtSinaiHospitalActionScreen.id,
//      initialRoute: MtSinaiDoctorActionScreen.id,
//      initialRoute: DonorActionScreen.id,
//      initialRoute: DonorLoginScreen.id,
      debugShowCheckedModeBanner: false,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
//        LoginScreen.id: (context) => LoginScreen(),
        DonorSignUpScreen.id: (context) => DonorSignUpScreen(),
        PatientSignUpScreen.id: (context) => PatientSignUpScreen(),
        HospitalSignUpScreen.id: (context) => HospitalSignUpScreen(),
        BloodBankSignUpScreen.id: (context) => BloodBankSignUpScreen(),
        DoctorSignUpScreen.id: (context) => DoctorSignUpScreen(),
        HematologistSignUpScreen.id: (context) => HematologistSignUpScreen(),
        DonorLoginScreen.id: (context) => DonorLoginScreen(),
        PatientLoginScreen.id: (context) => PatientLoginScreen(),
        HospitalLoginScreen.id: (context) => HospitalLoginScreen(),
        BloodBankLoginScreen.id: (context) => BloodBankLoginScreen(),
        DoctorLoginScreen.id: (context) => DoctorLoginScreen(),
        HematologistLoginScreen.id: (context) => HematologistLoginScreen(),
        DonorActionScreen.id: (context) => DonorActionScreen(),
        PatientActionScreen.id: (context) => PatientActionScreen(),

        MtSinaiHospitalActionScreen.id: (context) => MtSinaiHospitalActionScreen(),
        NYUHospitalActionScreen.id: (context) => NYUHospitalActionScreen(),

        BloodBankActionScreen.id: (context) => BloodBankActionScreen(),

        NYUDoctorActionScreen.id: (context) => NYUDoctorActionScreen(),
        MtSinaiDoctorActionScreen.id: (context) => MtSinaiDoctorActionScreen(),

        MapBloodBanksScreen.id: (context) => MapBloodBanksScreen(),
        HematologistActionScreen.id: (context) => HematologistActionScreen(),
        AnimationsExamples.id: (context) => AnimationsExamples(),
      },
    );
  }
}