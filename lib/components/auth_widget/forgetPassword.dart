import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppppppp/core/controllers/auth/logingController.dart';

void forgetPassword(BuildContext context) async{
  if(LoginController.instance.email.text=="")
  {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType:AnimType.topSlide ,
      title: 'Error',
      titleTextStyle: GoogleFonts.aBeeZee(color: Colors.black),
      descTextStyle: GoogleFonts.aBeeZee(color: Colors.black),
      desc: "ادخل الايميل ثم حاول مره اخرى",
    ).show();
  }
  else{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: LoginController.instance.email.text);
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType:AnimType.topSlide ,
        title: 'Error',
        titleTextStyle: GoogleFonts.aBeeZee(color: Colors.black),
        descTextStyle: GoogleFonts.aBeeZee(color: Colors.black),
        desc: "لقد تم ارسال لينك التحقق من البريد , الرحاء التوجه الى الايميل و لتغير كلمة المرور",
      ).show();
    }catch(e){
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType:AnimType.topSlide ,
        title: 'Error',
        titleTextStyle: GoogleFonts.aBeeZee(color: Colors.black),
        descTextStyle: GoogleFonts.aBeeZee(color: Colors.black),
        desc: "الرجاء التأكد من البريد الألكتروني والمحاوله مره اخرى",
      ).show();
    }
  }
}