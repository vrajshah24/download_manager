// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:download_manager/Database/local/MySharedPreferences.dart';
import 'package:download_manager/Database/local/models/downloadModel.dart';
import 'package:download_manager/Database/local/services/downloadServices.dart';
import 'package:download_manager/Global%20Components/colors.dart';
import 'package:download_manager/Global%20Components/responsive.dart';
import 'package:download_manager/Global%20Components/screenNavigation.dart';
import 'package:download_manager/Widgets/custom_button.dart';
import 'package:download_manager/Widgets/custom_heading.dart';
import 'package:download_manager/main.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController downloadUrl = TextEditingController();
  late Dio dio;
  int queue = 0;
  @override
  void initState() {
    // TODO: implement initState
    dio = Dio();
    name = MySharedPreferences.firstName.toString();
    getCurrentList();
  }

  List currentList = [];
  List downloadedList = [];

  getCurrentList() async {
    currentList = await DownloadManagerDatabase.getAllLocallyDownloaded();
    setState(() {});
  }

  getDownloadedList() async {
    downloadedList = await DownloadManagerDatabase.getAllRemotelyDownloaded();
    setState(() {});
  }

  String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Column(
                  children: [
                    TextFormField(
                      controller: downloadUrl,
                      style: const TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                          isDense: true,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: subPrimaryColor)),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          label: const CustomHeadingTitle(
                              textString: "URL :", textSize: 18),
                          hintText: "Paste / Enter your URL here!",
                          hintStyle: const TextStyle(
                              color: Colors.grey, fontSize: 12)),
                    ),
                    sizedBox20(context),
                    CustomButton(
                      onPress: () async {
                        // print(downloadUrl.text);
                        // print(MySharedPreferences.uid);
                        String x = downloadUrl.text;
                        DownloadModel dm = DownloadModel(
                            userid: MySharedPreferences.uid.toString(),
                            url: x,
                            date: DateTime.now().toString(),
                            status: 0);
                        await DownloadManagerDatabase.createDownloadLog(dm);
                        print(dm.url);
                        currentList.add(dm);
                        queue += 1;
                        getCurrentList();
                        downloadUrl.clear();
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Added To Queue')));
                      },
                      vPadding: v10(context),
                      btntext: "Add To Queue",
                      btnClr: subPrimaryColor,
                    ),
                    sizedBox10(context),
                    CustomButton(
                      onPress: () {
                        Navigator.pop(context);
                      },
                      vPadding: v10(context),
                      btntext: "Cancel",
                      btnTextColor: Colors.black87,
                      btnClr: secondaryColor,
                    ),
                  ],
                ),
              );
            },
          );
        },
        backgroundColor: subPrimaryColor,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Icon(
          Icons.link,
          color: secondaryColor,
        ),
      ),
      backgroundColor: backgroundColor,
      body: Container(
        color: backgroundColor,
        width: getWidth(context),
        height: getHeight(context),
        padding: EdgeInsets.symmetric(
            vertical: v30(context) + v10(context), horizontal: h20(context)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomHeadingTitle(
                  textString: "Welcome, ${MySharedPreferences.firstName}",
                  textSize: 28,
                  textColor: Colors.black.withOpacity(0.7),
                  textWeight: FontWeight.bold,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () async {
                    List<CameraDescription> cameras = [];
                    // final firstCamera = cameras.first;
                    try {
                      WidgetsFlutterBinding.ensureInitialized();
                      cameras = await availableCameras();
                    } on CameraException catch (e) {
                      print(e.description);
                    }
                    ScreenNavigation.push(
                      context,
                      MyApp(camera: cameras.first),
                    );
                  },
                  child: const Icon(
                    Icons.camera,
                    size: 30,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            sizedBox20(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomHeadingTitle(
                  textString: "Queue ($queue)",
                  textSize: 16,
                  textColor: Colors.grey,
                ),
              ],
            ),
            Expanded(
              child: ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: currentList.length,
                // scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return DownloadListTile(
                    dm: currentList[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    thickness: 1,
                    indent: 20 * getResponsive(context),
                    endIndent: 20 * getResponsive(context),
                    color: Colors.grey,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DownloadListTile extends StatefulWidget {
  final DownloadModel dm;
  const DownloadListTile({super.key, required this.dm});

  @override
  State<DownloadListTile> createState() => _DownloadListTileState();
}

class _DownloadListTileState extends State<DownloadListTile> {
  int downloadProgress = 0;
  bool isDownloadStarted = false;
  bool isDownloadFinished = false;
  late Dio dio;
  late DateTime lastProgressUpdate;
  double downloadSpeed = 0.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dio = Dio();
    lastProgressUpdate = DateTime.now();
    downloadFile(widget.dm.url);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        downloadFile(widget.dm.url);
      },
      minLeadingWidth: 0.1 * getWidth(context),
      tileColor: Colors.white,
      leading: const Icon(Icons.file_copy),
      trailing: isDownloadFinished
          ? const Icon(Icons.download_done)
          : !isDownloadStarted
              ? InkWell(
                  onTap: () {
                    // downloadFile();
                  },
                  child: const Icon(Icons.download))
              : isDownloadStarted
                  ? CircularPercentIndicator(
                      radius: 25,
                      lineWidth: 3,
                      percent: (downloadProgress.toDouble()),
                      center: Text(
                        "${downloadProgress * 100}%",
                        style:
                            const TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    )
                  : Container(),
      title: CustomHeadingTitle(
        textString: widget.dm.url,
        maxlines: 3,
        textSize: 14,
        textAlign: TextAlign.start,
      ),
      subtitle: Row(
        children: [
          Row(
            children: [
              const Icon(
                Icons.speed,
                size: 12,
              ),
              CustomHeadingTitle(
                textString:
                    "${(downloadSpeed / 10000000).toStringAsFixed(2)}MB/s",
                textSize: 12,
                textWeight: FontWeight.w400,
              )
            ],
          ),
          SizedBox(
            width: h10(context),
          ),
          const Row(
            children: [
              // Icon(
              //   Icons.downloading,
              //   size: 12,
              // ),
              // CustomHeadingTitle(
              //   textString: " 10 / 34 mb",
              //   textSize: 12,
              //   textWeight: FontWeight.w400,
              // )
            ],
          ),
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }

  void downloadFile(String url) async {
    print('object');
    bool hasPermission = await _requestWritePermission();
    // if (!hasPermission) return;
    isDownloadStarted = true;
    isDownloadFinished = false;
    downloadProgress = 0;
    String fileName = DateTime.now().toString();
    final currentTime = DateTime.now();
    final elapsedTime =
        currentTime.difference(lastProgressUpdate).inMilliseconds;
    // downloads the file
    Dio dio = Dio();
    var mainDir;
    if (Platform.isAndroid) {
      var externalDir = await getExternalStorageDirectory();
      mainDir = externalDir;
    } else if (Platform.isIOS) {
      var dir = await getApplicationDocumentsDirectory();
      mainDir = dir;
    }
    // print(dir.path);
    await dio.download(url, "${mainDir.path}/$fileName");
    setState(() {});
    await dio.download(
      url,
      "${mainDir.path}/$fileName",
      onReceiveProgress: (received, total) async {
        if (total != -1) {
          setState(() {
            double res = received / total;
            downloadProgress = int.parse(res.toStringAsFixed(0));
            downloadSpeed = (received / elapsedTime) *
                1000; // Calculate download speed in bytes per second
            lastProgressUpdate = currentTime;
          });
        } else {
          await DownloadManagerDatabase.updateStatusToDownloaded(
              widget.dm.id as int);
        }
      },
    );
    await OpenFile.open("${mainDir.path}/$fileName");
  }

  // requests storage permission
  Future<bool> _requestWritePermission() async {
    await Permission.storage.request();
    return await Permission.storage.request().isGranted;
  }
}
