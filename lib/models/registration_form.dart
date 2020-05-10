import "package:flutter/material.dart";
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
    
    
    class RegistrationField extends StatelessWidget {

      RegistrationField({this.controllerName, @required this.onChanged, this.registrationLabel});

      final TextEditingController controllerName;
      final Function onChanged;
      final String registrationLabel;

      @override
      Widget build(BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18),
          child: TextFormField(
//            onChanged: (value) {
//              checkIfAllIsValid();
//            },
//            controller: nameController,
          onChanged: onChanged,
            controller: controllerName,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: registrationLabel),
          ),
        );
      }
    }

    class RegistrationTitle extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Text(
              'Please register for the first time',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
        );
      }
    }

    class HandwrittenSignature extends StatelessWidget {
      HandwrittenSignature({this.signaturePersona, this.handwrittingStyle});
      final String signaturePersona;
      final TextStyle handwrittingStyle;


      @override
      Widget build(BuildContext context) {
        return TyperAnimatedTextKit(
            text: [
              signaturePersona,
            ],
            textStyle: handwrittingStyle,
            speed: Duration(milliseconds: 500),
            textAlign: TextAlign.start,
            alignment:
            AlignmentDirectional.topStart // or Alignment.topLeft
        );
      }
    }

TextStyle hematologistHandwritting = GoogleFonts.homemadeApple(
  textStyle: TextStyle(
    fontSize: 30.0,
    color: Colors.red,
  ),
);

TextStyle doctorHandwritting = GoogleFonts.shadowsIntoLightTwo(
  textStyle: TextStyle(
    fontSize: 30.0,
    color: Colors.indigoAccent,
  ),
);

TextStyle hospitalHandwritting = GoogleFonts.cedarvilleCursive(
  textStyle: TextStyle(
    fontSize: 30.0,
    color: Colors.black,
  ),
);

TextStyle bloodbankHandwritting = GoogleFonts.gloriaHallelujah(
  textStyle: TextStyle(
    fontSize: 30.0,
    color: Colors.red,
  ),
);

TextStyle donorHandwritting = GoogleFonts.rockSalt(
  textStyle: TextStyle(
    fontSize: 30.0,
    color: Colors.indigo,
  ),
);

TextStyle patientHandwritting = GoogleFonts.cookie(
  textStyle: TextStyle(
    fontSize: 30.0,
    color: Colors.black,
  ),
);

class PersonaAvatar extends StatelessWidget {
  PersonaAvatar({this.personaImage});

  final String personaImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.maxFinite,
          height: 400,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                  image: AssetImage(personaImage),
                  fit: BoxFit.cover)),
        ),
        Align(alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 16),
          child: IconButton(
            icon: Icon(Icons.arrow_back, size: 40, color: Colors.deepPurple,),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ),),
      ],
    );
  }
}

class BoolQuestion extends StatelessWidget {
  BoolQuestion({this.question, this.isParameterTrue, this.onChanged});

  final String question;
  final bool isParameterTrue;
  final Function onChanged;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
//      title: Text('Are you an accredited hematologist?'),
//      value: isHematologist,
//      onChanged: (value){
//        setState(() {
//          isHematologist = value;
//          print(value);
//        });

    title: Text(question),
    value: isParameterTrue,
    onChanged: onChanged
    );
  }
}

int convertDatetoTimeStamp(String date){
  List<String> dateBlocks = date.split("/");
//  MM/DD/YYYY
  String acceptedDateFormat = dateBlocks[2] + "" + dateBlocks[0] + "" +
      dateBlocks[1];
  DateTime formatedDate = DateTime.parse(acceptedDateFormat);

  return formatedDate.millisecondsSinceEpoch;
}


class PersonaActionAvatar extends StatelessWidget {
  PersonaActionAvatar({this.personaImage, this.onPressed});

  final String personaImage;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.maxFinite,
          height: 345,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                  image: AssetImage(personaImage),
                  fit: BoxFit.cover)),
        ),
        Align(alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 16),
            child: IconButton(
              icon: Icon(Icons.arrow_back, size: 40, color: Colors
                  .amber,),
              onPressed: onPressed
            ),
          ),),
      ],
    );
  }
}