import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppppppp/core/controllers/firebaseFirestore/categories/categoryController.dart';
import 'package:ppppppp/core/controllers/firebaseFirestore/notes/notesController.dart';
import 'package:ppppppp/routes/AppRoutes.dart';
import 'package:ppppppp/screens/crud/categories/updateCategory.dart';


AwesomeDialog SelectDeleteUpdatNote({required BuildContext context}){
  return AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      animType: AnimType.topSlide,
      title: '',
      titleTextStyle: GoogleFonts.aBeeZee(color: Colors.black),
      descTextStyle: GoogleFonts.aBeeZee(color: Colors.black),
      desc: "Select on of them",
      btnCancelOnPress: () {
        FirebaseFirestore.instance.collection("category").doc(CategoryController.instance.getSnapshot.data!.docs[CategoryController.instance.getIndex].id).collection("note").doc(NoteController.instance.getSnapshot.data!.docs[NoteController.instance.getIndex].id).delete();
        NoteController.instance.getImage.toString()!="none"?FirebaseStorage.instance.refFromURL(NoteController.instance.getImage.toString()).delete():null;
      },
      btnCancelText: "delete",
      btnOkOnPress: () {
        Get.toNamed(AppRoute.UpdateNote);
      },
      btnOkText: "edit"
  );
}
/*                                .show();*/