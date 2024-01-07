import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:download_manager/Global%20Components/colors.dart';
import 'package:download_manager/Global%20Components/responsive.dart';
import 'package:download_manager/Widgets/Register%20Widgets/Rtextforfield.dart';
import 'package:download_manager/Widgets/custom_back_button.dart';
import 'package:download_manager/Widgets/custom_button.dart';
import 'package:download_manager/Widgets/custom_heading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  FilePickerResult? image;
  bool imgpicker = false;
  var imgname = "";
  var imgloc1 = "";
  var imgloc = "";
  var imgpath = "";

  TextEditingController email = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              subPrimaryColor,
              primaryColor,
            ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: CustomBackButton(btnClr: secondaryColor),
          centerTitle: true,
          scrolledUnderElevation: 5,
          title: CustomHeadingTitle(
            textString: "Register",
            textSize: 20,
            textColor: secondaryColor,
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: h20(context)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Register Components
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    height: 0.15 * getHeight(context),
                    width: 0.15 * getHeight(context),
                    decoration: BoxDecoration(
                        color: secondaryColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(100)),
                    child: imgpicker == true
                        ? Image.file(
                            File(imgpath),
                            fit: BoxFit.fill,
                          )
                        : Icon(
                            Icons.person,
                            color: secondaryColor.withOpacity(0.7),
                            size: 50,
                          ),
                    // after done, replace below code with above
                    // -----------------------------------------------
                    // imgpicker == true
                    //     ? Image.file(
                    //         File(imgpath),
                    //         height: 100,
                    //       )
                    //     :
                    //     // Here check if api retrieving img is empty
                    //     userVal.profilePicUrl.isEmpty
                    //         ? Icon(
                    //             Icons.person,
                    //             color: secondaryColor.withOpacity(0.7),
                    //             size: 50,
                    //           )
                    //         :
                    //         // If not empty then show here replace userval and all
                    //         CachedNetworkImage(
                    //             height: 100,
                    //             imageUrl: userVal.profilePicUrl,
                    //           ),
                  ),
                ),
                sizedBox10(context),
                // Pick a button
                Material(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(100),
                  child: InkWell(
                    onTap: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles();
                      if (result != null) {
                        File file = File(result.files.single.path!);
                        imgpath = file.path;
                        // print(imgpath);
                      } else {
                        imgpath = "";
                      }
                      setState(() {
                        imgpicker = true;
                      });
                    },
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: v5(context),
                          horizontal: h5(context) + h1(context) + h1(context)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.linked_camera,
                            size: 12,
                            color: secondaryColor,
                          ),
                          CustomHeadingTitle(
                              textColor: secondaryColor,
                              textString: " Pick A Profile Photo",
                              textSize: 10)
                        ],
                      ),
                    ),
                  ),
                ),
                sizedBox20(context),
                const TextFormFieldforRegister(
                  title: "First Name",
                  icon: Icons.first_page,
                  hint: "Enter Your First Name - E.g, John",
                ),
                sizedBox20(context),
                const TextFormFieldforRegister(
                  title: "Last Name",
                  icon: Icons.last_page,
                  hint: "Enter Your Last Name - E.g, Doe",
                ),
                sizedBox20(context),
                const TextFormFieldforRegister(
                  title: "Username",
                  icon: Icons.person,
                  hint: "Enter Your Username - E.g, JohnDoe123",
                ),
                sizedBox20(context),
                const TextFormFieldforRegister(
                  title: "E-mail",
                  icon: Icons.email,
                  hint: "Enter E-mail Address - example@example.com",
                ),
                // sizedBox20(context),
                // const TextFormFieldforRegister(title: "Phone", icon: Icons.phone,
                // hint: "Enter Your Mobile Number",
                // ),
                sizedBox20(context),
                const TextFormFieldforRegister(
                  title: "Password",
                  icon: Icons.password,
                  hint: "Must be between 6-12 letters",
                ),
                sizedBox30(context),
                CustomButton(
                  onPress: () async {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: email.text, password: password.text);
                  },
                  btntext: "REGISTER",
                  btnTextColor: secondaryColor,
                  btnTextSize: 18,
                  btnClr: Colors.black87,
                  vPadding: v10(context) + v5(context),
                  borderRadius: 100,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
