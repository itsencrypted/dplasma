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
      },
    );
  }
}