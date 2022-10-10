import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(ProfilePage());
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor:Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/bgimage.jpg'),
              ),
              Text(
                'Ami Patel',
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Pacifico',
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0,46,88),
                ),
              ),
              Text(
                'Credit Points'.toUpperCase(),
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'SourceSansPro',
                  color: Colors.teal.shade200,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                ),
              ),
              //   Divider(
              //     thickness: 2,
              //     height: 150 ,
              //
              //     color:Color.fromARGB(255, 0,46,88),
              // ),
              SizedBox(
                height: 50.0,
                width: 350,
                child: Divider(
                  color: Color.fromARGB(255, 0,46,88),
                ),
              ),
              InkWell(
                  child: Card(
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Color.fromARGB(255, 0,46,88),
                      ),
                      title: Text(
                        'Phone Number',
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 20,
                            color: Colors.grey),
                      ),
                    ),

                  ),
                  // onTap: (){
                  //   _launchURL('tel:+229 96119149');
                  // }
              ),
              InkWell(
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Color.fromARGB(255, 0,46,88),
                    ),
                    title:Text(
                      'Enter Your Email',
                      style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 20,
                          color: Colors.grey),
                    ),
                  ),
                ),
                // onTap: (){
                //   _launchURL('mailto:fadcrepin@gmail.com?subject=Need Flutter developer&body=Please contact me');
                // },
              ),
          InkWell(
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.shield,
                  color: Color.fromARGB(255, 0,46,88),
                ),
                title: Text(
                  'Guardian',
                  style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 20,
                      color: Colors.grey),
                ),
              ),

            ),
            // onTap: (){
            //   _launchURL('tel:+229 96119149');
            // }

          ),
              InkWell(
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.location_pin,
                      color: Color.fromARGB(255, 0,46,88),
                    ),
                    title:Text(
                      'Postel address',
                      style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 20,
                          color: Colors.grey),
                    ),
                  ),
                ),
                // onTap: (){
                //   _launchURL('mailto:fadcrepin@gmail.com?subject=Need Flutter developer&body=Please contact me');
                // },
              ),
              InkWell(
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.history,
                      color: Color.fromARGB(255, 0,46,88),
                    ),
                    title:Text(
                      'History',
                      style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 20,
                          color: Colors.grey),
                    ),
                  ),
                ),
                // onTap: (){
                //   _launchURL('mailto:fadcrepin@gmail.com?subject=Need Flutter developer&body=Please contact me');
                // },
              ),
            ],


          ),
        ),
      ),
    );
  }
}


_launchURL(var url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

launch(url) {
}

canLaunch(url) {
}