import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class BloodBanksScreen extends StatefulWidget {
  static const String id = 'blood_banks_screen';

  @override
  _BloodBanksScreenState createState() => _BloodBanksScreenState();
}

class _BloodBanksScreenState extends State<BloodBanksScreen> {
  LatLng _center = LatLng(40.762681, -73.832611);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
      options: new MapOptions(
        minZoom: 15.0,
        center: _center,
        interactive: true,
      ),
      layers: [
        new TileLayerOptions(
            urlTemplate:
           'https://api.mapbox.com/styles/v1/brunoeleodoro/ck9vyi9hq05b81iqyw4ni4bzc/wmts?access_token=pk.eyJ1IjoiYnJ1bm9lbGVvZG9ybyIsImEiOiJjamNtcmR0cHAxMDBtMzNvM2tyODU5cmtwIn0.1N9H1ZSYxmAukQ_inXV9hQ',
            additionalOptions: {
              'accessToken':
              'pk.eyJ1IjoiYnJ1bm9lbGVvZG9ybyIsImEiOiJjamNtcmR0cHAxMDBtMzNvM2tyODU5cmtwIn0.1N9H1ZSYxmAukQ_inXV9hQ',
              'id': 'mapbox.streets'
            }),
        new MarkerLayerOptions(),
      ])
    );
  }
}