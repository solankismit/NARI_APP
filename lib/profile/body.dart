import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  get pngPicture => null;

  @override
  Widget build(BuildContext context) => Column(children: [
        Stack(
          fit: StackFit.expand,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
            ),
            Positioned(
              right: -10,
              bottom: 0,
              child: SizedBox(
                  height: 46,
                  width: 46,
                  child: TextButton(
                    style: ButtonStyle(),
                    onPressed: () {},
                    child: Image.asset("assets/Cameraicon.png",width: 20),
                  )),
            ),
          ],
        )
      ]);
}

class FlatButton {}
