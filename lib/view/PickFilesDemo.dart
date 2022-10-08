import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';

class PickFilesDemo extends StatefulWidget {
  const PickFilesDemo({Key? key}) : super(key: key);

  @override
  State<PickFilesDemo> createState() => _PickFilesDemoState();
}

class _PickFilesDemoState extends State<PickFilesDemo> {
  ImagePicker picker = ImagePicker();

  List<XFile>? imageFileList = [];

  void selectImages() async {
    imageFileList!.clear();
    final selectedImages = await picker.pickMultiImage();

    if (selectedImages != null) {
      setState(() {
        imageFileList = selectedImages;
      });
    }
  }

  // Future<List<String?>> pickFile() async {
  //   final result = await FilePicker.platform.pickFiles(allowMultiple: true);
  //
  //   return result == null ? <String>[] : result.paths;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/images/9.jpg",
            ),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            imageFileList!.length == 1
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      1,
                      (index) => Container(
                        height: 150,
                        width: 150,
                        child: Image.file(
                          File(imageFileList![index].path),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: imageFileList!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                        itemBuilder: (BuildContext context, int index) {
                          return Image.file(File(imageFileList![index].path),
                              fit: BoxFit.cover);
                        }),
                  ),
            SizedBox(
              height: 30,
            ),
            FadeInLeft(
              child: Bounce(
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.black,
                  onPressed: () {
                    selectImages();
                  },
                  child: Text(
                    "Pick Images",
                    style: TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            FadeInRight(
              child: ElasticIn(
                child: MaterialButton(
                  color: Colors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  onPressed: () async {
                    // final files = await pickFile();
                    List<String> files = [];
                    if (imageFileList != null) {
                      for (int i = 0; i < imageFileList!.length; i++) {
                        files.add(imageFileList![i].path);
                      }
                    }

                    if (files.isNotEmpty) {
                      Share.shareFiles(files, text: 'Great picture');

                      // Share.shareFiles(files);
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.share),
                      SizedBox(width: 8),
                      Text(
                        "Share",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
