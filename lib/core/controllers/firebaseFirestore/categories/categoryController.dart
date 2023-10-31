import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController instance = Get.find();

  late AsyncSnapshot snapshot;
  late int index;

  set setSnapshot(AsyncSnapshot newSnapshot){
    snapshot=newSnapshot;
    update();
  }
  set setIndex(int index){
    this.index=index;
    update();
  }

  get getSnapshot=>snapshot;
  get getIndex=>index;

}