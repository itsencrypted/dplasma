import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dplasma/components/dharma_button.dart';
import 'package:dplasma/constants.dart';
import 'package:dplasma/utils/ethereum_utils.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3dart/web3dart.dart';

class DonorActionScreen extends StatefulWidget {
  static const String id = 'donorAction_screen';

//  https://pub.dev/packages/geolocator#-readme-tab-
  var image = "";
  DonorActionScreen({this.image});
  @override
  _DonorActionScreenState createState() => _DonorActionScreenState();
}

class _DonorActionScreenState extends State<DonorActionScreen> {
  SharedPreferences prefs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () async {
      prefs = await SharedPreferences.getInstance();
    });
  }

  void getCurrentLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

//NYU Hospital @40.742746,-73.9759226,
//Mount Sinai Hospital @40.7899953,-73.9571022
  void showInfoMessage(msg) {
    AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        animType: AnimType.BOTTOMSLIDE,
        tittle: 'AWESOME!',
        desc: msg,
        btnCancelOnPress: () {
          Navigator.pop(context);
        },
        btnOkOnPress: () {
          Navigator.pop(context);
        }).show();
  }

// New York Blood Center: @40.7494885,-73.9895941,
  final kLightGreen = Color(0xFF95E08E);
  @override
  Widget build(BuildContext context) {
    // Funcao ir no banco de sangue colido e "action" donation
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
                tag: widget.image,
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.image),
                          fit: BoxFit.cover)),
                )),
                SizedBox(
                  height: 20,
                ),
            SizedBox(
              width: 400,
              child: TextLiquidFill(
                // loadDuration: Duration(
                //   seconds: 35
                // ),
                waveDuration: Duration(seconds: 35),
                text: 'Donating',
                waveColor: Colors.amber,
                boxBackgroundColor: Colors.black,
                textStyle: TextStyle(
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                ),
                boxHeight: 113.0,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            DharmaButton(
              onPressed: () async {
                EthereumAddress pubKeyBloodBank =
                    await EthereumUtils.getPublicKey(pvteKeyBloodBank);
                var res = await EthereumUtils.sendInformationToContract(
                    prefs.getString('privateKey'),
                    "donationScheduled",
                    [pubKeyBloodBank]);
                print(res);
                showInfoMessage("Thanks for saving a life!");
              },
              titleOfButton: 'Register plasma donation in the Blockchain',
            ),
          ],
        ),
      ),
    );
  }
}
