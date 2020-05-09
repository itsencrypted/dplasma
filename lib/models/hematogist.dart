import 'package:dplasma/constants.dart';
import 'package:dplasma/utils/ethereum_utils.dart';
import 'package:web3dart/credentials.dart';

class Hematologist {

  Hematologist({this.hematologistAddress, this.hematologistName, this
      .isHematologist, this.city, });

  EthereumAddress hematologistAddress;
  String hematologistName;
  bool isHematologist;
  String city;

  static Future<Hematologist> getHematologist() async{
    EthereumAddress hematologistAddress = await (EthereumUtils
        .getCredentials
      (pvteKeyHematologist)).extractAddress();
    Hematologist hematologistExample = new Hematologist(
        hematologistAddress: hematologistAddress,
      hematologistName: 'Hematologist Example',
      isHematologist: false,
      city: 'New York',
    );
    return hematologistExample;
  }
}

//
////
////struct Hematologist {
////address hematologistAddress;
////string hematologistName;
////bool ishematologistDoctor;
////string city;
////}
//mapping(address => Hematologist) public hematologists;

// void requestPlasma(){}
//void  acceptBloodComponents(){}