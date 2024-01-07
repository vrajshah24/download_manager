import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:download_manager/Global%20Components/colors.dart';
import 'package:download_manager/Screens/nav_bar_home.dart';
import 'package:flutter/material.dart';

import '../Global Components/responsive.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 0.9 * getWidth(context),
      backgroundColor: backgroundColor,
      splash: Image.asset(
        'assets/images/logo_3_trans.png',
      ),
      // here check if sharedpref loggedin is true or not,
      // if yes, then go to NavBarMainHome() else go to LoginPage(.)
      nextScreen: const NavBarMainHome(),
      duration: 3000,
      animationDuration: const Duration(milliseconds: 1000),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
