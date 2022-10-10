import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late String _name;
  late String _age;
  late String _aadharnumber;
  late String guardianname;
  late String guardiannumber;

  final GlobalKey<_RegisterPageState> _RegisterKey =
      GlobalKey<_RegisterPageState>();

  get value => null;
  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'please enter some text';
        }
        return 'null';
      },
      // },
    );
  }

  Widget _buildAge() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Age'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'please enter some text';
        }
        return 'null';
      },
    );
  }

  Widget _buildAadharnumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Aadhar number'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'please enter some text';
        }
        return 'null';
      },
    );
  }

  Widget _buildGuardianname() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Guardian name'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'please enter some text';
        }
        return 'null';
      },
    );
  }

  Widget _buildGuardiannumber() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Enter your Guardian number to get OTP'),
      validator: (value){
        // guardiannumber=value;
        // print(value);
        validateGuardiannumber(value!);
        // if (value == null || value.isEmpty) {
        //   return 'please enter some text';
        // }
        // return 'null';
      },
      // },
    );
  }
  String? validateGuardiannumber(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length != 10)
      return 'Mobile Number must be of 10 digit';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Register"),
            centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(30),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildName(),
                _buildAge(),
                _buildAadharnumber(),
                _buildGuardianname(),
                _buildGuardiannumber(),
                // SizedBox(height: 100,),

                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          if (_RegisterKey.currentState!.validate()) ;
                        },
                        child: const Text('Next'),
                        ),

                ),
                SizedBox(height: 5.0),

            ]),
          ),
        ));
  }

  bool validate() {
    return true;
  }
}

// class RaisedButton {
// }
