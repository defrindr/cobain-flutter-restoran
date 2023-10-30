import 'package:flutter/material.dart';
import 'package:restaurant/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restoran APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        primaryColorLight: Colors.white,
        primaryColorDark: Colors.grey[850],
        splashColor: Colors.blueAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashScreen(),
    );
  }
}
