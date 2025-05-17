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
        actions: [
          IconButton(
            icon: Icon(Icons.add_a_photo),
            onPressed: takePhoto, 
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: photos.isEmpty
            ? Center(
                child: Text(
                  "Henüz fotoğraf yüklemediniz.",
                  style: TextStyle(color: TColor.gray, fontSize: 16),
                ),
              )
            : GridView.builder(
                itemCount: photos.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.8, 
                ),
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.file(
                      photos[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColor.primaryColor1,
        onPressed: addPhoto,
        child: Icon(Icons.add),
        tooltip: "Fotoğraf Yükle",
      ),
    );
  }
}