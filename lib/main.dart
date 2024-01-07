// ignore_for_file: use_build_context_synchronously
import 'package:download_manager/Screens/camera.dart';
import 'package:download_manager/Screens/login_page.dart';
import 'package:download_manager/Screens/nav_bar_home.dart';
import 'package:download_manager/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MaterialApp(
      routes: {'/': (context) => const LoginPage()},
    ),
  );
}

// final cameras = await availableCameras();
//   final firstCamera = cameras.first;

//   runApp(MyApp(camera: firstCamera));

class MyApp extends StatelessWidget {
  final CameraDescription camera;

  const MyApp({Key? key, required this.camera}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CameraApp(camera: camera),
    );
  }
}
