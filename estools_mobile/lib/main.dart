import 'package:estools_mobile/pages/Login.dart';
import 'package:estools_mobile/pages/Sign_in.dart';
import 'package:estools_mobile/pages/test.dart';
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
      theme: ThemeData(
        fontFamily: 'Poppins',
        // in order to have a coherent typo add the text style here to reuse it then

        textTheme: const TextTheme(
          // exapmple
          headlineMedium: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      // second if you want that that the app start with it you have to set the initial route to the name of the rout
      initialRoute: '/Sign_in',
      // first add your page here like this format routeName : (context)=> PageName()
      routes: {
        '/test': (context) => const Test(),
        '/Login': (context) => const Login(),
        '/Sign_in': (context) => const Signin()
      },
    );
  }
}
