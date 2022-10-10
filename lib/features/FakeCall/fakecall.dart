import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/call_menu.dart';
import 'screens/caller_id.dart';
import 'screens/caller_screen.dart';
import 'screens/scheduler.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
class FakeCall extends StatelessWidget {
  const FakeCall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
      home: CallMenu(),
      routes: {
        '/CallerScreen': (context) => CallerScreen(),
        '/CallerID': (context) => CallerID(),
        '/Scheduler': (context) => Scheduler(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
