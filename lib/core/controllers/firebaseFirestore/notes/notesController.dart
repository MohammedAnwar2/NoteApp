import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NoteController extends GetxController {
  static NoteController instance = Get.find();
   late AsyncSnapshot snapshot;
   late int index;
   late String title;
   late String note;
   late String image;
   set setSnapshot(AsyncSnapshot newSnapshot){
     snapshot=newSnapshot;
     update();
   }
   set setIndex(int index){
     this.index=index;
     update();
   }
   set setTitle(String title){
     this.title=title;
     update();
   }
   set setNote(String note){
     this.note=note;
     update();
   }
   set setImage(String image){
     this.image=image;
     update();
   }
   get getSnapshot=>snapshot;
   get getIndex=>index;
   get getTitle=>title;
   get getNote=>note;
   get getImage=>image;
}