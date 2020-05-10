import 'package:dplasma/constants.dart';
import 'package:dplasma/utils/ethereum_utils.dart';
import 'package:web3dart/credentials.dart';

class Doctor {
//  address doctorAddress;
  bool ishematologistDoctor;

  static getPubKeyDoctorMtSinai() async {
    EthereumAddress pubKeyDoctorMtSinai =
        await EthereumUtils.getPublicKey(pvteKeyDoctorMtSinai);
    return pubKeyDoctorMtSinai.hex;
  }

   static getPubKeyDoctorNYU() async {
    EthereumAddress pubKeyDoctorNYU =
        await EthereumUtils.getPublicKey(pvteKeyDoctorNYU);
    return pubKeyDoctorNYU.hex;
  }
}
