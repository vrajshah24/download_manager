// ignore_for_file: use_build_context_synchronously

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:download_manager/Database/local/MySharedPreferences.dart';
import 'package:download_manager/Database/local/initDB.dart';
import 'package:download_manager/Global%20Components/colors.dart';
import 'package:download_manager/Global%20Components/screenNavigation.dart';
import 'package:download_manager/Screens/login_page.dart';
import 'package:download_manager/Screens/nav_bar_home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Global Components/responsive.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDB();
  }

  bool? isLoggedIn = false;
  initDB() async {
    await MySharedPreferences.getInfo();
    await Future.delayed(const Duration(seconds: 3)).then((value) async {
      await CentralDB.instance.database;
    });
    await MySharedPreferences.getUserDocumentInfo();
    await SharedPreferences.getInstance().then((value) {
      isLoggedIn = value.getBool('isLoggedIn') ?? false;
      print(value.getString('u_id'));
    });
    if (isLoggedIn!) {
      ScreenNavigation.pushReplacement(context, const NavBarMainHome());
    } else {
      ScreenNavigation.pushReplacement(context, const LoginPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(isLoggedIn);
    return AnimatedSplashScreen(
      splashIconSize: 0.9 * getWidth(context),
      backgroundColor: backgroundColor,
      splash: Image.asset(
        'assets/images/logo_3_trans.png',
      ),
      // here check if sharedpref loggedin is true or not,
      // if yes, then go to NavBarMainHome() else go to LoginPage(.)
      nextScreen: isLoggedIn! ? const NavBarMainHome() : const LoginPage(),
      duration: 3000,
      disableNavigation: true,
      animationDuration: const Duration(milliseconds: 1000),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
