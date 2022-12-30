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
const String homeRoute = '/home';
const String todolistRoute = '/ToDoList';
const String notesRoute = '/Notes';
// box shadow
const BoxShadow myBoxShadow = BoxShadow(
  color: Colors.black38,
  offset: Offset(
    0.0,
    10.0,
  ),
  blurRadius: 8.0,
  spreadRadius: -6.0,
);
const BoxShadow catgFooterBoxShadow = BoxShadow(
  color: Colors.black38,
  offset: Offset(0, -2),
  spreadRadius: 5,
  blurRadius: 10,
);
const buttonBoxShadow = [
  BoxShadow(
    color: Colors.black38,
    offset: Offset(
      0.0,
      10.0,
    ),
    blurRadius: 8.0,
    spreadRadius: -6.0,
  ),
];
// button style form
ButtonStyle btnSyle = TextButton.styleFrom(
  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
  backgroundColor: myRed,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
);
