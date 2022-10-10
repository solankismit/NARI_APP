import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nari_women_safety/services/userdetails.dart';
import 'package:telephony/telephony.dart';

import '../Guardian/Permission.dart';
  final Telephony telephony = Telephony.instance;

void SendSMS() async{
  print("IN SMS");
bool? permissionsGranted = await telephony.requestPhoneAndSmsPermissions;
for(var guardian in Sos.guardians){
telephony.sendSms(to: "+91$guardian", message: "Emergency Help Me Please!!!!\nMy Current Location : https://maps.google.com/?q=<lat>,<lng> ");
};}
class Sos extends StatefulWidget {
  Sos({Key? key}) : super(key: key);

  static var guardians = ['9998441580'];

  @override
  State<Sos> createState() => _SosState();
}

class _SosState extends State<Sos> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("SOS"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: IconButton(
                iconSize: 200,
                icon: Image.asset('assets/sost.png'), onPressed: ()=>SendSMS()
              ),
            ),
            //  Button to add guardians
            SizedBox(
              child: TextButton.icon(
                icon: Icon(FontAwesomeIcons.plus),
                label: Text('Add Guardian'),
                onPressed: () async {
                  var data = await showDialog(
                      context: context,
                      builder: (context) {
                        return AddGuardian();
                      });
                  setState(() {
                    Sos.guardians.add(data);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddGuardian extends StatefulWidget {
  AddGuardian({Key? key}) : super(key: key);

  @override
  State<AddGuardian> createState() => _AddGuardianState();
}

class _AddGuardianState extends State<AddGuardian> {
  var phoneno;
  TextEditingController _guardian = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Guardian'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
            children: [
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: Sos.guardians.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(Sos.guardians[index]),
                  );
                },
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    phoneno = value;
                  });
                },
                keyboardType: TextInputType.number,
                controller: _guardian,
                decoration: InputDecoration(hintText: "Enter Number"),
              ),
            ],
          ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          // color: Colors.red,
          // textColor: Colors.white,
          child: const Text(
            'CANCEL',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.green,
          ),
          child: const Text(
            'OK',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {
            setState(() {
              // codeDialog = valueText;
              Navigator.pop(context, phoneno);
            });
          },
        ),
      ],
    );
  }
}
