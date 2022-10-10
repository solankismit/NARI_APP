import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'Constraints.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);
  @override
  State<MapPage> createState() => MapPageState();
}
class MapPageState extends State<MapPage> {
  // final Completer<GoogleMapController> _controller = Completer();
  static const LatLng sourceLocation = LatLng(22.54024371035337, 72.93006904634952);
  static const LatLng destination = LatLng(22.519368545554354, 72.9178720919609);
  // static const LatLng unsafe1 = LatLng(22.538467336450324, 72.93288295304527);
  static const LatLng unsafe2 = LatLng(22.53094762854048, 72.92316669594966);

  List<LatLng> polylineCoordinates = [];
  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_key, // Your Google Map Key
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );
    if (result.points.isNotEmpty) {
      result.points.forEach(
            (PointLatLng point) => polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      setState(() {});
    }
  }
  @override
  List<LatLng> polylineCoordinates1 = [ ];
  void getPolyPoints1() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_key, // Your Google Map Key
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(unsafe2.latitude,unsafe2.longitude),
    );
    if (result.points.isNotEmpty) {
      result.points.forEach(
            (PointLatLng point) => polylineCoordinates1.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      setState(() {});
    }
  }
  @override
  void initState() {
    getPolyPoints();
    getPolyPoints1();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
          initialCameraPosition: CameraPosition(
              target: sourceLocation,
              zoom: 13.5),
        polylines: {
          Polyline(
            polylineId: const PolylineId("route1"),
            points: polylineCoordinates,
            color: const Color(0xFF41AA52),
            width: 6,
          ),
          Polyline(
            polylineId: const PolylineId("route2"),
            points: polylineCoordinates1,
            color: const Color(0xFFff0000),
            width: 6,
          ),
        },
        markers: {
        const Marker(
         markerId: MarkerId("source"),
           position: sourceLocation,
        // ),const Marker(
        //  markerId: MarkerId("unsafe1"),
        //    position: unsafe1,
        ),const Marker(
         markerId: MarkerId("unsafe2"),
           position: unsafe2,
        ),
        const Marker(
          markerId: MarkerId("destination"),
          position: destination,
        ),
        },
      ),
    );
  }
}
