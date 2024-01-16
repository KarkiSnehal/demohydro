import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydrogang/features/customer/authentication/screens/onboarding.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(248, 43, 49, 39)),
      ),
      home: const OnBoardingScreen(),
    );
  }
}
