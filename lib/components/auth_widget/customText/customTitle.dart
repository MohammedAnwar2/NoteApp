import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextTitl extends StatelessWidget {
  TextTitl({super.key, this.text});
final text;
  @override
  Widget build(BuildContext context) {
    return Text(text,style: GoogleFonts.aBeeZee(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 22.sp));
  }
}
