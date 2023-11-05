import 'package:flutter/material.dart';
import 'package:newsapp1/controller/bottom_navi.dart';
import 'package:newsapp1/controller/news_api_controller.dart';
import 'package:newsapp1/screens/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NewApiService(),
        ),
        ChangeNotifierProvider(
          create: (context) => ButtonActionController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
