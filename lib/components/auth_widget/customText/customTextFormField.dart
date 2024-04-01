import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField({super.key, this.hintText, required this.controller, required this.valid, this.oldName,});
  final hintText;
  final TextEditingController controller;
  final String? Function(String?) valid;
  final oldName;
  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}
class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 10.h),
      child: TextFormField(
        style: GoogleFonts.aBeeZee(color: Colors.blueAccent),
      controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.hintText.toString(),
            hintStyle: TextStyle(fontSize: 14.sp),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.r),
                borderSide: const BorderSide(color: Colors.transparent)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.r),
                borderSide: const BorderSide(color: Colors.transparent)),
            filled: true,
            fillColor: Colors.grey.withOpacity(0.1)),
        validator:widget.valid,
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    widget.oldName!=null?widget.controller.text=widget.oldName:null;
  }
}
