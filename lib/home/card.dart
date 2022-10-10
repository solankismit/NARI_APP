import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget CardList({text,img, function}){
  return Card(
    shape:
    const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
    elevation: 5,
        color: Color.fromARGB(255, 143, 182, 237),
    margin: const EdgeInsets.all(5),
    child: InkWell(
      onTap: function,
      child: Container(
        // rgba(143,182,237,255)
        // height: 80,
        padding: const EdgeInsets.all(8),
        child: ListTile(
          title: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Image.asset(img,height: 60,)
            ],
          ),

          ),
      ),
    ),
  );
}