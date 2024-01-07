import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:download_manager/Global%20Components/colors.dart';
import 'package:download_manager/Global%20Components/responsive.dart';
import 'package:download_manager/Global%20Components/screenNavigation.dart';
import 'package:download_manager/Screens/register_page.dart';
import 'package:download_manager/Widgets/Login%20Widgets/ltextforfield.dart';
import 'package:download_manager/Widgets/custom_button.dart';
import 'package:download_manager/Widgets/custom_heading.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        color: backgroundColor,
        width: getWidth(context),
        height: getHeight(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: v30(context) + v10(context),
                  horizontal: h30(context)),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      subPrimaryColor,
                      primaryColor,
                    ]),
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(50)),
              ),
              // height: 0.62 * getHeight(context),
              width: getWidth(context),
              child: Column(
                children: [
                  // Username Field
                  const TextFormFieldforLogin(
                    title: "Username",
                    icon: Icons.person,
                  ),
                  sizedBox20(context),
                  // Password Field
                  const TextFormFieldforLogin(
                    title: "Password",
                    icon: Icons.password,
                    obsecure: true,
                  ),
                  sizedBox20(context),
                  // Forgot Password
                  Padding(
                    padding: EdgeInsets.only(left: h5(context)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomHeadingTitle(
                          textString: "Forgot Password?",
                          textSize: 14,
                          textColor: secondaryColor,
                          textWeight: FontWeight.w900,
                        ),
                      ],
                    ),
                  ),
                  sizedBox20(context),
                  // Login Button
                  CustomButton(
                    onPress: () {},
                    btntext: "Login",
                    btnClr: Colors.black,
                    btnTextSize: 20,
                    vPadding: v10(context) + v5(context),
                    btnTextColor: secondaryColor,
                    borderRadius: 10,
                  ),

                  sizedBox20(context),
                  CustomHeadingTitle(
                    textString: "Don't Have an Account?",
                    textSize: 14,
                    textColor: secondaryColor,
                  ),
                  sizedBox10(context),
                  CustomButton(
                    onPress: () async {
                      ScreenNavigation.push(context, RegisterPage());
                    },
                    btntext: "Register",
                    btnClr: Colors.white,
                    btnTextSize: 20,
                    vPadding: v5(context),
                    btnTextColor: primaryColor,
                    borderRadius: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}