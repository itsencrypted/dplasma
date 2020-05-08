import 'dart:async';
import 'dart:collection';
import 'dart:math';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;
import 'package:hex/hex.dart';

// TODO: 
// constants.dart -> Lembrar de colocar 

class EthereumUtils {
  static String abiPath = "assets/abi.json";
  static String contractAddress = "0xD1CC1D57695E394cC48c8Dba4891160E66bAcB85";
  static Web3Client client = Web3Client(
      "https://rinkeby.infura.io/v3/6c35b5b0fa1b4010be4f0db6e60002cb",
      http.Client());
  static int chainId = 4;

  static Future<DeployedContract> generateContract() {
    Completer<DeployedContract> completer = Completer();
    rootBundle.loadString(abiPath).then((abi) async {
      DeployedContract contract = DeployedContract(
          ContractAbi.fromJson(abi, "dPlasmaContract"),
          EthereumAddress.fromHex(contractAddress));
      completer.complete(contract);
    });
    return completer.future;
  }

  static Future<String> sendInformationToContract(
      String privateKey, String action, List parameters) async {
    Completer<String> completer = new Completer();
    DeployedContract contract = await generateContract();
    Credentials credentials = getCredentials(privateKey);
    ContractFunction function = contract.function(action);
    await client
        .sendTransaction(
            credentials,
            Transaction.callContract(
                contract: contract,
                function: function,
                maxGas: 500000,
                parameters: parameters),
            chainId: chainId)
        .then((hash) {
      completer.complete(hash);
    });
    return completer.future;
  }

  static Credentials getCredentials(privKey) {
    Credentials credentials = EthPrivateKey.fromHex(privKey);
    return credentials;
  }

  static Future<HashMap> createWallet() async {
    var rng = Random.secure();
    Credentials creds = EthPrivateKey.createRandom(rng);
    Wallet wallet = Wallet.createNew(
        creds, "HuLFznHQ8KgOMj5GXGCgntf3Jm6tNatWWUYLtds8l9R", rng);
    var address = await creds.extractAddress();
    var add = EthereumAddress.fromHex(address.toString());
    String ppk = HEX.encode(wallet.privateKey.privateKey);
    HashMap obj = HashMap();
    obj['privKey'] = ppk;
    obj['pubKey'] = add;
     return obj;
  }
}
