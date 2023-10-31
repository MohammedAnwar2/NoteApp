import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ppppppp/core/controllers/FirebaseFireStorage.dart';

//FireStorageController
class TestPage extends StatelessWidget {
  TestPage({super.key});

  File?file;

  image() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    file = File(image!.path);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image'),
      ),
      body: ListView(
        children: [
          GetBuilder<FireStorageController>(builder: (logic) {
            return Column(children: [

              FireStorageController.instance.file != null ? Image.file(
                  FireStorageController.instance.file!) : Container(),
              ElevatedButton(onPressed: ()async {
                // await image();
                FireStorageController.instance.getImageFromCamera();
              }, child: Text("Add photo"))
            ],);
          })
        ],
      ),
    );
  }
}
