import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  String firstName = "";
  String userName = "";
  String lastName = "";
  String email = "";
}
