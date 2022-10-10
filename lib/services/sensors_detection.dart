import 'package:flutter/material.dart';
import 'package:nari_women_safety/sos/sos.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shake/shake.dart';

class Sensors_Detect extends StatefulWidget {
  @override
  _Sensors_DetectState createState() => _Sensors_DetectState();
}

class _Sensors_DetectState extends State<Sensors_Detect> {
@override
  void initState() {
    super.initState();

    ShakeDetector.autoStart(
      onPhoneShake: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Shake!')));
        print("Shake");
        SendSMS();
        // Do stuff on phone shake
      },
      // minimumShakeCount: 1,
      shakeSlopTimeMS: 500,
      // shakeCountResetTime: 300,
      shakeThresholdGravity: 1.85,
    );
//     accelerometerEvents.listen((AccelerometerEvent event) {
//       print(event);
//     });
// // [AccelerometerEvent (x: 0.0, y: 9.8, z: 0.0)]
//
//   userAccelerometerEvents.listen((UserAccelerometerEvent event) {
//     print(event);
//   });
// // [UserAccelerometerEvent (x: 0.0, y: 0.0, z: 0.0)]
//
//   gyroscopeEvents.listen((GyroscopeEvent event) {
//     print(event);
//   });
// // [GyroscopeEvent (x: 0.0, y: 0.0, z: 0.0)]
//
//   magnetometerEvents.listen((MagnetometerEvent event) {
//     print(event);
//   });
// [MagnetometerEvent (x: -23.6, y: 6.2, z: -34.9)]

}

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}