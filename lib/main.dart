import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neewsaap/view/screens/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
textTheme: GoogleFonts.arvoTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}


