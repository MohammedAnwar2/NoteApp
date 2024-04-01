import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ppppppp/components/DIALOG.dart';
import 'package:ppppppp/core/controllers/firebaseFirestore/categories/categoryController.dart';
import 'package:ppppppp/core/controllers/firebaseFirestore/notes/notesController.dart';
import 'package:ppppppp/routes/AppRoutes.dart';
import 'package:ppppppp/screens/crud/categories/SelectDeleteOrEdit.dart';

class EntryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoute.AddCategory);
          },
          child: Icon(Icons.add)),
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
              onPressed: () async {
                ShowLoading(context);
                await FirebaseAuth.instance.signOut();
                await GoogleSignIn().signOut();
                Get.offAllNamed(AppRoute.SingIn);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("category")
              .where("uid", isEqualTo: FirebaseAuth.instance.currentUser?.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 10.w),
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onLongPress: () {
                      CategoryController.instance.setSnapshot = snapshot;
                      CategoryController.instance.setIndex = index;
                      SelectDeleteUpdateCategory(context: context).show();
                    },
                    onTap: () {
                      CategoryController.instance.setSnapshot = snapshot;
                      CategoryController.instance.setIndex = index;
                      Get.toNamed(AppRoute.NotePage);
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/file.png",
                            height: 70.h,
                          ),
                          Text(
                            "${snapshot.data?.docs[index]["category"]}",
                            style: GoogleFonts.aBeeZee(
                                color: Colors.black, fontSize: 13.sp),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
//snapshot.data!.docs[index]["title"]

/**/