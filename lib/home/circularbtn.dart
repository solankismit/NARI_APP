import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget CircularBtn({required String imgsrc,required String imgtext, func}){
  var _bgcolor = Color.fromARGB(255, 143,182,237 );
  return Container(
    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: func,
          child: CircleAvatar(
            backgroundColor: _bgcolor,
            radius: 45,
            child: CircleAvatar(backgroundColor:_bgcolor,foregroundImage: AssetImage(imgsrc),radius: 34),

          ),
        ),
        SizedBox(height: 10,),
        Text(imgtext,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800),)
      ],
    ),
  );
}