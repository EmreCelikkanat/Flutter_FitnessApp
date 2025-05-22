import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fitness_app/common/colo_extension.dart';

class CameraViewPage extends StatefulWidget {
  const CameraViewPage({super.key});

  @override
  State<CameraViewPage> createState() => _CameraViewPageState();
}

class _CameraViewPageState extends State<CameraViewPage> {
   List<File> photos = [];
   List<String> assetPhotos = [
     "assets/img/emirozturkrealvucut.png",
     "assets/img/atletli.png",
      "assets/img/kollarbagli.png",
      "assets/img/gerçeksamet.png",
      "assets/img/gerçekben.png",
      "assets/img/side-view-muscly-athletic-man-holding-weights.jpg",
   ];

  Future<void> addPhoto() async {
    var picker = ImagePicker();
     XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery); 
    if (pickedFile != null) {
      setState(() {
        photos.add(File(pickedFile.path));
      });
    }
  }

  Future<void> takePhoto() async {
    var picker = ImagePicker();
     XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        photos.add(File(pickedFile.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      appBar: AppBar(
        title: Text("Fotoğraf Galerim"),
        backgroundColor: TColor.primaryColor1,
        automaticallyImplyLeading: false, 
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: assetPhotos.isEmpty
            ? Center(
                child: Text(
                  "Henüz fotoğraf yok.",
                  style: TextStyle(color: TColor.gray, fontSize: 16),
                ),
              )
            : GridView.builder(
                itemCount: assetPhotos.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.8, 
                ),
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      assetPhotos[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColor.primaryColor1,
        onPressed: addPhoto,
        tooltip: "Fotoğraf Yükle",
        child: Icon(Icons.add),
      ),
    );
  }
}