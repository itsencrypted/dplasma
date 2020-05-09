import 'package:intl/intl.dart';
import 'blood_types.dart';

//DateFormat.yMd('en_US').parse('1/10/2012');
//print(new DateTime.now().millisecondsSinceEpoch);
//https://pub.dev/packages/intl#-readme-tab-

class Donor{
//  address donorAddress;
  String city;
  BloodTypes bloodType;
  DateTime birthDate;
  //person must be between 18 and 50
  double bodyWeight;
  //person must be heavier than 110 llbs (50kg) to donate
  DateTime lastDonation;
  //if date is less than 4 weeks, person is not available to donate
  bool serologicalTestIsPositive;
  //if true (and we want TRUE)>>> person has antibodies, if false, not eligible to do clinical trials or donate plasma for CPP
  DateTime dateOfFirstSymptom;
  DateTime dateOfLastSymptom;
  bool pcrResultIsNegative;
  //if true (and we want TRUE)>>> person is not infected with SARS-Covid-19, if false, person tested positive hence, person has the virus and cant donate plasma for CPP
  bool active;
  bool isFemale;
  bool hadAnyPregnanciesorMiscarriagesMoreThanTwiceIsTrue;
  //if true >>> risks of TRALI (transfusion-related acute lung injury), person can't donate plasma or she might kill the patient of lung complication
  DateTime lastTattoo;
//if date is less than 12 months from now, person can't donate

  Donor({this.city,
    this.bloodType,
    this.birthDate,
    this.bodyWeight,
    this.lastDonation,
    this.serologicalTestIsPositive,
    this.dateOfFirstSymptom,
    this.dateOfLastSymptom,
    this.pcrResultIsNegative,
    this.active,
    this.isFemale,
    this.hadAnyPregnanciesorMiscarriagesMoreThanTwiceIsTrue,
    this.lastTattoo,
  });
}


//void donorSignup(
// string memory city,
//BloodTypes bloodType,
//    uint256 birthDate,
//uint256 bodyWeight,
//    uint256 lastDonation,
//bool serologicalTestIsPositive,
//    uint256 dateOfFirstSymptom,
//uint256 dateOfLastSymptom,
//    bool pcrResultIsNegative,
//bool isFemale,
//    bool hadAnyPregnanciesorMiscarriagesMoreThanTwiceIsTrue,
//uint256 lastTattoo) {}



