import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nari_women_safety/profile/profilepage.dart';
import 'package:nari_women_safety/shared/bottom_bar.dart';
import 'package:nari_women_safety/sos/sos.dart';
import 'package:shake/shake.dart';

import 'Ordertrackingpage.dart';
import 'features/featurespage.dart';
import 'home/homepage.dart';
import 'map/mappage.dart';

class StartPage extends StatefulWidget {
  StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  var selectedidx = 0;
  List<Widget> _currentpage = [
    HomePage(),
    FeaturesPage(),
    MapPage(),
    ProfilePage()
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ShakeDetector.autoStart(
    //   onPhoneShake: () async{
    //     ScaffoldMessenger.of(context)
    //         .showSnackBar(SnackBar(content: Text('Shake!')));
    //     print("Shake");
    //     SendSMS();
    //     // Do stuff on phone shake
    //   },
    //   // minimumShakeCount: 1,
    //   shakeSlopTimeMS: 500,
    //   // shakeCountResetTime: 300,
    //   shakeThresholdGravity: 1.85,
    // );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentpage[selectedidx],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (int idx) => setState(() => selectedidx = idx),
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Color.fromARGB(255, 7, 6, 9),
          selectedItemColor: Color.fromARGB(255, 146, 182, 224),
          selectedFontSize: 0,
          currentIndex: selectedidx,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home, size: 40), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.star, size: 40), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.location_on, size: 40), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined, size: 40), label: '')
          ]),
    );
  }
}
