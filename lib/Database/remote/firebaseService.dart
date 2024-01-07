import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FireBaseServices {
  static FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  static FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static getAllDownloads() async {
    await firebaseFirestore
        .collection('downloads')
        .doc(firebaseAuth.currentUser!.uid)
        .get();
  }
}
