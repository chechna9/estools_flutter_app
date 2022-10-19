import 'package:flutter/material.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: myDark,
        alignment: Alignment.center,
        child: Text(
          "Azul World",
          style: TextStyle(fontSize: 24, color: myWhite),
        ),
      ),
    );
  }
}
