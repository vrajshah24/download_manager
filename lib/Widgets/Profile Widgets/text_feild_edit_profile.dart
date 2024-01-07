import 'package:download_manager/Global%20Components/colors.dart';
import 'package:download_manager/Global%20Components/responsive.dart';
import 'package:download_manager/Widgets/custom_heading.dart';
import 'package:flutter/material.dart';

class UpdateUserFields extends StatelessWidget {
  const UpdateUserFields({
    super.key,
    required this.title,
    required this.icon,
    required this.initValue,
  });

  final String title;
  final IconData icon;
  final String initValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initValue,
      style: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.w800, fontSize: 16),
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          alignLabelWithHint: true,
          label: CustomHeadingTitle(
            textString: title,
            textSize: 16,
            textColor: Colors.black,
            textSpace: 0.4,
            textWeight: FontWeight.w500,
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.grey,
          ),
          contentPadding: EdgeInsets.symmetric(
              horizontal: h10(context), vertical: v10(context) + v5(context)),
          filled: true,
          disabledBorder: InputBorder.none,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: subPrimaryColor, width: 2)),
          fillColor: Colors.white.withOpacity(0.4)),
    );
  }
}
