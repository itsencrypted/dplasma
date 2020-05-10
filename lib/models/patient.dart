import 'package:dplasma/constants.dart';
import 'package:dplasma/utils/ethereum_utils.dart';
import 'package:web3dart/credentials.dart';

import 'blood_types.dart';

class Patient {
//  address patientAddress;
  String city;
  String hospital;
  BloodTypes bloodType;
  bool isINDregistered;
//Investigational New Drug (IND) >> sick/terminal patients or family members must sign
//TODO: encher com as variaveis daqui: https://www.nybc.org/donate-blood/covid-19-and-blood-donation-copy/convalescent-plasma-information-family-patient-advocates/

  static getPubKeyPatient1NYU() async {
    EthereumAddress pubKeyPatient1NYU =
        await EthereumUtils.getPublicKey(pvteKeyPatient1NYU);
    return pubKeyPatient1NYU.hex;
  }

  static getPubKeyPatient2NYU() async {
    EthereumAddress pubKeyPatient2NYU =
        await EthereumUtils.getPublicKey(pvteKeyPatient2NYU);
    return pubKeyPatient2NYU.hex;
  }

  static getPubKeyPatient3MtSinai() async {
    EthereumAddress pubKeyPatient3MtSinai =
        await EthereumUtils.getPublicKey(pvteKeyPatient3MtSinai);
    return pubKeyPatient3MtSinai.hex;
  }
  
}
