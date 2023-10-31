import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppppppp/core/controllers/firebaseFirestore/categories/categoryController.dart';
import 'package:ppppppp/screens/crud/categories/updateCategory.dart';


// ignore: non_constant_identifier_names
AwesomeDialog SelectDeleteUpdateCategory({required BuildContext context }){
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.info,
    animType: AnimType.topSlide,
    title: '',
    titleTextStyle: GoogleFonts.aBeeZee(color: Colors.black),
    descTextStyle: GoogleFonts.aBeeZee(color: Colors.black),
    desc: "Select on of them",
    btnCancelOnPress: () {
      FirebaseFirestore.instance.collection("category").doc(CategoryController.instance.getSnapshot.data!.docs[CategoryController.instance.getIndex].id).delete();
    },
    btnCancelText: "delete",
    btnOkOnPress: () {
      Get.to(()=>UpdateCategory());
    },
    btnOkText: "edit"
  );
}
