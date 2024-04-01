import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppppppp/core/services/services.dart';

class NotificationController extends GetxController {
  static NotificationController instance = Get.find();

  bool isSelected=true;

  set setIsSelected(bool selected){
    StorageService.instance.write("notifySelected",selected);
    isSelected=selected;
    checkTheStatus();
    update();
  }

  get getIsSelected{
    if(StorageService.instance.read("notifySelected")==null) {
      isSelected=true;
      update();
      return isSelected;
    }
    else{
      setIsSelected=StorageService.instance.read("notifySelected");
      update();
      return isSelected;
    }
  }

  checkTheStatus()async{
    if(isSelected==true)
    {
      await FirebaseMessaging.instance.subscribeToTopic('b');
    }else{
      await FirebaseMessaging.instance.unsubscribeFromTopic('b');
    }
  }

//put it in the first page that will open in project ,,, do not put in the "onInit" of GetXController or GetXServer something will be wrong
  initNotifications()async{
    if(StorageService.instance.read("notifyWork1")==null) {
      await FirebaseMessaging.instance.subscribeToTopic('b');
      StorageService.instance.write("notifyWork1", true);
    }
  }

}