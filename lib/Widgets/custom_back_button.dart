import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final Color btnClr;

   const CustomBackButton({
    super.key,
    this.btnClr = const Color(0xff5a577a)
  });


  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        borderRadius: BorderRadius.circular(100),
        child: Icon(
          Icons.arrow_back_ios_new,
          color: btnClr,
          size: 20,
        ),
      ),
    );
  }
}
