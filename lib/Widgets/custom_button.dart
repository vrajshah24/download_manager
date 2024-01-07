import 'package:flutter/material.dart';
import 'package:download_manager/Global%20Components/responsive.dart';
import 'package:download_manager/Widgets/custom_heading.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onPress,
      this.btntext = 'Button Text Here',
      this.btnTextColor = Colors.white,
      this.btnTextSize = 14,
      this.btnClr = const Color(0xff3d65f9),
      this.vPadding = 10,
      this.iconEnabled = false,
      this.hPadding = 10,
      this.borderClr = Colors.transparent,
      this.borderWidth = 0,
      this.borderRadius = 4,
      this.icon});

  final VoidCallback onPress;
  final bool iconEnabled;
  final double borderRadius;
  final String btntext;
  final double btnTextSize;
  final Color btnTextColor;
  final Color btnClr;
  final double vPadding;
  final double hPadding;
  final Color borderClr;
  final double borderWidth;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: btnClr,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onPress,
        splashColor: Colors.black.withOpacity(0.3),
        child: Container(
          width: getWidth(context),
          padding:
              EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding),
          decoration: BoxDecoration(
              // color: primaryColor,
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(color: borderClr, width: borderWidth),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0, 15),
                    color: Colors.black12,
                    blurRadius: 15)
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              iconEnabled
                  ? Icon(
                      icon,
                      size: 20,
                      color: btnTextColor,
                    )
                  : SizedBox.shrink(),
              iconEnabled
                  ? SizedBox(
                      width: h10(context),
                    )
                  : SizedBox.shrink(),
              CustomHeadingTitle(
                textString: btntext,
                textSize: btnTextSize,
                textColor: btnTextColor,
                textSpace: 0.7,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
