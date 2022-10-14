import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nari_women_safety/Guardian/Permission.dart';
import 'package:nari_women_safety/main.dart';

class GaurdianPage extends StatefulWidget {
  const GaurdianPage({Key? key}) : super(key: key);

  @override
  State<GaurdianPage> createState() => _GaurdianPageState();
}

class _GaurdianPageState extends State<GaurdianPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(50),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.all(20),
                height: 150,
                width: 150,
                child: Image.asset('assets/nari_logo.png'),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(
                "WELCOME",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 29),
              ),
            ),
            SizedBox(height: 40,),
            Expanded(
              flex: 5,
              child: Container(
                height: 100,
                // width: 100,
                child: Column(
                  children: [
                    RowCard(
                      'Nari',
                      () {
                        Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) => IniPage()));
                      },
                      Icon(Icons.woman,size: 40,)
                    ),
                    RowCard(
                      'Guardian',
                          () {
                        Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) => PermissionPage()));
                      },
                      Icon(Icons.shield,size: 38,)
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

Widget RowCard(text, onPressed,icon) {
  return Card(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
    elevation: 5,
    color: Color.fromARGB(255, 143, 182, 237),
    margin: const EdgeInsets.all(5),
    child: InkWell(
      onTap: onPressed,
      child: Container(
        // rgba(143,182,237,255)
        // height: 80,
        padding: const EdgeInsets.all(6),
        child: ListTile(
          trailing: SizedBox(
              child: icon),
          title: Row(children: [
            Text(
              text,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ]),
          // ),
          // Image.asset(img,height: 60,)
        ),
      ),
    ),
  );
}
