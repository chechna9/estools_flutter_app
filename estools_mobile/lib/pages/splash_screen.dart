import 'package:flutter/material.dart';
import 'package:estools_mobile/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              myDark,
              myRed,
            ],
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              "assets/images/logoWO.png",
              width: 187.3,
              height: 127.29,
            ),
            const Text(
              "Every Student's Tool",
              style: TextStyle(
                  fontSize: 19,
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
