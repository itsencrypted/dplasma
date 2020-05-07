import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dplasma/models/blood_bank.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:web3dart/web3dart.dart';
import 'package:geolocation/geolocation.dart' as geolocation;

class BloodBanksScreen extends StatefulWidget {
  static const String id = 'blood_banks_screen';

  @override
  _BloodBanksScreenState createState() => _BloodBanksScreenState();
}

class _BloodBanksScreenState extends State<BloodBanksScreen> {
  // LatLng _center = LatLng(40.762681, -73.832611);
  bool isLoading = true;
  List<BloodBank> bloodBanks = List();
  MapboxMapController mapController;
  PageController controller = PageController(
    viewportFraction: 0.8,
    initialPage: 0,
  );
  // SymbolOptions(
  //       geometry: LatLng(position.latitude, position.longitude),
  //       textAnchor: "Here",
  //       iconImage: 'assets/images/red-cross.png',
  //       iconSize: 0.1,
  //       iconColor: '#CCCCCC'
  //     )

  Symbol currentLocation = new Symbol(
      "currentLocation",
      SymbolOptions(
          geometry: LatLng(0,0),
          textAnchor: "Here",
          iconImage: 'assets/images/red-cross.png',
          iconSize: 0.1,
          iconColor: '#CCCCCC'));

  void getBloodBanks() async {
    setState(() {
      isLoading = true;
    });
    Dio dio = Dio();
    Response bloodBanksApi = await dio.get(
        'https://raw.githubusercontent.com/BrunoEleodoro/dPlasma_data/master/blood_banks_google.json');
    var i = 0;
    var json = jsonDecode(bloodBanksApi.data);
    bloodBanks.clear();
    while (i < json.length) {
      LatLng geometry = LatLng(json[i]['geometry']['location']['lat'],
          json[i]['geometry']['location']['lng']);

      BloodBank bloodBank = BloodBank(
          address: json[i]['formatted_address'],
          geometry: geometry,
          bloodbankAddress: EthereumAddress.fromHex(
              "0x0000000000000000000000000000000000000000"),
          image: json[i]['image']);

      bloodBanks.add(bloodBank);

      mapController.addSymbol(SymbolOptions(
        geometry: bloodBank.geometry,
        textAnchor: bloodBank.address,
        iconImage: 'assets/images/red-cross.png',
        iconSize: 0.1,
      ));
      i++;
    }

    setState(() {
      isLoading = false;
    });
  }

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
    getBloodBanks();
  }

  void getCurrentLocation() async {
    await geolocation.Geolocation.enableLocationServices();

    var status = await Permission.location;

    print(status);
    var geolocator = Geolocator();
    var locationOptions =
        LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);

    StreamSubscription<Position> positionStream = geolocator
        .getPositionStream(locationOptions)
        .listen((Position position) {
      print(position == null
          ? 'Unknown'
          : position.latitude.toString() +
              ', ' +
              position.longitude.toString());
              // mapController.symbols.toList();
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        MapboxMap(
          myLocationEnabled: true,
          onMapClick: (point, coordinates) {
            // print('clicked');
            // print(point);
            // print(coordinates);
          },
          zoomGesturesEnabled: true,
          styleString:
              'mapbox://styles/brunoeleodoro/ck9wuqx8y0t0r1imtbdl44yrj',
          onMapCreated: _onMapCreated,
          initialCameraPosition: const CameraPosition(
              target: LatLng(40.812975, -73.919552), zoom: 10),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(bottom: 10),
            height: 208,
            child: PageView.builder(
                itemCount: bloodBanks.length,
                itemBuilder: (context, index) {
                  BloodBank e = bloodBanks[index];
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              image: DecorationImage(
                                  image: NetworkImage(e.image),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              color: Colors.black.withOpacity(0.3)),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: Image.asset(
                              'assets/images/red-cross.png',
                              width: 30,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 18.0, left: 8, right: 8),
                              child: Text(
                                e.address,
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Image.asset(
                        //   'assets/images/red-cross.png',
                        //   width: 30,
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Text(e.address)
                      ],
                    ),
                  );
                },
                onPageChanged: (page) {
                  Symbol marker = mapController.symbols.toList()[page];
                  mapController.animateCamera(
                      CameraUpdate.newCameraPosition(CameraPosition(
                    target: marker.options.geometry,
                    zoom: 13,
                  )));
                },
                controller: PageController(
                  viewportFraction: 0.5,
                  initialPage: 0,
                )),
          ),
        )
      ],
    ));
  }
}
