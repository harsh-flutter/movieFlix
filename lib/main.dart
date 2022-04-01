import 'package:flutter/material.dart';
import 'package:MovieFlix/screen/screens.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splashscreen/splashscreen.dart';

import 'core/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // applicationContext.initialization(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // title: ApplicationTexts.APP_NAME,
        theme: OroPocketTheme.lightTheme,
        home: SplashScreen(
          image: Image.asset(
            "assets/images/movieFlix.png",
            width: 500,
            height: 500,
          ),
          photoSize: 100.0,
          seconds: 3,
          navigateAfterSeconds: const TopMoviesScreen(),
          loadingText: Text("MovieFlix",
              style: GoogleFonts.balooBhai(
                  color: Colors.grey.shade900, fontSize: 50)),
          loaderColor: Colors.transparent,
          backgroundColor: Colors.white,
        ));
  }
}
