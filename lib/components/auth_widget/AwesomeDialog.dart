import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AwesomeDialog CustomAwesomeDialog({required BuildContext context,required String text,required AnimType animType }){
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.info,
    animType: animType,
    title: 'Error',
    titleTextStyle: GoogleFonts.aBeeZee(color: Colors.black),
    descTextStyle: GoogleFonts.aBeeZee(color: Colors.black),
    desc: text,
  );
}

