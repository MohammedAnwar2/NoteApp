import 'dart:io';
import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:path/path.dart';
class FireStorageController extends GetxController {
  static FireStorageController instance = Get.find();
  File?file;
  String ?url;

  RxBool isSelectedImage = false.obs;

  set isSelected(bool isSelect){
    isSelectedImage.value=isSelect;
  }

  Future<File?> crooImage({required File imageFile}) async {
    CroppedFile? croppedImage =
    await ImageCropper().cropImage(sourcePath: imageFile.path,aspectRatioPresets: [
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio16x9
    ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Photo',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  void getImageFromGallery() async{
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if(image!=null) {
      File? crooingImage =File(image.path);
      crooingImage = await crooImage(imageFile: crooingImage);
      if(crooingImage!=null) {
        file=File(crooingImage.path);
        uploadeGalleryImageToFireStorage(image: image,file: file!);
        //--------------------- option ---------------
        FireStorageController.instance.isSelected=true;
      }
    }
    update();
  }

  void getImageFromCamera() async{
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.camera);
      if(image!=null) {
       File? crooingImage =File(image.path);
       crooingImage = await crooImage(imageFile: crooingImage);
       if(crooingImage!=null) {
         file=File(crooingImage.path);
         uploadeCameraImageToFireStorage(image: image,file: file!);
         //--------------------- option ---------------
         FireStorageController.instance.isSelected=true;
       }
      }
      update();
  }

  uploadeGalleryImageToFireStorage({required XFile image,required File file})async{
    //var ref = FirebaseStorage.instance.ref();
    int random = Random().nextInt(100000000);
    var nameImage = "$random${basename(image.path)}";
    var ref = FirebaseStorage.instance.ref().child("Gallery").child(nameImage);
    await ref.putFile(file);
    //String url = await ref.getDownloadURL();
    url = await ref.getDownloadURL();
  }
  uploadeCameraImageToFireStorage({required XFile image,required File file})async{
    //var ref = FirebaseStorage.instance.ref();
    int random = Random().nextInt(100000000);
    var nameImage = "$random${basename(image.path)}";
    var ref = FirebaseStorage.instance.ref().child("camera").child(nameImage);
    await ref.putFile(file);
    //String url = await ref.getDownloadURL();
     url = await ref.getDownloadURL();
  }

}