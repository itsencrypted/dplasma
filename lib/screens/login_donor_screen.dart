import 'package:dplasma/components/dharma_button.dart';
import 'package:dplasma/screens/map_bloodbanks_ny_screen.dart';
import 'package:flutter/material.dart';

class DonorLoginScreen extends StatefulWidget {
  static const String id = 'donorLogin_screen';

  @override
  _DonorLoginScreenState createState() => _DonorLoginScreenState();
}

class _DonorLoginScreenState extends State<DonorLoginScreen> {
  var cities = ['New York', 'Paris', 'Miami', 'São Paulo'];

  String selectedItem = "select";
  List<DropdownMenuItem<String>> cities_dropdown = List();

  @override
  void initState() {
    super.initState();
    cities_dropdown.clear();

    cities_dropdown.add(
      DropdownMenuItem(
        value: 'select',
        child: Text('Please select your city:'),
      ),
    );

    var i = 0;
    while (i < cities.length) {
      cities_dropdown.add(DropdownMenuItem(
        value: cities[i],
        child: Text(cities[i]),
      ));
      i++;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //Todo : esta tela vai receber a public key do doador
    // mesma coisa do ambherdata, quando ele esta
    // escolher cidade, nova york please display
    return Scaffold(
        body: Center(
            child: Column(children: <Widget>[
      Text('This is Donor Login Screen'),
      Text('Please select your current city'),
      DropdownButton(
        items: cities_dropdown,
        value: selectedItem,
        onChanged: (value) {
          setState(() {
            selectedItem = value;
          });
        },
      ),
      DharmaButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, MapBloodBanksScreen.id);
        },
        titleOfButton: 'Find the closest Blood Bank',
      ),
    ])));
  }
}
