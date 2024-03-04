import '/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      home: const HomePageScreen(),
      theme: ThemeData(
        fontFamily: GoogleFonts.inter().fontFamily,
      ),
    ),
  );
}


