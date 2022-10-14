import 'package:flutter/material.dart';
import 'package:nari_women_safety/theme.dart';
class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _name = TextEditingController();
    TextEditingController _age = TextEditingController();
    TextEditingController _aadharnum = TextEditingController();
    TextEditingController _guardianname = TextEditingController();
    TextEditingController _guardiannum = TextEditingController();
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(39),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
          Text(
            "Register",
            style: appTheme.textTheme.displayLarge,
          ),
            SizedBox(height: 30),
            Column(
              children: [
                TextFields(controller: _name,hint: "Your Name",title: "Name"),
                TextFields(controller: _age,hint: "Your Age",title: "Age"),
                TextFields(controller: _aadharnum,hint: "Enter Aadhar Number",title: "Aadhar Number"),
                TextFields(controller: _guardianname,hint: "Your Guardian Name",title: "Guardian Name"),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Enter your Guardian number\nand verify it with OTP",style: appTheme.textTheme.bodyLarge?.copyWith(height: 1.3),softWrap: true,textAlign: TextAlign.center,),

              ],
            )
            ]
        ),
      ),
    );
  }
}

Widget TextFields({title,hint,required TextEditingController controller}){
  return Container(
    padding: EdgeInsets.all(15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: appTheme.textTheme.bodyLarge),
        TextField(
          controller: controller,
          decoration: InputDecoration(hintText: hint),
          onChanged: (value){controller.text = value;},
        )
      ],
    ),
  );
}
