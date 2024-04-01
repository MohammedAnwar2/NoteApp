import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppppppp/components/DIALOG.dart';
import 'package:ppppppp/components/auth_widget/customText/customTextFormField.dart';
import 'package:ppppppp/components/customButtonToUploadeImage.dart';
import 'package:ppppppp/core/controllers/FirebaseFireStorage.dart';
import 'package:ppppppp/core/controllers/firebaseFirestore/categories/categoryController.dart';
import 'package:ppppppp/routes/AppRoutes.dart';
import 'package:ppppppp/screens/crud/notes/NotesAppPage.dart';

class AddNote extends StatelessWidget {
  AddNote({super.key});
  GlobalKey<FormState> FormKey = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  TextEditingController note = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
      ),
      body: ListView(children: [
        Form(
          key: FormKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomFormField(
                  controller: title,
                  hintText: "Enter the Title",
                  valid: (value) {
                    if (value!.isEmpty) {
                      return "Can't be Empty";
                    } else if (value.length <= 2) {
                      return "Can't be less than 2";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(height: 50.h,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomFormField(
                  controller: note,
                  hintText: "Enter the note",
                  valid: (value) {
                    if (value!.isEmpty) {
                      return "Can't be Empty";
                    } else if (value.length <= 2) {
                      return "Can't be less than 2";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 60),
          child: ElevatedButton(
              onPressed: () {
                if(FormKey.currentState!.validate())
                {
                    ShowLoading(context);
                  try{
                    FirebaseFirestore.instance.collection("category").doc(CategoryController.instance.getSnapshot.data!.docs[CategoryController.instance.getIndex].id).collection("note").add({
                      "title": title.text,
                      "note": note.text,
                      "image": FireStorageController.instance.url??"none",
                    });
                    Get.offAndToNamed(AppRoute.NotePage);
                    //Get.back();
                  }catch(e){
                    print("error");
                  }
                }else{
                  print("not valid");
                }
              },
              child: Text(
                "Add",
                style: GoogleFonts.aBeeZee(
                    color: Colors.black, fontSize: 14.sp),
              )),
        ),
        Padding(
           padding: const EdgeInsets.symmetric(horizontal: 60),
          child: CustomButtonUploade(title: "Uploade Image",onPress: () {
            showModalBottomSheet(context: context, builder: (context) {
              return Container(height: 150.h,color: Colors.blue,child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Image",style: GoogleFonts.aBeeZee(fontSize: 35.sp,)),
                    SizedBox(height: 20.h),
                    InkWell(child: Row(children: [
                      const Icon(Icons.image,),SizedBox(width: 10.w,),Text("Gallery",style: GoogleFonts.aBeeZee(fontSize: 25.sp,))
                    ]),onTap: () =>FireStorageController.instance.getImageFromGallery() ,),
                    SizedBox(height: 10.h),
                    InkWell(child: Row(children: [
                      const Icon(Icons.camera_alt,),SizedBox(width: 10.w,),Text("Camera",style: GoogleFonts.aBeeZee(fontSize: 25.sp,))
                    ]),onTap: () =>FireStorageController.instance.getImageFromCamera() ,)
              ]),);
            },);
          },),
        )

      ]),
    );
  }
}
