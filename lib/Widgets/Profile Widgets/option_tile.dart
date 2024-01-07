import 'package:flutter/material.dart';
import 'package:download_manager/Global%20Components/colors.dart';
import 'package:download_manager/Global%20Components/responsive.dart';

class SettingsTile extends StatelessWidget {
  final String name;
  final Icon icon;
  SettingsTile(
      {super.key, required this.name, required this.icon, required this.ontap});
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          // elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Colors.white,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Material(
              color: Colors.white,
              child: InkWell(
                onTap: ontap,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 15 * getResponsive(context)),
                  width: 0.9 * getWidth(context),
                  height: 0.07 * getHeight(context),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      icon,
                      SizedBox(
                        width: 20 * getResponsive(context),
                      ),
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black54,
                            height: 1.6,
                            letterSpacing: 0.4),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        sizedBox10(context),
      ],
    );
  }
}
