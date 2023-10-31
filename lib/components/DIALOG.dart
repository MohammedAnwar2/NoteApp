import 'package:flutter/material.dart';
import 'package:get/get.dart';
ShowLoading(context){
  return showDialog(context: context, builder: (context) {
    return AlertDialog(
      content: Container(width: Get.width*0.4,height: Get.height*.16,child: Center(child: CircularProgressIndicator())),
    );
  },);
}
