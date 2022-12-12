import 'package:flutter/material.dart';

Color myDark = const Color(0xff33495e);
Color myRed = const Color(0xffe74c3c);
Color myGrey = const Color(0xffd9d9d9);
Color myWhite = const Color(0xffeaeaea);
// routes
const String splashRoute = '/splashScreen';
const String registerRoute = '/register';
const String loginRoute = '/login';
const String agendaRoute = '/agenda';
// box shadow
const myBoxShadow = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: Colors.black38,
      offset: Offset(
        0.0,
        10.0,
      ),
      blurRadius: 8.0,
      spreadRadius: -6.0,
    ),
  ],
);
