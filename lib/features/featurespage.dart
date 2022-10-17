import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nari_women_safety/LoginPage/otpalert.dart';
import 'package:nari_women_safety/features/FakeCall/fakecall.dart';
import 'package:nari_women_safety/features/anonymous_forum.dart';
import 'package:nari_women_safety/features/efir.dart';
import 'package:nari_women_safety/services/userdetails.dart';
import 'package:nari_women_safety/sos/sos.dart';
import 'package:nari_women_safety/theme.dart';
import '../services/currentlocation.dart';
import 'feedback.dart';
import 'package:url_launcher/url_launcher.dart';

import '../shared/bottom_bar.dart';

class FeaturesPage extends StatelessWidget {
  FeaturesPage({Key? key}) : super(key: key);

  final Map<String,Widget> features = {
    'SOS': Sos(),
    'Fake Call' : FakeCall(),
    'Anonymous Forum':AnonymousForum(),
    'Feedback History' :FeedbackHistory(),
    'E-FIR':EFIR(),
  };


  List<String> featurelist = ['SOS','Fake Call','Anonymous Forum','Feedback History','E-FIR'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Safety Features",style:TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: appTheme.primaryColor,
        toolbarHeight: 65,
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.6,
          children: [
            CreateCard('SOS', (){print("Button Pressed");Navigator.push(context, MaterialPageRoute(builder: (context) => Sos()));}),
            CreateCard('Fake Call', (){Navigator.push(context, MaterialPageRoute(builder: (context) => FakeCall()));}),
            CreateCard('Anonymous Forum', (){ Navigator.push(context, MaterialPageRoute(builder: (context) => AnonymousForum()));}),
            CreateCard('Feedback History', (){Navigator.push(context, MaterialPageRoute(builder: (context) => FeedbackHistory()));}),
            CreateCard('E-FIR', (){
              Uri url =  Uri.parse("https://www.deshgujarat.com/2022/07/22/gujarat-govt-announces-online-e-fir-service-for-vehicle-and-mobile-phone-theft/");

              Future<void> _launch(Uri url) async{
                await canLaunchUrl(url);
                await launchUrl(url);

              }
              _launch(url);
            })
          ],
        ),
      ),
    );
  }
}

Widget CreateCard(text,onPressed){
  return Card(
    shape:
     RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
    elevation: 5,
    color: Color.fromARGB(255, 143, 182, 237),
    margin: const EdgeInsets.all(5),
    child: InkWell(
      onTap: onPressed,
      child: Container(
        // rgba(143,182,237,255)
        // height: 80,
        padding: const EdgeInsets.all(8),
        child: ListTile(
          title: Center(
            child: Text(
                    text,
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
          ),
              // ),
              // Image.asset(img,height: 60,)
        ),
      ),
    ),
  );
}