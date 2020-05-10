import 'package:dplasma/constants.dart';
import 'package:dplasma/models/hematogist.dart';
import 'package:dplasma/utils/ethereum_utils.dart';
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

  static getPubKeyBloodBank() async {
    EthereumAddress pubKeyBloodBank =
        await EthereumUtils.getPublicKey(pvteKeyBloodBank);
    return pubKeyBloodBank.hex;
  }
  
}

//TODO: 1. Stopped over here. Need to get more blood banks geolocations in NY
// New York Blood Center: @40.7494885,-73.9895941,


//receive plasma requests (from hematologistDoctor) >> getPlasma(){} >>> bate
// no banco de sangue

// Banco de Sangue  >>> devolve Bolsa de Plasma para NYU Hospital (A)

// devolve bolsa de plasma para Mt Sinai Hospital (B)

// Banco de sangue fica com sangue A+ em estoque >>> ninguem precisou




