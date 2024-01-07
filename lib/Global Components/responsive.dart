import 'package:flutter/material.dart';

double getHeight(context) {
  return MediaQuery.of(context).size.height;
}

double getWidth(context) {
  return MediaQuery.of(context).size.width;
}

double getResponsive(context) {
  return MediaQuery.of(context).size.height * 0.001;
}

double getResponsiveText(context) {
  return MediaQuery.of(context).textScaleFactor;
}

SizedBox sizedBox5(context) {
  return SizedBox(
    height: 0.0078125 * getHeight(context),
    // height: 30,
  );
}

SizedBox sizedBox10(context) {
  return SizedBox(
    height: 0.01562 * getHeight(context),
    // height: 30,
  );
}

SizedBox sizedBox20(context) {
  return SizedBox(
    height: 0.03125 * getHeight(context),
    // height: 30,
  );
}

SizedBox sizedBox24(context) {
  return SizedBox(
    height: 0.0375 * getHeight(context),
    // height: 24,
  );
}

SizedBox sizedBox30(context) {
  return SizedBox(
    height: 0.046875 * getHeight(context),
    // height: 30,
  );
}

SizedBox sizedBox40(context) {
  return SizedBox(
    height: 0.0625 * getHeight(context),
    // height:40,
  );
}

EdgeInsets padding0x20(context) {
  return EdgeInsets.symmetric(
      // vertical: 0.03125 * getHeight(context),
      horizontal: 0.0555 * getWidth(context));
}

EdgeInsets padding20x20(context) {
  return EdgeInsets.symmetric(
      // vertical: 0.03125 * getHeight(context),
      vertical: 0.03125 * getHeight(context),
      horizontal: 0.0555 * getWidth(context));
}

EdgeInsets padding15x15(context) {
  return EdgeInsets.symmetric(
      // vertical: 0.03125 * getHeight(context),
      vertical: 0.0234 * getHeight(context),
      horizontal: 0.0417 * getWidth(context));
}

EdgeInsets padding40x20(context) {
  return EdgeInsets.symmetric(
      // vertical: 0.03125 * getHeight(context),
      vertical: 0.0625 * getHeight(context),
      horizontal: 0.0555 * getWidth(context));
}

EdgeInsets padding40x0x20x20(context) {
  return EdgeInsets.only(
    // vertical: 0.03125 * getHeight(context),
    top: 0.0625 * getHeight(context),
    right: 0.0555 * getWidth(context),
    left: 0.0555 * getWidth(context),
    bottom: 0,
  );
}

double h1(context)
{
  return 0.0028 * getWidth(context);
}

double h5(context)
{
  return 0.0139 * getWidth(context);
}

double h10(context)
{
  return 0.0278 * getWidth(context);
}
double h20(context)
{
  return 0.0556 * getWidth(context);
}

double h30(context)
{
  return 0.0833 * getWidth(context);
}

double v1(context)
{
  return 0.0016 * getHeight(context);
}

double v5(context)
{
  return 0.0078 * getHeight(context);
}

double v10(context)
{
  return 0.0156 * getHeight(context);
}

double v20(context)
{
  return 0.0313 * getHeight(context);
}

double v30(context)
{
  return 0.0469 * getHeight(context);
}
