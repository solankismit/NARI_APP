import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme.dart';
import 'otpalert.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
  static var phone_no = '+91-123456789';
  static var verify = '';
  static var phone = '';
}

class _LoginPageState extends State<LoginPage> {
  var alert = '';
  // const LoginPage({Key? key}) : super(key: key);
  final TextEditingController _countrycode = TextEditingController();
  @override
  void initState() {
    super.initState();
    _countrycode.text = '+91';
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   centerTitle: true,
      //   elevation: 0,
      //   foregroundColor: Colors.black,
      //   title: Text('Login'),
      // ),
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 50),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Center(
                  child: Text(
                "Login",
                style: appTheme.textTheme.displayLarge
                  )
              ),
            ),
            SizedBox(
              height: 50,
            ),
            //Text that contains "Enter Your number and verify with OTP"
            Container(
              margin: EdgeInsets.fromLTRB(80, 20, 80, 10),
              child: Column(
                children: const [
                  Center(
                      child: Text(
                    "Enter your number and verify with OTP",
                    style: TextStyle(
                      wordSpacing: 2,
                      height: 1.2,
                      fontSize: 18,
                    ),
                    // style: Theme.of(context).textTheme.bodyLarge,
                        softWrap: true,
                        textScaleFactor: 1,
                        textAlign: TextAlign.center,
                      )),
                  Divider(color: Colors.black,thickness: 2,height: 25,indent: 5,endIndent: 6)
                ],
              ),

            ),
            Container(
              height: 55,
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Color.fromRGBO(0, 47, 89, 1)),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 40,
                    child: TextField(style: TextStyle(fontSize: 20),
                      controller: _countrycode,
                      enabled: false,
                      // keyboardType: TextInputType.,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Text(
                    "|",
                    style: TextStyle(fontSize: 28, color: Color.fromRGBO(0, 47, 89, 1)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: TextField(
                        style: TextStyle(fontSize: 20),
                    keyboardType: TextInputType.phone,
                    onChanged: (val){LoginPage.phone=val;
                    setState(() {
                      alert = "";
                    });
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Phone",
                    ),
                  ))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Text(
                alert,
                style: TextStyle(
                  color: Colors.red
                ),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            SizedBox(
              height: 45,
              width: screenWidth*0.9,
              child: ElevatedButton(
                onPressed: () async{
                  LoginPage.phone_no = '${_countrycode.text}-${LoginPage.phone}';
                  print(_countrycode.text + LoginPage.phone);
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: _countrycode.text + LoginPage.phone,
                    verificationCompleted: (PhoneAuthCredential credential) {
                      print('verificationCompleted');
                    },
                    verificationFailed: (FirebaseAuthException e) {
                      alert = "Enter Valid Number";
                      print(e);
                      print('\n\n\n\n\nverificationFailed\n\n\n\n');
                    },
                    codeSent: (String verificationId, int? resendToken) {
                      LoginPage.verify = verificationId;
                      Navigator.pushNamed(context, '/otp');
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );
                  // Navigator.pushNamed(context, 'otp');
                },
                child: Text("Next",style: TextStyle(
                  fontSize: 20
                ),),
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  primary: Color.fromRGBO(0, 47, 89, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
