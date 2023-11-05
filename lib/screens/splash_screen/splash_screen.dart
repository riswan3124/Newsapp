import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp1/screens/screen_home/screen_home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ScreenHome(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "News App",
              style: GoogleFonts.poppins(color: Colors.black, fontSize: 26),
            ),
            Image.asset(
              "assets/images/news-break-local-breaking-2018-09-12.png",
              height: 30,
              width: 30,
            ),
          ],
        ),
      ),
    );
  }
}
