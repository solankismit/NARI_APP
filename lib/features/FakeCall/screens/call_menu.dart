import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import '../../../services/defaultuser.dart';
import '../screens/caller_id.dart';
import '../screens/scheduler.dart';
import '../screens/user_manual.dart';
import '../utilities/card_child.dart';
import '../utilities/icon_content.dart';
import '../constants.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'incoming_call.dart';

class CallMenu extends StatefulWidget {

  const CallMenu({Key? key}) : super(key: key);
  @override
  State<CallMenu> createState() => _CallMenuState();
}

class _CallMenuState extends State<CallMenu> {
  // InterstitialAd? _timerFull;
  // bool isFullTimerLoaded = false;

  // InterstitialAd? _IDFull;
  // bool isFullIDLoaded = false;

  @override
  void initState() {
    super.initState();
  }

  void playRingtone() {
    FlutterRingtonePlayer.playRingtone(asAlarm: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: 30.0, top: 60.0, right: 30.0, bottom: 30.0),
              child: Column(children: [
                Text(
                  "Get Me Out",
                  style: kHeadingTextStyle?.copyWith(
                    color: primary,
                    fontSize: 40,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10.0,
                ),
              ]),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: CardChild(
                              cardChild: IconContent(
                                icon: const IconData(0xeb9f,
                                    fontFamily: 'MaterialIcons'),
                                text: "Call Now",
                              ),
                              onPress: () {
                                playRingtone();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => IncomingCall(
                                      name: u1.guardians[0].name,
                                      number: u1.guardians[0].phone_no,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Expanded(
                            child: CardChild(
                                cardChild: IconContent(
                                  icon: const IconData(0xe18c,
                                      fontFamily: 'MaterialIcons'),
                                  text: 'Caller ID',
                                ),
                                onPress: () {
                                  // if (isFullIDLoaded) {
                                  //   _IDFull?.show();
                                  // } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CallerID()),
                                  );
                                }
                              // },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(children: [
                        Expanded(
                          child: CardChild(
                              cardChild: IconContent(
                                icon: const IconData(0xe316,
                                    fontFamily: 'MaterialIcons'),
                                text: "Schedule",
                              ),
                              onPress: () {
                                // if (isFullTimerLoaded) {
                                //   _timerFull?.show();
                                // } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Scheduler()),
                                );
                              }
                            // },
                          ),
                        ),
                        Expanded(
                          child: CardChild(
                            cardChild: IconContent(
                              icon: const IconData(0xe4fa,
                                  fontFamily: 'MaterialIcons'),
                              text: "FAQ",
                            ),
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserManual()),
                              );
                            },
                          ),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
