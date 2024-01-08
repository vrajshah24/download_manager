// ignore_for_file: use_build_context_synchronously
import 'package:download_manager/Providers/AuthsProvider.dart';
import 'package:download_manager/Providers/UserProvider.dart';
import 'package:download_manager/Screens/camera.dart';
import 'package:download_manager/Screens/nav_bar_home.dart';
import 'package:download_manager/Screens/splash_screen.dart';
import 'package:download_manager/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await requestPermissions();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  List<CameraDescription> cameras = [];
  // final firstCamera = cameras.first;
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    // _logError(e.code, e.description);

    print('objectobjectobjectobjectobject');
    print(e);
  }
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthsProvider()),
      ChangeNotifierProvider(create: (_) => UserProvider()),
    ],
    child: MaterialApp(
      routes: {
        // '/': (context) => const LoginPage(),
        // '/': (context) => const NavBarMainHome(),
        '/': (context) => const SplashScreen(),
        // '/': (context) => MyApp(camera: cameras.first),
      },
    ),
  ));
}

Future<void> requestPermissions() async {
  // Request any permissions your app requires on launch
  await Permission.camera.request();
  // await Permission.storage.request();
  // Add other permissions as needed

  // Check if the user granted all requested permissions
  if (await Permission.camera.isGranted) {
    // Permissions granted, proceed with your app logic
    print('Permissions granted');
  } else {
    // Permissions not granted, handle accordingly (e.g., show an error message)
    print('Permissions not granted');
  }
}
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
