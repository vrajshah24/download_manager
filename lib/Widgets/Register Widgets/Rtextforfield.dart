import 'package:flutter/material.dart';
import 'package:download_manager/Global%20Components/colors.dart';
import 'package:download_manager/Global%20Components/responsive.dart';
import 'package:download_manager/Widgets/custom_heading.dart';

class TextFormFieldforRegister extends StatelessWidget {
  const TextFormFieldforRegister({
    super.key,
    required this.title,
    required this.icon,
    this.obsecure = false,
    required this.hint,
  });

  final String title;
  final IconData icon;
  final bool obsecure;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecure,
      style: TextStyle(
          color: secondaryColor, fontWeight: FontWeight.w800, fontSize: 16),
      decoration: InputDecoration(
          hintText: hint,
          hintStyle:
              TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 12),
          alignLabelWithHint: true,
          label: CustomHeadingTitle(
            textString: title,
            textSize: 16,
            textColor: secondaryColor,
            textSpace: 0.4,
            textWeight: FontWeight.w500,
          ),
          prefixIcon: Icon(
            icon,
            color: secondaryColor,
          ),
          contentPadding: EdgeInsets.symmetric(
              horizontal: h10(context), vertical: v10(context) + v5(context)),
          filled: true,
          disabledBorder: InputBorder.none,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: Colors.transparent, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: secondaryColor, width: 2)),
          fillColor: Colors.white.withOpacity(0.4)),
    );
  }
}
