import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

class DonorActionScreen extends StatefulWidget {
  static const String id = 'donorAction_screen';

//  https://pub.dev/packages/geolocator#-readme-tab-

  @override
  _DonorActionScreenState createState() => _DonorActionScreenState();
}

class _DonorActionScreenState extends State<DonorActionScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void getCurrentLocation()async{
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
}

//NYU Hospital @40.742746,-73.9759226,
//Mount Sinai Hospital @40.7899953,-73.9571022

// New York Blood Center: @40.7494885,-73.9895941,


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
