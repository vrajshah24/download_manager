import 'package:download_manager/Global%20Components/colors.dart';
import 'package:download_manager/Global%20Components/responsive.dart';
import 'package:download_manager/Widgets/custom_button.dart';
import 'package:download_manager/Widgets/custom_heading.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                      onPress: () {},
                      vPadding: v10(context),
                      btntext: "Download File",
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
      body: SingleChildScrollView(
        child: Container(
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
                    textString: "Welcome, Vraj",
                    textSize: 28,
                    textColor: Colors.black.withOpacity(0.7),
                    textWeight: FontWeight.bold,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: const Icon(
                      Icons.camera_alt,
                      size: 30,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
              sizedBox20(context),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomHeadingTitle(
                    textString: "Queue (0)",
                    textSize: 16,
                    textColor: Colors.grey,
                  ),
                ],
              ),
              sizedBox20(context),
              ListView.separated(
                shrinkWrap: true,
                itemCount: 5,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return const DownloadListTile();
                },
                separatorBuilder: (context, index) {
                  return sizedBox10(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class mainShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = new Path();
    path.lineTo(0, size.height - 60);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height - 60);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class DownloadListTile extends StatefulWidget {
  const DownloadListTile({super.key});

  @override
  State<DownloadListTile> createState() => _DownloadListTileState();
}

class _DownloadListTileState extends State<DownloadListTile> {
  int downloadProgress = 0;
  bool isDownloadStarted = false;
  bool isDownloadFinished = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 0.1 * getWidth(context),
      tileColor: Colors.white,
      leading: const Icon(Icons.file_copy),
      trailing: isDownloadFinished
          ? const Icon(Icons.download_done)
          : !isDownloadStarted
              ? InkWell(
                  onTap: () {
                    downloadFile();
                  },
                  child: const Icon(Icons.download))
              : isDownloadStarted
                  ? CircularPercentIndicator(
                      radius: 20,
                      lineWidth: 3,
                      percent: (downloadProgress / 100),
                      center: Text(
                        "$downloadProgress%",
                        style:
                            const TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    )
                  : Container(),
      title: const CustomHeadingTitle(
        textString: "FileName.zip",
        textSize: 16,
        textAlign: TextAlign.start,
      ),
      subtitle: Row(
        children: [
          const Row(
            children: [
              Icon(
                Icons.speed,
                size: 12,
              ),
              CustomHeadingTitle(
                textString: " 235.45 kbps",
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
              Icon(
                Icons.downloading,
                size: 12,
              ),
              CustomHeadingTitle(
                textString: " 12 / 34 mb",
                textSize: 12,
                textWeight: FontWeight.w400,
              )
            ],
          ),
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }

  void downloadFile() async {
    isDownloadStarted = true;
    isDownloadFinished = false;
    downloadProgress = 0;
    setState(() {});

    // Download Logic
    while (downloadProgress < 100) {
      downloadProgress += 10;
      setState(() {});
      // if download is finished then make isDownload finished true
      if (downloadProgress == 100) {
        isDownloadFinished = true;
        isDownloadStarted = false;
        setState(() {});
        break;
      }
      await Future.delayed(const Duration(milliseconds: 500));
    }
  }
}
