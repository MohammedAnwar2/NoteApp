import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
   CustomButton({super.key,required this.text,required this.onTap});
final text;
Callback onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 13.h),
              backgroundColor: Colors.blue),
          child: Text(text,
              style: GoogleFonts.aBeeZee(
                  color: Colors.white, fontSize: 15.sp)),
        ));
  }
}
