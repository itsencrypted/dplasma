import 'package:dplasma/models/blood_bank.dart';
import 'package:dplasma/screens/action_donor_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BloodBankCard extends StatelessWidget {
  BloodBank bloodBank;
  BloodBankCard({this.bloodBank});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, DonorActionScreen.id);
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        width: 210,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Positioned(
              bottom: 15.0,
              child: Container(
                height: 169.0,
                width: 200.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '${bloodBank.name}',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                      SizedBox(height: 2.0),
                      Text(
                        bloodBank.address,
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 2.0),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    )
                  ]),
              child: Stack(
                children: <Widget>[
                  Hero(
                    tag: bloodBank.image,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                            height: 165.0,
                            width: 165.0,
                            image: NetworkImage(bloodBank.image),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    left: 10.0,
                    bottom: 10.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.locationArrow,
                              size: 10.0,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              'NY',
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//// ignore: unnecessary_statements
//itemBuilder: (BuildContext context, int index){4;
//return Container(
//margin: EdgeInsets.all(10.0),
//width: 210,
//color: kGreyish,
//child: Stack(children: <Widget>[
//Container(
//height: 120.0,
//width: 200.0,
//decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.0)
//),
//child: Column(
//crossAxisAlignment: CrossAxisAlignment.start,
//children: <Widget>[
//Text('8 beds available'),
//Text('This hospital is considered the best cardiology center in Latin America'),
//],),
//)
//],
//)
//);
//}
