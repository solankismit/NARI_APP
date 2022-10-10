import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import '../../../services/defaultuser.dart';
import '../constants.dart';
import 'incoming_call.dart';

class CallerID extends StatefulWidget {
  static const routeName = '/CallerID';

  @override
  State<CallerID> createState() => _CallerIDState();
}

class _CallerIDState extends State<CallerID> {

  String name = u1.guardians[0].name;
  String number = u1.guardians[0].phone_no;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Container(
          margin: const EdgeInsets.fromLTRB(10.0, 150.0, 10.0, 120.0),
          padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 20.0),
          decoration: BoxDecoration(
            color: secondary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    border:
                    Border.all(color: const Color(0xFFFFFFF), width: 2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: Text(
                    "Caller ID",
                    style: kHeadingTextStyle?.copyWith(
                      fontSize: 35,
                    ),
                  ),
                ),
              ],
            ),
            const Expanded(
              child: SizedBox(
                height: 1.0,
              ),
            ),
            Text(
              "Name",
              style: kHeadingTextStyle?.copyWith(
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              style: const TextStyle(
                color: Color(0xFFFECE00),
                fontSize: 22.0,
              ),
              textAlign: TextAlign.center,
              onChanged: (value) {
                name = value;
              },
              decoration: const InputDecoration(
                //contentPadding:EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              "Number",
              style: kHeadingTextStyle?.copyWith(
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              style: const TextStyle(
                color: Color(0xFFFECE00),
                fontSize: 22.0,
              ),
              textAlign: TextAlign.center,
              onChanged: (value) {
                number = value;
              },
              decoration: const InputDecoration(
                //contentPadding:EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
              ),
            ),
            const Expanded(
              child: SizedBox(
                height: 1.0,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                FlutterRingtonePlayer.playRingtone(asAlarm: true);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => IncomingCall(
                      name: name,
                      number: number,
                    ),
                  ),
                );
              },
              child: Text('Call Now',
                  style: kHeadingTextStyle?.copyWith(
                    fontSize: 22.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  )),
              style: ElevatedButton.styleFrom(
                primary: primary,
                padding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
