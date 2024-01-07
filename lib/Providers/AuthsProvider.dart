import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:download_manager/Database/local/MySharedPreferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class AuthsProvider extends ChangeNotifier {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  registerUser(
      {required String username,
      required String password,
      required String firstName,
      required String lastName,
      required String email,
      required String image}) async {
    await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    Reference storageReference =
        firebaseStorage.ref().child('images/${DateTime.now()}.png');
    await storageReference.putFile(File(image));
    String downloadURL = await storageReference.getDownloadURL();
    // print(res);
    Map<String, dynamic> userData = {};
    userData['username'] = username;
    userData['first_name'] = firstName;
    userData['last_name'] = lastName;
    userData['profile_pic'] = downloadURL;
    userData['email'] = email;
    var resp = await firebaseFirestore.collection('users').add(userData);
    await loginUser(email: email, password: password);
    String uid = firebaseAuth.currentUser!.uid;
    MySharedPreferences.setInfo(userData, uid);
    MySharedPreferences.getInfo();
  }

  loginUser({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      var res = await firebaseFirestore
          .collection('users')
          .where('email', isEqualTo: email)
          .get();
      MySharedPreferences.getInfo();
    } catch (e) {
      print(e);
    }
  }

  forgotPassword({
    required String email,
  }) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
