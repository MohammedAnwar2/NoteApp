import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSmallText extends StatelessWidget {
   CustomSmallText({super.key, this.text});
final text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 20),
      child: Text(text,
          style: GoogleFonts.aBeeZee(
              color: Colors.black,
              fontSize: 15.sp,
              fontWeight: FontWeight.bold)),
    );
  }
}
