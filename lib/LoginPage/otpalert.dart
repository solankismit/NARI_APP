import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import 'loginpage.dart';

class OTP extends StatefulWidget {
  OTP({Key? key}) : super(key: key);

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  var otp_msg ='We have sent you an one time password on this Mobile Number';

  bool wrong_otp = false;

  final FirebaseAuth auth = FirebaseAuth.instance;

  var smsCode = '';

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 50,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: wrong_otp ? Colors.red: Color.fromRGBO(0, 47, 89, 0.3)),
        shape: BoxShape.circle,
        color: Color.fromRGBO(246, 246, 246, 1),
        // borderRadius: BorderRadius.all(Radius.circular(10))
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    // final submittedPinTheme = defaultPinTheme.copyWith(
    //   decoration: defaultPinTheme.decoration?.copyWith(
    //
    //   ),
    // );
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Verification Page'),
      // ),
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
        alignment: Alignment.center,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            margin: EdgeInsets.all(20),
            child: const Center(
                child: Text(
              "OTP Verification",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            )),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
            child: Column(
              children: [
                Text(
                  otp_msg,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(height: 1.2, fontSize: 17,color: wrong_otp?Colors.red:Colors.black),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  LoginPage.phone_no,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/login', (route) => false);
                        },
                        child: Text(
                          "Edit Number",
                          style: TextStyle(color: Color.fromRGBO(0, 47, 89, 0.7)),
                        ))
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              child: Pinput(
            length: 6,
            defaultPinTheme: defaultPinTheme,
            // focusedPinTheme: focusedPinTheme,
            // submittedPinTheme: submittedPinTheme,
            onChanged: (value) {
              print(value);
              smsCode = value;
            },
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            showCursor: true,
            onCompleted: (pin) => print(pin),
          )),
          SizedBox(height: 30),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Didn't get OTP? ",style: TextStyle(color: Color.fromRGBO(0, 47, 89, 0.3),),
                ),
                InkWell(
                  onTap: ()async {
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: '+91${LoginPage.phone}',
                      verificationCompleted: (PhoneAuthCredential credential) {
                        print('verificationCompleted');
                      },
                      verificationFailed: (FirebaseAuthException e) {
                        print(e);
                        print('verificationFailed');
                      },
                      codeSent: (String verificationId, int? resendToken) {
                        LoginPage.verify = verificationId;
                        Navigator.pushNamed(context, '/otp');
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                  },
                    child: Text("Resend OTP",style: TextStyle(color: Color.fromRGBO(0, 47, 89, 0.7),),))
              ],
            ),
          ),
          SizedBox(height: 60),
          SizedBox(
            height: 45,
            width: screenWidth * 0.9,
            child: ElevatedButton(
              onPressed: () async {
                // Create a PhoneAuthCredential with the code
                try {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: LoginPage.verify, smsCode: smsCode);

                  // Sign the user in (or link) with the credential
                  await auth.signInWithCredential(credential);
                  Navigator.popAndPushNamed(context, '/home');
                } on Exception catch (e) {
                  setState((){
                    otp_msg = "Wrong OTP! Try Again.. or\nCheck your Number";
                    wrong_otp = true;
                  });
                  print("OTP ERROR :" + e.toString());
                }
              },
              style: ElevatedButton.styleFrom(
                  elevation: 10,
                  primary: Color.fromRGBO(0, 47, 89, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: const Text(
                "Verify",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
