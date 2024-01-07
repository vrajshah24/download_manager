import 'package:flutter/material.dart';

class CustomHeadingTitle extends StatelessWidget {
  final String textString;
  final double textSize;
  final double lineHeight;
  final double textSpace;
  final FontWeight textWeight;
  final TextAlign textAlign;
  final FontStyle style;
  final Color textColor;
  final int maxlines;

  const CustomHeadingTitle({
    required this.textString,
    required this.textSize,
    this.textColor = Colors.black,
    this.textWeight = FontWeight.w900,
    this.textSpace = 0.4,
    this.textAlign = TextAlign.center,
    this.lineHeight = 1.3,
    this.style = FontStyle.normal,
    this.maxlines = 99999,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxlines,
      textString,
      textAlign: textAlign,
      style: TextStyle(
          fontStyle: style,
          fontSize: textSize,
          fontWeight: textWeight,
          color: textColor,
          letterSpacing: textSpace,
          height: lineHeight),
    );
  }
}
