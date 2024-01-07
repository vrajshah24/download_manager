import 'package:download_manager/Global%20Components/responsive.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

loading(context) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            content: Builder(builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 300 * getResponsive(context),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        'assets/pleaseWait.json',
                        repeat: true,
                        height: 220 * getResponsive(context),
                        fit: BoxFit.fitHeight,
                      ),
                      SizedBox(
                        height: 30 * getResponsive(context),
                      ),
                      Text(
                        'Please Wait',
                        style: TextStyle(
                            fontSize: 20 * getResponsiveText(context),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        );
      });
}
