import 'package:flutter/material.dart';
import 'package:dplasma/constants.dart';

class DharmaButton extends StatelessWidget {
  DharmaButton({this.titleOfButton, @required this.onPressed});

  final String titleOfButton;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: onPressed,
        textColor: Colors.white,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: <Color>[
                kDharma1,
                kDharma2,
                kDharma3,
                kDharma4,
                kDharma5,
              ],
            ),
          ),
          padding: EdgeInsets.all(15.0),
          child: Text(
            titleOfButton,
            style: TextStyle(fontSize: 15.0, fontFamily: '', color: Colors
                .white, ),
          ),
        ));
  }
}