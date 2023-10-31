import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppppppp/components/auth_widget/AwesomeDialog.dart';
import 'package:ppppppp/routes/AppRoutes.dart';

class SiginUpController extends GetxController {
  static SiginUpController instance = Get.find();

  late TextEditingController username ;
  late TextEditingController email ;
  late TextEditingController password ;

  siginUp(BuildContext context)async
  {
  try {
     await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email:email.text,
        password: password.text,
      );
      Get.snackbar("Check your email to allow going to home page.", "",dismissDirection:DismissDirection.horizontal,duration: Duration(seconds: 5)) ;
      FirebaseAuth.instance.currentUser!.sendEmailVerification();
      Get.offAllNamed(AppRoute.SingIn);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        CustomAwesomeDialog(context: context,text:"The password provided is too weak.",animType: AnimType.topSlide ).show();
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        CustomAwesomeDialog(context: context,text:"The account already exists for that email.",animType: AnimType.topSlide ).show();
        print('The account already exists for that email.');
      }
    } catch (e) {
      //CustomAwesomeDialog(context: context,text:e.toString(),animType: AnimType.topSlide ).show();
      print(e);
    }
  }
  checkValidation({required GlobalKey<FormState> FormKey,required BuildContext context})
  {
    if(FormKey.currentState!.validate())
    {
      siginUp(context);
        print("valid");
    }else{
        print("not valid");
    }
  }
  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }
  @override
  void onClose() {
    username.dispose();
    email.dispose();
    password.dispose();
    super.onClose();
  }
}