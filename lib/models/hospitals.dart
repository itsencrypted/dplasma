import 'package:dplasma/constants.dart';
import 'package:dplasma/utils/ethereum_utils.dart';
import 'package:web3dart/credentials.dart';

class Hospital {
//  address hospitalAddress;
  String city;

  static getPubKeyHospitalNYU() async {
    EthereumAddress pubKeyHospitalNYU =
        await EthereumUtils.getPublicKey(pvteKeyHospitalNYU);
    return pubKeyHospitalNYU.hex;
  }

  static getPubKeyHospitalMtSinai() async {
    EthereumAddress pubKeyHospitalMtSinai =
        await EthereumUtils.getPublicKey(pvteKeyHospitalMtSinai);
    return pubKeyHospitalMtSinai.hex;
  }
}

class HospitalGeolocation {
  String city;
//  Lat latitude;
//  Long longitude;

}

//NYU Hospital @40.742746,-73.9759226,
//Mount Sinai Hospital @40.7899953,-73.9571022
