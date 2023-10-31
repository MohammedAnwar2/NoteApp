import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppppppp/components/DIALOG.dart';
import 'package:ppppppp/components/auth_widget/customText/customTextFormField.dart';
import 'package:ppppppp/routes/AppRoutes.dart';

class AddCategory extends StatelessWidget {
  AddCategory({super.key});

  GlobalKey<FormState> FormKey = GlobalKey<FormState>();
  TextEditingController category = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Category'),
      ),
      body: ListView(children: [
        Form(
          key: FormKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomFormField(
                  controller: category,
                  hintText: "Enter the Category",
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
                  try{
                    ShowLoading(context);
                    FirebaseFirestore.instance.collection("category").add({
                      "category": category.text,
                      "uid":FirebaseAuth.instance.currentUser?.uid
                    });
                    Get.offAllNamed(AppRoute.EntryPage);
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
        )

      ]),
    );
  }
}
