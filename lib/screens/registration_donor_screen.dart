import 'package:flutter/material.dart';
import 'package:web3dart/credentials.dart';


class DonorSignUpScreen extends StatefulWidget {
  static const String id = 'donorReg_screen';

  @override
  _DonorSignUpScreenState createState() => _DonorSignUpScreenState();
}

class _DonorSignUpScreenState extends State<DonorSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


//getPublicKeyFromPrivateKey() async{
//  String prefix = '0x';
//  String fullKey = prefix + privateKey;
//  Credentials fromHex = EthPrivateKey.fromHex(fullKey);
//  Future<EthereumAddress> addr = fromHex.extractAddress();
//  addr.then((value) => xyz = value);
//  return xyz.toString();
//}