import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';

class BloodBank {
  EthereumAddress bloodbankAddress;
  String address;
  LatLng geometry;
  String name;
  String image;
  String city;
//TODO: encher com as variaveis daqui: https://www.oneblood.org/
  BloodBank({
    this.bloodbankAddress,
    this.address,
    this.geometry,
    this.name,
    this.image
  });
}

//TODO: 1. Stopped over here. Need to get more blood banks geolocations in NY
// New York Blood Center: @40.7494885,-73.9895941,
