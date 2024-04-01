import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppppppp/components/DIALOG.dart';
import 'package:ppppppp/components/auth_widget/AwesomeDialog.dart';
import 'package:ppppppp/routes/AppRoutes.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  static LoginController instance = Get.find();

  late TextEditingController email;
  late TextEditingController password;

  Future loginByGoogle(BuildContext context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return;
    }
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    ShowLoading(context);
    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    Get.offAllNamed(AppRoute.EntryPage);
  }

  loginByEmailAndPassword(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: LoginController.instance.email.text,
          password: LoginController.instance.password.text);
      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        ShowLoading(context);
        Get.offAllNamed(AppRoute.EntryPage);
      } else {
        CustomAwesomeDialog(
                context: context,
                text: "Check your email to allow going to home page.",
                animType: AnimType.topSlide)
            .show();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        CustomAwesomeDialog(
                context: context,
                text: "No user found for that email.",
                animType: AnimType.topSlide)
            .show();
      } else if (e.code == 'wrong-password') {
        CustomAwesomeDialog(
                context: context,
                text: "Wrong password provided for that user.",
                animType: AnimType.topSlide)
            .show();
      } else {
        CustomAwesomeDialog(
                context: context,
                text: "Check your email and password",
                animType: AnimType.topSlide)
            .show();
      }
    } catch (e) {
      CustomAwesomeDialog(
              context: context, text: e.toString(), animType: AnimType.topSlide)
          .show();
    }
  }

  checkValidation(
      {required GlobalKey<FormState> FormKey, required BuildContext context}) {
    if (FormKey.currentState!.validate()) {
      loginByEmailAndPassword(context);
      print("valid");
    } else {
      print("not valid");
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }
}
