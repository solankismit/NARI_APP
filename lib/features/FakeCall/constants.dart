import 'dart:ui';
import 'package:flutter/painting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
TextStyle ?kHeadingTextStyle = TextStyle(
    color:primary,
    fontWeight: FontWeight.w500,
    fontSize: 20.0
);
TextStyle ?kLabelTextStyle = TextStyle(
  color: primary,
  fontWeight: FontWeight.w300,
  fontStyle: FontStyle.italic,
  fontSize: 18.0,
);
TextStyle ?kLightLabelTextStyle = TextStyle(
  color: primary,
  fontWeight: FontWeight.w300,
  fontStyle: FontStyle.italic,
  fontSize: 18.0,
);

Color primary = Color.fromARGB(255, 0,46,88);
Color secondary = Color.fromARGB(255, 143,182,237 );