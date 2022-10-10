
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../shared/bottom_bar.dart';
class MapPage1 extends StatefulWidget {
  const MapPage1({Key? key}) : super(key: key);

  @override
  State<MapPage1> createState() => _MapPage1State();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class _MapPage1State extends State<MapPage1> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(28.60906,77.20890);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    print(controller.mapId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Google Maps'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 0,46,88),
        ),
         body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,

          ),

        ),
      ),
    );
  }
}

