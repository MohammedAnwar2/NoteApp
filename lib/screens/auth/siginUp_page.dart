import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppppppp/components/auth_widget/AwesomeDialog.dart';
import 'package:ppppppp/components/DIALOG.dart';
import 'package:ppppppp/components/auth_widget/customButton.dart';
import 'package:ppppppp/components/auth_widget/customText/customTextFormField.dart';
import 'package:ppppppp/components/auth_widget/customText/customTitle.dart';
import 'package:ppppppp/components/auth_widget/customText/smallCusomtText.dart';
import 'package:ppppppp/core/controllers/auth/singUpController.dart';
import 'package:ppppppp/core/controllers/auth/validations.dart';
import 'package:ppppppp/routes/AppRoutes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
class SiginUp extends StatefulWidget {

  @override
  State<SiginUp> createState() => _SiginUpState();
}
GlobalKey<FormState> FormKey = GlobalKey<FormState>();
class _SiginUpState extends State<SiginUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Form(
              key: FormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Center(
                    child: Container(
                      width: 80.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.15),
                          borderRadius: BorderRadius.all(Radius.circular(70))),
                      child: Padding(
                        padding: EdgeInsets.all(17),
                        child: Image.asset(
                          "assets/flag.jpg",
                        ),
                      ),
                    ),
                  ),
                  TextTitl(text: "SignUp"),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text("Login to Continue using tge app",
                      style: GoogleFonts.aBeeZee(
                          color: Colors.black.withOpacity(0.5), fontSize: 15.sp)),

                  CustomSmallText(text: "User Name"),
                  CustomFormField(
                      hintText: "Enter your username", controller: SiginUpController.instance.username,valid: (val) {
                    return validInput(value: val.toString(),max: 50,min: 2,type: "username");

                      },),

                  CustomSmallText(text: "Email"),
                  CustomFormField(hintText: "Enter your email", controller: SiginUpController.instance.email,valid: (val) {
                    return  validInput(value: val.toString(),max: 30,min: 5,type: "email");

                  },),

                  CustomSmallText(text: "Password"),

                  CustomFormField(hintText: "Enter your password", controller: SiginUpController.instance.password,valid: (val) {
                    return validInput(value: val.toString(),max: 70,min: 5,type: "password");
                  },),

                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
            CustomButton(text: "Register",onTap: () {
              SiginUpController.instance.checkValidation(FormKey: FormKey, context: context);
            },),
            SizedBox(
              height: 20.h,
            ),
            InkWell(
              onTap: () {
                Get.offAllNamed(AppRoute.SingIn);
              },

              child: Center(
                child: Text.rich(TextSpan(children: [
                  TextSpan(text: 'Have an account? ',style: GoogleFonts.aBeeZee(color: Colors.black)),
                  TextSpan(text: 'Login',style: GoogleFonts.aBeeZee(color: Colors.blue,),onEnter: (event) {Get.toNamed(AppRoute.SiginUp);},),
                ])),
              ),
            )

          ],
        ),
      ),
    );
  }
}
