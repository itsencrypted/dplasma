import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dplasma/components/blood_bank_carousel_card.dart';
import 'package:dplasma/models/blood_bank.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:web3dart/web3dart.dart';
import 'package:geolocation/geolocation.dart' as geolocation;

class MapBloodBanksScreen extends StatefulWidget {
  static const String id = 'map_blood_banks_screen';

  @override
  _MapBloodBanksScreenState createState() => _MapBloodBanksScreenState();
}

class _MapBloodBanksScreenState extends State<MapBloodBanksScreen> {
  // LatLng _center = LatLng(40.762681, -73.832611);
  bool isLoading = true;
  List<BloodBank> bloodBanks = List();
  Set<Marker> markers = Set();

  PageController controller = PageController(
    viewportFraction: 0.8,
    initialPage: 0,
  );

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(40.812975, -73.919552),
    zoom: 10,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  void getBloodBanks() async {
    setState(() {
      isLoading = true;
    });
    GoogleMapController controller = await _controller.future;

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
          image: json[i]['image'],
          name: json[i]['name']);

      bloodBanks.add(bloodBank);
      BitmapDescriptor icon = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(), 'assets/images/marker_blood.png');
      markers.add(Marker(
          markerId: MarkerId(bloodBank.geometry.toString()),
          icon: icon,
          position: bloodBank.geometry,
          infoWindow: InfoWindow(
            title: bloodBank.name
          )));
      i++;
    }

    setState(() {
      isLoading = false;
      markers = markers;
    });
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
      // print(position == null
      //     ? 'Unknown'
      //     : position.latitude.toString() +
      //         ', ' +
      //         position.longitude.toString());
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
    Future.delayed(Duration.zero, () async {
      //waiting for google maps be ready to execute functions
      await _controller.future;

      //getting data from API
      getBloodBanks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: markers,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(bottom: 0),
            height: 340,
            child: PageView.builder(
                itemCount: bloodBanks.length,
                itemBuilder: (context, index) {
                  BloodBank e = bloodBanks[index];
                  return BloodBankCard(
                    bloodBank: e,
                  );
                },
                onPageChanged: (page) async {
                  BloodBank e = bloodBanks[page];
                  final GoogleMapController controller =
                      await _controller.future;
                  controller.animateCamera(
                    CameraUpdate.newCameraPosition(
                        CameraPosition(target: e.geometry, zoom: 14)),
                  );
                },
                controller: PageController(
                  viewportFraction: 0.6,
                  initialPage: 0,
                )),
          ),
        )
      ],
    ));
  }
}
