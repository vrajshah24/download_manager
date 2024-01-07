import 'package:flutter/material.dart';

class ScreenNavigation {
  static push(context, screen) {
    return Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return screen;
      },
    ));
  }

  static pushReplacement(context, screen) {
    return Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return screen;
      },
    ));
  }

  static pushNRemoveUntil(context, screen) {
    return Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return screen;
      },
    ), (route) => false);
  }

  static pushThen(context, screen,{thenFunction}) {
    return Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return screen;
      },
    )).then((value){

    });
  }

}
