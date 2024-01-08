import 'dart:io';

import 'package:download_manager/Database/local/MySharedPreferences.dart';
import 'package:download_manager/Global%20Components/colors.dart';
import 'package:download_manager/Global%20Components/responsive.dart';
import 'package:download_manager/Global%20Components/screenNavigation.dart';
import 'package:download_manager/Providers/AuthsProvider.dart';
import 'package:download_manager/Screens/nav_bar_home.dart';
import 'package:download_manager/Widgets/Profile%20Widgets/text_feild_edit_profile.dart';
import 'package:download_manager/Widgets/custom_back_button.dart';
import 'package:download_manager/Widgets/custom_button.dart';
import 'package:download_manager/Widgets/custom_heading.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  FilePickerResult? image;
  bool imgpicker = false;
  var imgname = "";
  var imgloc1 = "";
  var imgloc = "";
  var imgpath = "";
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    firstName.value =
        TextEditingValue(text: MySharedPreferences.firstName.toString());
    lastName.value =
        TextEditingValue(text: MySharedPreferences.lastName.toString());
    username.value =
        TextEditingValue(text: MySharedPreferences.userName.toString());
    setState(() {});
  }

  GlobalKey<FormState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthsProvider>(builder: (context, value, child) {
      return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: CustomBackButton(),
          title: CustomHeadingTitle(textString: "Edit Profile", textSize: 20),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: key,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: h20(context), vertical: v20(context)),
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
                          value.updateProfilePic(imgpath);
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
                            horizontal:
                                h5(context) + h1(context) + h1(context)),
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
                  UpdateUserFields(
                    initValue: MySharedPreferences.firstName.toString(),
                    title: "First Name",
                    icon: Icons.first_page,
                    controller: firstName,
                  ),
                  sizedBox20(context),
                  UpdateUserFields(
                    initValue: "Doe",
                    title: "Last Name",
                    controller: lastName,
                    icon: Icons.last_page,
                  ),
                  // sizedBox20(context),
                  // UpdateUserFields(
                  //   initValue: "JohnDoe123",
                  //   title: "Username",
                  //   icon: Icons.person,
                  //   controller: username,
                  // ),
                  sizedBox20(context),
                  UpdateUserFields(
                    initValue: "JohnDoe@132",
                    title: "Username",
                    icon: Icons.person,
                    controller: username,
                  ),
                  // sizedBox20(context),
                  // const TextFormFieldforRegister(title: "Phone", icon: Icons.phone,
                  // hint: "Enter Your Mobile Number",
                  // ),
                  sizedBox30(context),

                  sizedBox30(context),
                  CustomButton(
                    onPress: () {
                      if (key.currentState!.validate()) {
                        value.updateUser(data: {
                          'first_name': firstName.text,
                          'last_name': lastName.text,
                          'username': username.text
                        });
                        ScreenNavigation.pushReplacement(
                            context, NavBarMainHome());
                      }
                    },
                    btntext: "UPDATE INFO",
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
    });
  }
}
