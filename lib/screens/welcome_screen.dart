import 'package:dplasma/screens/login_donor_screen.dart';
import 'package:dplasma/screens/registration_bloodbank_screen.dart';
import 'package:dplasma/screens/registration_donor_screen.dart';
import 'package:dplasma/screens/registration_hematologist_screen.dart';
import 'package:dplasma/screens/registration_hospital_screen.dart';
import 'package:dplasma/screens/registration_patient_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  String selectedItem = "select";

  final kLightBlueish = Color(0xFF33BBB5);
  final kLightGreen = Color(0xFF95E08E);
  List<DropdownMenuItem<String>> types_dropdown = List();



  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 15),
      vsync: this,
    );
    animation = ColorTween(begin: Colors.black, end: kLightGreen).animate
      (controller);
//    CurvedAnimation(parent: controller, curve: Curves.decelerate);

//    controller.reverse(from: 1.0);

    controller.forward();

//    animation.addStatusListener((status) {
//      if (status == AnimationStatus.completed){
//        controller.reverse(from: 1.0);}
//      else if (status == AnimationStatus.dismissed){
//        controller.forward();
//      }
//    });

//    animation.addListener((){
//      setState(() {
//       print(animation.value);
//      });
//    });

    types_dropdown.clear();

    types_dropdown.add(
      DropdownMenuItem(
        value: 'select',
        child: Text('Please select your role:'),
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
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Hero(
                      tag: 'logo',
                      child: Container(
                          child: Image.asset('assets/images/virus.png'),
                          height: 300),
                    ),
                  ),
                  Image.asset('assets/images/logo-transparent.png', height:
                  300,),
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
                          fontSize: 90.0,
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
                        alignment: AlignmentDirectional
                            .topStart // or Alignment.topLeft
                    ),
                  ),
//                  Text(
//                    'dPlasma',
//                    style: TextStyle(fontSize: 60.0, color: Color(0xFFFFFFFF)),
//                  ),
                  Text(
                    'Passive Immunity to Patients',
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700, color: Colors
                        .green.shade700,
                        letterSpacing: 2),
                  ),
                  SizedBox(height: 50,),
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
                  MaterialButton(
                    color: Colors.black,
                    onPressed: () {
                      switch (selectedItem) {
//                        case "Donor":
//                          Navigator.pushNamed(
//                              context, DonorSignUpScreen.id);
//                          break;
                        case "Hematologist":
                          Navigator.pushNamed(
                              context, HematologistSignUpScreen.id);
                          break;
//                        case "Patient/Family Member":
//                          Navigator.pushNamed(
//                              context, PatientSignUpScreen.id);
//                          break;
//                        case "Blood Bank":
//                          Navigator.pushNamed(
//                              context, BloodBankSignUpScreen.id);
//                          break;
//                        case "Hospital":
//                          Navigator.pushNamed(context, HospitalSignUpScreen.id);
//                          break;
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('LOGIN', style: TextStyle(color: Colors.white),),
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
