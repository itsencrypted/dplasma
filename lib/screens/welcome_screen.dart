import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dplasma/constants.dart';
import 'package:dplasma/models/login_model.dart';
import 'package:dplasma/screens/login_donor_screen.dart';
import 'package:dplasma/screens/login_hematologist_screen.dart';
import 'package:dplasma/screens/registration_bloodbank_screen.dart';
import 'package:dplasma/screens/registration_doctor_screen.dart';
import 'package:dplasma/screens/registration_donor_screen.dart';
import 'package:dplasma/screens/registration_hematologist_screen.dart';
import 'package:dplasma/screens/registration_hospital_screen.dart';
import 'package:dplasma/screens/registration_patient_screen.dart';
import 'package:dplasma/utils/ethereum_utils.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:web3dart/web3dart.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  AnimationController controller;
  Animation animation;
  String selectedItem = "select";
  bool show = false;
  String pvteKey = "";
  String errorMsg = null;

  final kLightBlueish = Color(0xFF33BBB5);
  final kLightGreen = Color(0xFF95E08E);
  List<DropdownMenuItem<String>> types_dropdown = List();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        show = true;
      });
    });

    types_dropdown.clear();

    types_dropdown.add(
      DropdownMenuItem(
        value: 'select',
        child: Text('Please Register as a:'),
      ),
    );
    var types = [
      'Donor',
      'Patient/Family Member',
      'Blood Bank',
      'Hospital',
      'Doctor',
      'Hematologist'
    ];

    var i = 0;
    while (i < types.length) {
      types_dropdown.add(DropdownMenuItem(
        value: types[i],
        child: Text(types[i]),
      ));
      i++;
    }
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    // controller.dispose();
  }

  // void getInfo() async {

  //   List info = await
  //   EthereumUtils.getInformationFromContract(
  //       pvteKeyDonor1,
  //       "hematologists",
  //       [address]
  //   );

  //   print(info[0]);
  // }

  void selectRoleAction() {
    switch (selectedItem) {
      case "Donor":
        Navigator.pushNamed(context, DonorSignUpScreen.id);
        break;
      case "Hematologist":
        Navigator.pushNamed(context, HematologistSignUpScreen.id);
        break;
      case "Patient/Family Member":
        Navigator.pushNamed(context, PatientSignUpScreen.id);
        break;
      case "Blood Bank":
        Navigator.pushNamed(context, BloodBankSignUpScreen.id);
        break;
      case "Hospital":
        Navigator.pushNamed(context, HospitalSignUpScreen.id);
        break;
      case "Doctor":
        Navigator.pushNamed(context, DoctorSignUpScreen.id);
        break;
    }
  }

  void setErrorMessage(msg) {
    AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.BOTTOMSLIDE,
            tittle: 'Attention',
            desc:msg,
            btnCancelOnPress: () {},
            btnOkOnPress: () {})
        .show();
  }

  @override
  Widget build(BuildContext context) {
    // getInfo();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AnimatedContainer(
            duration: Duration(seconds: 15),
            color: show ? kLightGreen : Colors.black,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                        child: Image.asset('assets/images/virus.png'),
                        height: 280),
                  ),
                ),
                Image.asset(
                  'assets/images/logo-transparent.png',
                  height: 280,
                ),
                SizedBox(
                  width: 350.0,
                  child: ColorizeAnimatedTextKit(
                      onTap: () {
                        print("Tap Event");
                      },
                      text: [
                        "dPlasma",
                        "dPlasma",
                        "dPlasma",
                        "dPlasma",
                      ],
                      textStyle: TextStyle(
                        fontSize: 70.0,
                        fontFamily: "Horizon",
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                      colors: [
                        Colors.green.shade700,
                        Colors.deepPurpleAccent,
                        Colors.blue,
                        Colors.yellow,
                        Colors.red,
                      ],
                      textAlign: TextAlign.center,
                      alignment:
                          AlignmentDirectional.topStart // or Alignment.topLeft
                      ),
                ),
//                  Text(
//                    'dPlasma',
//                    style: TextStyle(fontSize: 60.0, color: Color(0xFFFFFFFF)),
//                  ),
                Text(
                  'Passive Immunity to Patients',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.green.shade700,
                      letterSpacing: 2),
                ),
                SizedBox(
                  height: 50,
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 16.0, right: 16),
                //   child: TextFormField(
                //     onChanged: (value) {
                //       pvteKey = value;
                //     },
                //     decoration: InputDecoration(
                //         border: OutlineInputBorder(),
                //         labelText: 'Private Key',
                //         errorText: errorMsg),
                //   ),
                // ),
                DropdownButton(
                  items: types_dropdown,
                  onChanged: (item) {
                    setState(() => selectedItem = item);
                  },
                  value: selectedItem,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MaterialButton(
                      color: Colors.black,
                      onPressed: selectRoleAction,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    MaterialButton(
                      color: Colors.black,
                      onPressed: () {
                        login(selectedItem, pvteKey, context, setErrorMessage);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
        ],
      ),
    );
  }
}
