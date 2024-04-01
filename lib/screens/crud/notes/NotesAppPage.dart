import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ppppppp/components/DIALOG.dart';
import 'package:ppppppp/core/controllers/FirebaseFireStorage.dart';
import 'package:ppppppp/core/controllers/firebaseFirestore/categories/categoryController.dart';
import 'package:ppppppp/core/controllers/firebaseFirestore/notes/notesController.dart';
import 'package:ppppppp/routes/AppRoutes.dart';
import 'package:ppppppp/screens/crud/notes/SelectDeleteOrEdit.dart';


class NotePage extends StatelessWidget {
  const NotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        FireStorageController.instance.isSelected=false;
        Get.offNamed(AppRoute.AddNote);
      },child: Icon(Icons.add)),
      appBar: AppBar(
        title: Text(CategoryController.instance.getSnapshot.data!.docs[CategoryController.instance.getIndex]["category"].toString()),
        actions: [
          IconButton(onPressed: ()async{
            ShowLoading(context);
            await FirebaseAuth.instance.signOut();
            await GoogleSignIn().signOut();
            Get.offAllNamed(AppRoute.SingIn);
          }, icon: const Icon(Icons.logout))
        ],
      ),
      body:Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10),
        child:StreamBuilder(
          stream: FirebaseFirestore.instance.collection("category").doc(CategoryController.instance.getSnapshot.data!.docs[CategoryController.instance.getIndex].id).collection("note")
              .snapshots(),builder: (context, snapshot) {
          if(snapshot.hasData)
          {
            return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10.w),
              itemCount: snapshot.data?.docs.length ,
              itemBuilder: (context, index) {
                return  InkWell(
                  onTap: () {
                    NoteController.instance.setTitle=snapshot.data?.docs[index]["title"];
                    NoteController.instance.setNote=snapshot.data?.docs[index]["note"];
                    NoteController.instance.setImage=snapshot.data?.docs[index]["image"];
                    Get.toNamed(AppRoute.ViewNote);
                  },
                  onLongPress: () {
                    NoteController.instance.setSnapshot=snapshot;
                    NoteController.instance.setIndex=index;
                    NoteController.instance.setImage=snapshot.data?.docs[index]["image"];
                    SelectDeleteUpdatNote(context: context).show();
                  },
                  child: Card(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${snapshot.data?.docs[index]["title"]}",style: GoogleFonts.aBeeZee(color: Colors.black,fontSize: 15.sp),overflow:TextOverflow.ellipsis ),
                       SizedBox(height: 10.h),
                        Text("${snapshot.data?.docs[index]["note"]}",style: GoogleFonts.aBeeZee(color: Colors.black,fontSize: 13.sp),maxLines: 3,),
                        SizedBox(height: 10.h),
                        snapshot.data?.docs[index]["image"]!="none"?Image.network(snapshot.data?.docs[index]["image"],height: 50.h,width: 70.w,):Container()
                      ],
                    ),
                  ),),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },) ,
      )
    );
  }
}
//snapshot.data!.docs[index]["title"]

/**/