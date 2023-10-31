import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:ppppppp/core/controllers/FirebaseFireStorage.dart';

class CustomButtonUploade extends StatelessWidget {
  CustomButtonUploade(
      {super.key, required this.title, required this.onPress});

  final title;
  Callback onPress;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return MaterialButton(
          height: 40.h,
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none),
          //   minWidth: 100.w,
          onPressed: onPress,
          child: const Text("Uploade Image"),
          color: FireStorageController.instance.isSelectedImage.value? Colors.green : Colors.red
      );
    });
  }
}
