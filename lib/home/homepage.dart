import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:nari_women_safety/features/featurespage.dart';
import 'package:nari_women_safety/home/card.dart';
import 'package:nari_women_safety/home/circularbtn.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import '../services/database.dart';
import '../services/userdetails.dart';
import '../shared/bottom_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../sos/sos.dart';
bool status1 = false;
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Color toggleColor = Colors.white;
  // Adding User in Code only
  User u1 = User(
    aadhar_number: "1234 4567 4561 4567",
    age: "19",
    name: "AD",
    guardian: Guardian(name: "Varni",phone_no: "1234567890")
  );
  //TODO:USER SHOULD BE FETCHED FROM FIRESTORE
  //---------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Container(margin: EdgeInsets.fromLTRB(0, 20, 0, 0),child: Text("Hey ${u1.name}...",style: TextStyle(color: Colors.black,fontSize: 28,fontWeight: FontWeight.bold),textAlign: TextAlign.start,)),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircularBtn(imgsrc: 'assets/fire.png', imgtext: 'Fire',func: () async{
                      await FlutterPhoneDirectCaller.callNumber('tel:+919998441580');
                    }

                    ),
                    CircularBtn(imgsrc: 'assets/sos.png', imgtext: 'SOS',func: ()=>WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => Sos()));
                    })),
                    CircularBtn(imgsrc: 'assets/police.png', imgtext: 'Police',func: () async {
                      await FlutterPhoneDirectCaller.callNumber(
                          'tel:+919104276641');
                    }
                    )
                  ],
                ),
              ),
            ),
            Divider(thickness: 3,color: Color.fromARGB(255, 0,46,88),height: 10,),
            Expanded(
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Container(
                  padding: EdgeInsets.only(bottom: 100),
                  margin: EdgeInsets.fromLTRB(12, 5, 12, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      CardList(img: 'assets/self_defence.png',text: 'Self Defence Techniques',function: (){

                        Uri url =  Uri.parse( "https://blackbeltmag.com/top-10-self-defense-techniques-for-women");

                          Future<void> _launch(Uri url) async{
                            await canLaunchUrl(url);
                            await launchUrl(url);

                        }
                        _launch(url);

                        }),
                      CardList(img: 'assets/law.png',text: 'Laws related to women',function: (){
                        Uri url =  Uri.parse( "https://www.indiatoday.in/education-today/gk-current-affairs/story/11-women-rights-india-312263-2016-03-08");

                        Future<void> _launch(Uri url) async{
                          await canLaunchUrl(url);
                          await launchUrl(url);

                        }
                        _launch(url);
                      }),
                      CardList(img: 'assets/idea.png',text: 'Tips for Woman Safety',function: (){
                        Uri url =  Uri.parse( "https://timesofindia.indiatimes.com/blogs/the-next-step/safety-tips-for-women/");

                        Future<void> _launch(Uri url) async{
                          await canLaunchUrl(url);
                          await launchUrl(url);

                        }
                        _launch(url);
                      })
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10,right: 10,bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Sensor Activation",style:TextStyle(color: Colors.black,fontSize: 28,fontWeight: FontWeight.bold),),
                  FlutterSwitch(
                    onToggle: (value){setState(() {
                      status1 = value;
                      toggleColor = value ?Color.fromARGB(255, 143,182,237 ): Colors.white;
                    });},
                    value: status1,
                    activeColor: Color.fromARGB(255, 0,46,88),
                    activeText:"ON",
                    inactiveText: "OFF",
                    inactiveTextColor: Color.fromARGB(255, 0,46,88),
                    showOnOff: true,
                    inactiveColor: Color.fromARGB(255, 143,182,237 ),
                    toggleColor: toggleColor,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
