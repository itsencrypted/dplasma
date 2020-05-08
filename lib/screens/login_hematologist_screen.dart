import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HematologistLoginScreen extends StatefulWidget {
  static const String id = 'hematologistLogin_screen';

  @override
  _HematologistLoginScreenState createState() => _HematologistLoginScreenState();
}

class _HematologistLoginScreenState extends State<HematologistLoginScreen> {
  SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
        prefs = await SharedPreferences.getInstance();
        if(prefs.getString('privateKey') != null) {

        } else {
          
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

      ),
    );
  }
}
