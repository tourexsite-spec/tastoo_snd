import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

class TastooApp extends StatelessWidget {
  const TastooApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tastoo SND',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const SplashScreen(),
    );
  }
}
