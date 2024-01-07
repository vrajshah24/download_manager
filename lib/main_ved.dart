import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:download_manager/Screens/nav_bar_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.ptSansTextTheme(Theme.of(context).textTheme),
        useMaterial3: true,
      ),
      // home: const HomePage(),
      routes: {
        '/': (context) => const NavBarMainHome(),
      },
    );
  }
}
