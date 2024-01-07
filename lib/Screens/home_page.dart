import 'package:download_manager/Global%20Components/responsive.dart';
import 'package:download_manager/Widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:download_manager/Global%20Components/colors.dart';
import 'package:download_manager/Global%20Components/responsive.dart';
import 'package:download_manager/Widgets/custom_heading.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Container(
                  height: 500,
                  // color: Colors.transparent.withOpacity(0.1),
                  child: ClipPath(
                    clipper: mainShape(),
                    child: Container(
                      color: Colors.white,
                      width: getWidth(context),
                      height: 140,
                      child: Column(
                        children: [],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
        backgroundColor: subPrimaryColor,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Icon(
          Icons.link,
          color: secondaryColor,
        ),
      ),
      backgroundColor: backgroundColor,
      body: Container(
        width: getWidth(context),
        height: getHeight(context),
        padding: EdgeInsets.symmetric(
            vertical: v30(context) + v10(context), horizontal: h10(context)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomHeadingTitle(
                  textString: "Welcome, Vraj",
                  textSize: 28,
                  textColor: subtitleColor,
                  textWeight: FontWeight.bold,
                ),
              ],
            ),
            sizedBox20(context),
            const DividerWithName(name: "Currently Downloading"),
            sizedBox20(context),
            const DividerWithName(name: "Downloads"),
          ],
        ),
      ),
    );
  }
}

class mainShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = new Path();
    path.lineTo(0, size.height - 60);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height - 60);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
