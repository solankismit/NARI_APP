import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:nari_women_safety/main.dart';

import 'package:telephony/telephony.dart';
import 'package:flutter_dnd/flutter_dnd.dart';
import 'package:flutter_beep/flutter_beep.dart';
import 'package:vibration/vibration.dart';
import 'package:volume_watcher/volume_watcher.dart';


final Telephony telephony = Telephony.instance;

backgrounMessageHandler(SmsMessage message) async {
  telephony.listenIncomingSms(
      onNewMessage: (SmsMessage message) async {
        bool isEmergency = message.body?.contains("Emergency") ?? false;
        if (isEmergency) {
          if (await FlutterDnd.isNotificationPolicyAccessGranted ?? false) {
            await FlutterDnd.setInterruptionFilter(
                FlutterDnd.INTERRUPTION_FILTER_ALL);
          } else {
            FlutterDnd.gotoPolicySettings();
          }
          FlutterBeep.playSysSound(100);
          Vibration.vibrate(pattern: [
            500,
            1000,
            500,
            2000,
            500,
            1000,
            500,
            2000,
            500,
            1000
          ]);
          //Do something
        }
      },
      // Handle message
      onBackgroundMessage: backgrounMessageHandler
  );
}

void func() {
  _getSMSPermission();
  telephony.listenIncomingSms(
      onNewMessage: (SmsMessage message) async {
        bool isEmergency = message.body?.contains("Emergency") ?? false;
        if (isEmergency) {
          if (await FlutterDnd.isNotificationPolicyAccessGranted ?? false) {
            await FlutterDnd.setInterruptionFilter(
                FlutterDnd.INTERRUPTION_FILTER_ALL);
          } else {
            FlutterDnd.gotoPolicySettings();
          }
          VolumeWatcher.setVolume(100);
          FlutterBeep.playSysSound(1000);
          FlutterRingtonePlayer.play();
          FlutterRingtonePlayer.playNotification(volume: 100,asAlarm: true);
          Vibration.vibrate(pattern: [
            500,
            1000,
            500,
            2000,
            500,
            1000,
            500,
            2000,
            500,
            1000
          ]);
          //Do something
        }
      },
      // Handle message
      onBackgroundMessage: backgrounMessageHandler
  );
}

  void _getSMSPermission() async {
    bool? permissionsGranted = await telephony.requestPhoneAndSmsPermissions;
  }
class PermissionPage extends StatefulWidget {
  const PermissionPage({Key? key}) : super(key: key);

  @override
  State<PermissionPage> createState() => _PermissionPageState();
}



class _PermissionPageState extends State<PermissionPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    func();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Give Permission'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body:Center(
        child: Container(
          height: 100, width: 200,
            child: CreateCard(
                'Agree',
                    (){
                 func();
                    }))
      )
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
