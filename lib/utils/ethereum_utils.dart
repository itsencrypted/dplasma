import 'dart:async';
import 'dart:collection';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;
import 'package:hex/hex.dart';
import 'package:dplasma/constants.dart';


class EthereumUtils {
  static String abiPath = "assets/contracts/abi.json";
  static Web3Client client = Web3Client( apiUrl,
      http.Client());


  static Future<DeployedContract> generateContract() {
    Completer<DeployedContract> completer = Completer();
    rootBundle.loadString(abiPath).then((abi) async {
      DeployedContract contract = DeployedContract(
          ContractAbi.fromJson(abi, "dPlasmaContract"),
          EthereumAddress.fromHex(dPlasmaContractAddress));
      completer.complete(contract);
    });
    return completer.future;
  }

  static Future<String> sendInformationToContract(
      String privateKey, String action, List parameters) async {
    Completer<String> completer = new Completer();
    DeployedContract contract = await generateContract();
    Credentials credentials = getCredentials(privateKey);
    credentials.extractAddress();
//    print(contract.functions);
    ContractFunction function = contract.function(action);
    await client
        .sendTransaction(
            credentials,
            Transaction.callContract(
                contract: contract,
                function: function,
                maxGas: 500000,
                parameters: parameters),
            chainId: Rinkeby)
        .then((hash) {
      completer.complete(hash);
    });
    return completer.future;
  }

  //// You can create Credentials from private keys
//Credentials fromHex = EthPrivateKey.fromHex(pvteKeyHematologist);

  static Credentials getCredentials(privKey) {
    Credentials credentials = EthPrivateKey.fromHex(privKey);
    return credentials;
  }

  //// In either way, the library can derive the public key and the address
//// from a private key:
//  var address = await credentials.extractAddress();
//  print(address.hex);
//

//  static Future<HashMap> createWallet() async {
//    var rng = Random.secure();
//    Credentials creds = EthPrivateKey.createRandom(rng);
//    Wallet wallet = Wallet.createNew(
//        creds, "HuLFznHQ8KgOMj5GXGCgntf3Jm6tNatWWUYLtds8l9R", rng);
//    var address = await creds.extractAddress();
//    var add = EthereumAddress.fromHex(address.toString());
//    String ppk = HEX.encode(wallet.privateKey.privateKey);
//    HashMap obj = HashMap();
//    obj['privKey'] = ppk;
//    obj['pubKey'] = add;
//     return obj;
//  }
}

