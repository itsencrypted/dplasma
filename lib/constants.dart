import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kDharma1 = Color(0xFF2536FF);
const kDharma2 = Color(0xFFA323FE);
const kDharma3 = Color(0xFFFF1FCF);
const kDharma4 = Color(0xFFFE763E);
const kDharma5 = Color(0xFFFFA514);
const kLightBlueish = Color(0xFF33BBB5);
const kLightGreen = Color(0xFF95E08E);



const pvteKeyHematologist = "E89A693768D25915C91BAC74E02E2E347E593C533304047C"
    "992C1DC0067BE159";
const pvteKeyDoctorNYU = "276D63B5E60022F545C5375719A32A8B9A442B3282B0C6981AA"
    "74D4DB793322D";
const pvteKeyDoctorMtSinai = "8CC7F78F39BDA5F00C57B237C178F8D5A21EEEBD97C1F0F"
    "7EA33DD9D7953E4B3";
const pvteKeyHospitalNYU = "C6653CF065139510812526BBBD28E272FF4A2BF37A343DBA9"
    "C5CFAC4CE9DB572";
const pvteKeyHospitalMtSinai = "BF7240458E69C0E332D1D1911EB83E5AC76DCA34CE27C"
    "15CA84D20CAFCA4703E";
const pvteKeyPatient1NYU = "AB6FDA3BA705DFC2CA231B7A6808E521B3D5D1E900F4AEDF7"
    "6AE63B5972D9B99";
const pvteKeyPatient2NYU = "621C5FE5230E11B3E60422E7B62D9EEF0B8F63D6962EB7DA1"
    "98BDCDD4B12E5E2";
const pvteKeyPatient3MtSinai = '8AABDAA8F32DF2CF826BED488CC72517DC305C4B0D482'
    '6B78C6B18EEBFA05C9C';
const pvteKeyDonor1 = "B1398C5A686B98D0C5A046EBEFE80AEB415A26A1FF547204E7D550"
    "D446184B78";
const pvteKeyDonor2 = '5FC5A5D2788D7814B9263AF64211328978CAEBAEB1338599D46007'
    '0E9E9C9EF6';
const pvteKeyDonor3 = 'FD6F177F740EB8BCD4B8B071E4D138270F64A8474AB4DB2B49F19D'
    '369C90DEBA';
const pvteKeyBloodBank = 'E034F34DBE61F4B61F28B3956BD766D22F447960AAFB8D71139'
    'FFAD2E9CC5F2C';


const Rinkeby = 4;
//Infura Node Juliana @ Rinkeby
const apiUrl = "https://rinkeby.infura.io/v3/1fc5af390b99412f864b52fd4ca975ea";
//Infura Node Bruno @ Rinkeby
//const apiUrl =     "https://rinkeby.infura"
//".io/v3/6c35b5b0fa1b4010be4f0db6e60002cb";


//const String dPlasmaContractAddress = "0x7C831Ec9ef9AB4672A047b4fa47B0E4b41EA25d4";
const String dPlasmaContractAddress = "0xacf9bCDCeB055Cc8ea1d49a451b4797634Bd"
    "f9eB";

//const String dPlasmaContractAddress = "0x38b2E1ee825692a74335203B84902d87283eaF39";
//const String dPlasmaContractAddress = "0xE837840eF6Fd42119c8D5C6eED5EA160e8804EB4";
//const String contractAddress = "0xD1CC1D57695E394cC48c8Dba4891160E66bAcB85";

const String hematologistImage = 'assets/images/hematologist.png';
const String doctorNYUImage = 'assets/images/doctorNYU.jpg';
const String doctorMtSinaiImage = 'assets/images/doctorMtSinai.png';
const String donor1Image = 'assets/images/donor1.png';
const String donor2Image = 'assets/images/donor2.png';
const String donor3Image = 'assets/images/donor3.png';
const String bloodbankImage = 'assets/images/icon-hospital.png';
const String hospitalNYUImage = 'assets/images/nyuhospital.jpg';
const String hospitalMtSinaiImage = 'assets/images/mtsinaihospital.jpg';
const String patient1Image = 'assets/images/patient1.jpg';
const String patient2Image = 'assets/images/patient2.jpg';
const String patient3Image = 'assets/images/patient3.jpg';


//TODO: Remember to Register Hospital (NYU with NYU key and MtSinai with
// MtSinai pvte key)

//TODO: Remember to Switch keys for Hospitals, Doctors, Patients, Donors,
// pvteKey Changes


TextStyle hospitalFont = GoogleFonts.pressStart2p(
textStyle: TextStyle(
fontSize: 25.0,
color: Colors.lightGreenAccent,),
);
TextStyle smallhospitalFont = GoogleFonts.pressStart2p(
  textStyle: TextStyle(
    fontSize: 12.0,
    color: Colors.lightGreenAccent,),
);