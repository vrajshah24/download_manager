import 'package:download_manager/Global%20Components/colors.dart';
import 'package:download_manager/Global%20Components/responsive.dart';
import 'package:download_manager/Global%20Components/screenNavigation.dart';
import 'package:download_manager/Providers/AuthsProvider.dart';
import 'package:download_manager/Screens/login_page.dart';
import 'package:download_manager/Widgets/custom_back_button.dart';
import 'package:download_manager/Widgets/custom_button.dart';
import 'package:download_manager/Widgets/custom_heading.dart';
import 'package:download_manager/Widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  TextEditingController email = TextEditingController();
  GlobalKey<FormState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthsProvider>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: const CustomBackButton(),
        ),
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Container(
            width: getWidth(context),
            padding: EdgeInsets.symmetric(
                vertical: v30(context), horizontal: h20(context)),
            child: Form(
              key: key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo_2_trans.png',
                    width: 0.6 * getWidth(context),
                  ),
                  sizedBox20(context),
                  CustomHeadingTitle(
                    textString: "Forgot Your Password?",
                    textSize: 20,
                    textColor: Colors.black.withOpacity(0.7),
                    textWeight: FontWeight.w900,
                  ),
                  sizedBox10(context),
                  CustomHeadingTitle(
                    textString:
                        "Enter your E-mail Address to Get Mail to Reset your Password",
                    textSize: 16,
                    textColor: Colors.black.withOpacity(0.5),
                    textWeight: FontWeight.w900,
                  ),
                  sizedBox20(context),
                  TextFormField(
                    controller: email,
                    obscureText: false,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 18),
                    decoration: InputDecoration(
                        label: const CustomHeadingTitle(
                          textString: "Enter Your E-mail",
                          textSize: 16,
                          textColor: Colors.grey,
                          textSpace: 0.4,
                          textWeight: FontWeight.w500,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: h10(context),
                            vertical: v10(context) + v5(context)),
                        filled: true,
                        disabledBorder: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 2)),
                        fillColor: Colors.white.withOpacity(0.4)),
                  ),
                  sizedBox20(context),
                  CustomButton(
                    onPress: () {
                      // loading(context);
                      if (key.currentState!.validate()) {
                        value.forgotPassword(email: email.text);
                      }
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Password Link has been sent')));
                      ScreenNavigation.pushReplacement(
                          context, const LoginPage());
                    },
                    btntext: "Get Mail!",
                    btnClr: Colors.black,
                    btnTextSize: 16,
                    borderRadius: 10,
                    vPadding: v10(context) + v5(context),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
