import 'package:flutter/material.dart';

enum BloodTypes {
  A_Plus,
  A_Minus,
  B_Plus,
  B_Minus,
  AB_Plus,
  AB_Minus,
  O_Plus,
  O_Minus,
//
//const PLASMA_COMPATIBILITY = {
//  "ABPlus": ["O_Minus", "O_Plus", "A_Minus", "A_Plus", "B_Minus", "B+", "AB
//  −",
//  "AB"
//      "+"],
//  "ABMinus": ["O-", "A-", "B-", "AB-"],
//  "APlus": ["A−", "A+", "O−", "O+"],
//  "A-": ["A-", "O-"],
//  "B+": ["B−", "B+", "O−", "O+"],
//  "B-": ["B-", "O-"],
//  "O+": ["O−", "O+"],
//  "O-": ["O-"]
}
//
//class SelectBloodType extends StatelessWidget {
//  BoolQuestion({this.question, this.isParameterTrue, this.onChanged});
//
//  final BloodTypes bloodTypes;
//
//  @override
//  Widget build(BuildContext context) {
//    return CheckboxListTile(
////      title: Text('Are you an accredited hematologist?'),
////      value: isHematologist,
////      onChanged: (value){
////        setState(() {
////          isHematologist = value;
////          print(value);
////        });
//
//        title: Text(question),
//        value: isParameterTrue,
//        onChanged: onChanged
//    );
//  }
//}

//1	donor1 (A-)
//1	donor2 (A+)
//1	donor3 (B+)

//1	NYUpatient1 (B-)
//1	NYUpatient2 (AB+)
//1	MtSinaipatient3 (A-)

Widget getDropdownBloodTypesList() {
  var dropdownList = [
    DropdownMenuItem(
      value: 'select',
      child: Text('Please select your role:'),
    ),
    DropdownMenuItem(
      value: "0",
      child: Text("A+"),
    ),
    DropdownMenuItem(
      value: "1",
      child: Text("A-"),
    ),
    DropdownMenuItem(
      value: "2",
      child: Text("B+"),
    ),
    DropdownMenuItem(
      value: "3",
      child: Text("B-"),
    ),
    DropdownMenuItem(
      value: "4",
      child: Text("AB+"),
    ),
    DropdownMenuItem(
      value: "5",
      child: Text("AB-"),
    ),
    DropdownMenuItem(
      value: "6",
      child: Text("O+"),
    ),
    DropdownMenuItem(
      value: "7",
      child: Text("O-"),
    )
  ];
}
