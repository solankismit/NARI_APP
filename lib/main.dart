import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nari_women_safety/features/featurespage.dart';
import 'package:nari_women_safety/profile/profilepage.dart';
import 'package:nari_women_safety/services/authservices.dart';
import 'package:nari_women_safety/services/userdetails.dart';
import 'package:nari_women_safety/shared/loading.dart';
import 'package:nari_women_safety/sos/sos.dart';
import 'package:nari_women_safety/startpage.dart';
import 'package:nari_women_safety/theme.dart';
import 'Guardian/Gaurdian.dart';
import 'LoginPage/loginpage.dart';
import 'LoginPage/otpalert.dart';
import 'LoginPage/registrationpage/registerpage.dart';
import 'map/Ordertrackingpage.dart';
import 'home/homepage.dart';
import 'map/mappage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate();
  // await getUser();
  isuserexists = await isUserExists();
  // u1 = User(name: 'Ami',uid: 'ug389',guardians: {});
  runApp(MaterialApp(
    theme: appTheme,
    routes: {
      // '/' : (context) => IniPage(),

      '/': (context) => GaurdianPage(),
      // '/' : (context) => RegisterPage(),
      '/home': (context) => StartPage(),
      '/ini': (context) => IniPage(),
      '/login': (context) => LoginPage(),
      '/register': (context) => RegisterPage(),
      '/otp': (context) => OTP(),
      '/sos': (context) => Sos(),
      '/map': (context) => MapPage(),
      '/features': (context) => FeaturesPage(),
      '/profile': (context) => ProfilePage()
    },
  ));
}

class IniPage extends StatelessWidget {
  const IniPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //       title: Text("Nari")),
    //   body:Text("Hello Nari")
    // );

    return StreamBuilder(
        stream: AuthService().userStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            print("Waiting");
            return const LoadingScreen();
          } else if (snapshot.hasError) {
            return Container(child: Text('error'));
          } else if (snapshot.hasData) {
            print(snapshot.data);
            print("Has Data");

            if (isuserexists == 'true') {
              print("IN USER EXIST");
              return FutureBuilder(
                future: getUser(),
                // initialData: ,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    print("IN CONNECTION DONE");
                    if (snapshot.hasError) {
                      print(snapshot.error);
                      return Container(child: Text('error'));
                    } else if (snapshot.hasData) {
                      print("Has User Data");
                      return StartPage();
                    }
                  }
                  return LoadingScreen();
                  // return Container();
                },
              );
            } else {
              print("IN USER NOT EXIST");
              return RegisterPage();
            }
          }
          else {
            print("No Data Avail.");
            return LoginPage();
          }
        });
  }
}
