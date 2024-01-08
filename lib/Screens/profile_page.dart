import 'package:download_manager/Database/local/MySharedPreferences.dart';
import 'package:download_manager/Global%20Components/screenNavigation.dart';
import 'package:download_manager/Screens/edit_profile.dart';
import 'package:download_manager/Screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:download_manager/Global%20Components/colors.dart';
import 'package:download_manager/Global%20Components/responsive.dart';
import 'package:download_manager/Widgets/Profile%20Widgets/option_tile.dart';
import 'package:download_manager/Widgets/custom_button.dart';
import 'package:download_manager/Widgets/custom_heading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          width: getWidth(context),
          // height: getHeight(context),
          padding: EdgeInsets.only(
              top: v30(context) + v10(context),
              left: h20(context),
              right: h20(context)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomHeadingTitle(
                    textString: "Profile",
                    textSize: 28,
                    textColor: subtitleColor,
                    textWeight: FontWeight.bold,
                  ),
                ],
              ),
              sizedBox20(context),
              Container(
                width: getWidth(context),
                height: 0.36 * getHeight(context),
                padding: EdgeInsets.symmetric(
                    vertical: v20(context), horizontal: h20(context)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          primaryColor.withOpacity(0.5),
                          subPrimaryColor.withOpacity(0.5)
                        ])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // photo
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        height: 0.15 * getHeight(context),
                        width: 0.15 * getHeight(context),
                        decoration: BoxDecoration(
                            color: secondaryColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(100)),
                        child: Icon(
                          Icons.person,
                          color: secondaryColor.withOpacity(0.7),
                          size: 50,
                        ),
                      ),
                    ),

                    // Username

                    CustomHeadingTitle(
                      textString: MySharedPreferences.userName.toString(),
                      textSize: 24,
                      textColor: secondaryColor,
                      textWeight: FontWeight.w900,
                    ),

                    // Name
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.person,
                          color: secondaryColor,
                        ),
                        SizedBox(
                          width: h10(context),
                        ),
                        CustomHeadingTitle(
                          textString: MySharedPreferences.firstName.toString() +
                              " " +
                              MySharedPreferences.lastName.toString(),
                          textSize: 20,
                          textColor: secondaryColor,
                          textWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.email,
                          color: secondaryColor,
                        ),
                        SizedBox(
                          width: h10(context),
                        ),
                        CustomHeadingTitle(
                          textString: MySharedPreferences.email.toString(),
                          textSize: 20,
                          textColor: secondaryColor,
                          textWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              sizedBox20(context),
              CustomButton(
                onPress: () {
                  ScreenNavigation.push(context, const EditProfile());
                },
                btnClr: Colors.black87,
                btntext: "Edit Profile",
                btnTextSize: 20,
                iconEnabled: true,
                icon: Icons.edit,
                borderRadius: 20,
                btnTextColor: secondaryColor,
              ),
              sizedBox20(context),
              SettingsTile(
                  name: "Settings",
                  icon: const Icon(Icons.settings),
                  ontap: () {}),
              SettingsTile(
                  name: "Terms & Conditions",
                  icon: const Icon(Icons.edit_document),
                  ontap: () {}),
              SettingsTile(
                  name: "Log Out",
                  icon: const Icon(Icons.logout_outlined),
                  ontap: () {
                    SharedPreferences.getInstance().then((value) {
                      value.setBool('isLoggedIn', false);
                      ScreenNavigation.pushReplacement(
                          context, const LoginPage());
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
