import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nari_women_safety/services/userdetails.dart';
import 'package:nari_women_safety/theme.dart';

    var textedits = '';
class RegisterPage extends StatefulWidget {
   RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
    TextEditingController _name = TextEditingController();

    TextEditingController _age = TextEditingController();

    TextEditingController _aadharnum = TextEditingController();

    TextEditingController _guardianname = TextEditingController();

    TextEditingController _guardiannum = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          // primary: false,

          // physics: BouncingScrollPhysics(),
          child: Container(
            // alignment: Alignment.center,
            margin: EdgeInsets.only(top: 20, right: 20, left: 20),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Register",
                style: appTheme.textTheme.displayLarge,
              ),
              SizedBox(height: 30),
              Column(
                children: [
                  TextFields(controller: _name, hint: "Your Name", title: "Name"),
                  //Get Date Picker
                  DatePicker(_age, context),
                  // TextFields(controller: _age, hint: "Your Age", title: "Age"),

                  // TextFields(
                  //     controller: _aadharnum,
                  //     hint: "Enter Aadhar Number",
                  //     title: "Aadhar Number"),
                  TextFields(
                      controller: _guardianname,
                      hint: "Your Guardian Name",
                      title: "Guardian Name"),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    // "Enter your Guardian number\nand verify it with OTP",
                    "Enter your Guardian number\nand verify it with OTP",
                    style: appTheme.textTheme.bodyLarge?.copyWith(height: 1.3),
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                  phonetextfield(_guardiannum)
                ],
              ),
              SizedBox(height: 30),
              SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  onPressed: ()async{
                    await RegisterUser(
                      guardian_name: _guardianname.text,
                      guardian_number: _guardiannum.text,
                      name: _name.text,
                      dob: _age.text,
                    );
                    isuserexists =await isUserExists();
                    //Go to INI screen
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/ini', (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 10,
                      primary: Color.fromRGBO(0, 47, 89, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    "Submit",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

Widget DatePicker(dateInput,context){
  return Container(
    margin: EdgeInsets.all( 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Enter date of Birth', style: appTheme.textTheme.bodyLarge),
        TextField(
          controller: dateInput,
          //editing controller of this TextField
          decoration: InputDecoration(
              // icon: Icon(Icons.calendar_today), //icon of text field
              // labelText: "Enter Date" //label text of field
          ),
          readOnly: true,
          //set it true, so that user will not able to edit text
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1950),
                //DateTime.now() - not to allow to choose before today.
                lastDate: DateTime(2100));

            if (pickedDate != null) {
              print(
                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
              String formattedDate =
              DateFormat('yyyy-MM-dd').format(pickedDate);
              print(
                  formattedDate); //formatted date output using intl package =>  2021-03-16
              setState(() {
                dateInput.text =
                    formattedDate; //set output date to TextField value.
              });
            } else {}
          },
        ),
      ],
    ),
  );
}
}


Widget TextFields({title, hint, required TextEditingController controller}) {
  return Container(
    padding: EdgeInsets.all(15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: appTheme.textTheme.bodyLarge),
        TextField(
          controller: controller,
          decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: secondary)),
              hintText: hint),
          onChanged: (value) {
            textedits = value;
            // controller.text = value;
          },
          onSubmitted: (value){
            print('on submitted');
            controller.text = value;},
        )
      ],
    ),
  );
}

Widget phonetextfield(controller) {
  return Container(
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
          child: TextField(
            style: TextStyle(fontSize: 20),
            controller: TextEditingController(text: "+91"),
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
          controller: controller,
          keyboardType: TextInputType.phone,
          onChanged: (val) {},
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Phone",
          ),
        ))
      ],
    ),
  );
}
