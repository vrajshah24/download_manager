import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  static String? firstName = "";
  static String? userName = "";
  static String? lastName = "";
  static String? email = "";
  static String? uid = "";
  static String? profilePic = "";
  static String userDocId = "";
  static setInfo(Map<String, dynamic> userData, String uid) async {
    SharedPreferences.getInstance().then((value) {
      value.setString('username', userData['username']);
      value.setString('first_name', userData['first_name']);
      value.setString('last_name', userData['last_name']);
      value.setString('profile_pic', userData['profile_pic']);
      value.setString('email', userData['email']);
      value.setString('u_id', uid);
    });
  }

  static getInfo() async {
    SharedPreferences.getInstance().then((value) {
      userName = value.getString('username');
      firstName = value.getString('first_name');
      lastName = value.getString('last_name');
      profilePic = value.getString('profile_pic');
      email = value.getString('email');
      uid = value.getString('u_id');
    });
  }

  static setUserDocumentInfo(String uid) async {
    SharedPreferences.getInstance().then((value) {
      value.setString('doc_id', uid);
    });
  }

  static getUserDocumentInfo() async {
    SharedPreferences.getInstance().then((value) {
      userDocId = value.getString('doc_id').toString();
    });
  }
}
