import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppppppp/components/DIALOG.dart';
import 'package:ppppppp/components/auth_widget/customText/customTextFormField.dart';
import 'package:ppppppp/core/controllers/firebaseFirestore/categories/categoryController.dart';
import 'package:ppppppp/routes/AppRoutes.dart';

// ignore: must_be_immutable
class UpdateCategory extends StatelessWidget {
  UpdateCategory({super.key});
  GlobalKey<FormState> FormKey = GlobalKey<FormState>();
  TextEditingController category = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Category'),
      ),
      body: ListView(children: [
        Form(
          key: FormKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomFormField(
                  oldName: CategoryController.instance.getSnapshot.data!
                      .docs[CategoryController.instance.getIndex]["category"]
                      .toString(),
                  controller: category,
                  hintText: CategoryController.instance.getSnapshot.data!
                      .docs[CategoryController.instance.getIndex]["category"]
                      .toString(),
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
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
          child: ElevatedButton(
              onPressed: () {
                if (FormKey.currentState!.validate()) {
                  try {
                    ShowLoading(context);
                    FirebaseFirestore.instance
                        .collection("category")
                        .doc(CategoryController.instance.getSnapshot.data!
                            .docs[CategoryController.instance.getIndex].id)
                        .update({"category": category.text});
                    Get.offAllNamed(AppRoute.EntryPage);
                  } catch (e) {
                    print("error");
                  }
                } else {
                  print("not valid");
                }
              },
              child: Text(
                "Save",
                style:
                    GoogleFonts.aBeeZee(color: Colors.black, fontSize: 14.sp),
              )),
        )
      ]),
    );
  }
}
