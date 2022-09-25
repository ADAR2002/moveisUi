import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scaff/screens/home.dart';
import 'package:scaff/screens/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: GoogleFonts.openSans().fontFamily),
      home: const OnBoardingScreen(),
    );
  }
}
