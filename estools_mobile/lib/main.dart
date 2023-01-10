import 'package:estools_mobile/pages/Login.dart';
import 'package:estools_mobile/pages/Sign_up.dart';
import 'package:estools_mobile/pages/agenda/agenda_page.dart';
import 'package:estools_mobile/pages/camera_page.dart';
import 'package:estools_mobile/pages/gallerie_page.dart';
import 'package:estools_mobile/pages/home.dart';
import 'package:estools_mobile/pages/splash_screen.dart';
import 'package:estools_mobile/pages/splash_screen.dart';
import 'package:estools_mobile/pages/ToDoList.dart';
import 'package:estools_mobile/pages/Notes.dart';
import 'package:estools_mobile/pages/timer/Timer_Estools.dart';

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
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      // second if you want that that the app start with it you have to set the initial route to the name of the rout
      initialRoute: agendaRoute,
      // first add your page here like this format routeName : (context)=> PageName()
      routes: {
        splashRoute: (context) => const SplashScreen(),
        registerRoute: (context) => const SignUp(),
        loginRoute: (context) => const LoginPage(),
        agendaRoute: (context) => const AgendaPage(),
        homeRoute: ((context) => const HomePage()),
        todolistRoute: (context) => const TdlPage(),
        notesRoute: (context) => const NotesPage(),
        timerRoute: (context) => const EsTimer(),
        cameraRoute: (context) => const CameraPage(),
        gallerieRoute: (context) => const GalleriePage(),
      },
    );
  }
}
