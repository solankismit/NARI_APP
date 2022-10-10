import 'package:flutter/material.dart';
import 'package:nari_women_safety/features/featurespage.dart';
import 'package:nari_women_safety/home/homepage.dart';
import 'package:nari_women_safety/map/mappage.dart';
import 'package:nari_women_safety/profile/profilepage.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key? key}) : super(key: key);

  static var selectedidx = 0;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (int idx) => setState(() => BottomNavBar.selectedidx = idx),
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Color.fromARGB(255, 7, 6, 9),
        selectedItemColor: Color.fromARGB(255, 146, 182, 224),
        selectedFontSize: 0,
        currentIndex: BottomNavBar.selectedidx,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 40), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.star, size: 40), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on, size: 40), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined, size: 40), label: '')
        ]);
  }
}
