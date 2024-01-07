import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class CameraApp extends StatefulWidget {
  final CameraDescription camera;

  const CameraApp({Key? key, required this.camera}) : super(key: key);

  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.ultraHigh,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<String> _takePicture() async {
    try {
      await _initializeControllerFuture;
      var res = await _controller.takePicture();
      // print(res.path);
      return res.path;
    } catch (e) {
      // print('Error taking picture: $e');
      return '';
    }
  }

  Future<void> _saveToGallery(String imagePath) async {
    try {
      if (Platform.isAndroid) {
        await ImageGallerySaver.saveFile(imagePath);
      }
      // print('Image saved to gallery: $result');
    } catch (e) {
      // print('Error saving image to gallery: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                // Container(height: 150),
                CameraPreview(
                  _controller,
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        final imagePath = await _takePicture();
                        if (imagePath.isNotEmpty) {
                          await _saveToGallery(imagePath);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Image saved to gallery')),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Failed to capture image')),
                          );
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(width: 2, color: Colors.white)),
                        padding: const EdgeInsets.all(3),
                        child: const Icon(
                          Icons.circle,
                          color: Colors.white,
                          size: 60,
                        ),
                      ),
                    )
                  ],
                )
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
