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
    await firebaseStorage
        .ref()
        .child('profile_pic')
        .child(DateTime.now().toString())
        .putFile(File(image));
    Map<String, dynamic> userData = {};
    userData['username'] = username;
    userData['first_name'] = firstName;
    userData['last_name'] = lastName;
    userData['profile_pic'] = image;
    userData['email'] = email;
    await firebaseFirestore.collection('users').add(userData);
    String uid = firebaseAuth.currentUser!.uid;
    MySharedPreferences.setInfo(userData, uid);
  }

  loginUser({
    required String email,
    required String password,
  }) async {
    await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  forgotPassword({
    required String email,
  }) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
