import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppppppp/core/controllers/firebaseFirestore/notes/notesController.dart';

class ViewNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Note'),
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(children: [
                NoteController.instance.getImage.toString()!="none"?Image.network(NoteController.instance.getImage.toString()):Container(),
                Text(NoteController.instance.getTitle.toString(),style:GoogleFonts.aBeeZee(color: Colors.black,fontSize: 20)),
                SizedBox(height: 30.h),
                Text(NoteController.instance.getNote.toString(),style:GoogleFonts.aBeeZee(color: Colors.black,fontSize: 17)),
              ],),
            )
          ],
        ),
      ),
    );
  }
}
