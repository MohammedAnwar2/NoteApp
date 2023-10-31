import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppppppp/components/DIALOG.dart';
import 'package:ppppppp/components/auth_widget/customButton.dart';
import 'package:ppppppp/components/auth_widget/customText/customTextFormField.dart';
import 'package:ppppppp/components/auth_widget/customText/customTitle.dart';
import 'package:ppppppp/components/auth_widget/customText/smallCusomtText.dart';
import 'package:ppppppp/components/auth_widget/forgetPassword.dart';
import 'package:ppppppp/core/controllers/auth/logingController.dart';
import 'package:ppppppp/core/controllers/auth/validations.dart';
import 'package:ppppppp/routes/AppRoutes.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> FormKey = GlobalKey<FormState>();


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
                  Center(
                    child: Container(
                      margin: EdgeInsetsDirectional.only(top: 50.h),
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
                  TextTitl(text: "Loging"),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text("Login to Continue using tge app",
                      style: GoogleFonts.aBeeZee(
                          color: Colors.black.withOpacity(0.5), fontSize: 15.sp)),
                  CustomSmallText(text: "Email"),
                  CustomFormField(hintText: "Enter your email", controller: LoginController.instance.email,valid: (vla) {
                    return validInput(value: vla.toString(),max: 70,min: 5,type: "email");
                  },),
                  CustomSmallText(text: "Password"),
                  CustomFormField(hintText: "Enter your password", controller: LoginController.instance.password,valid: (vla) {
                   return validInput(value: vla.toString(),max: 20,min: 5,type: "password");
                  },),
                  SizedBox(
                    height: 10.h,
                  ),
                  InkWell(
                    onTap: () async{
                       forgetPassword(context);
                    },
                    child: Container(
                        width: double.infinity,
                        alignment: Alignment.centerRight,
                        child: Text("Forget Password ?",
                            style: GoogleFonts.aBeeZee(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold))),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
            CustomButton(text: "Login",onTap: (){
              LoginController.instance.checkValidation(FormKey: FormKey, context: context);
            },),
            SizedBox(
              height: 10.h,
            ),
            Center(
              child: Text("Or Login with",style: GoogleFonts.aBeeZee(color: Colors.black),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomButton(text: "Google",onTap: () {
            //  signInWithGoogle(context);
              LoginController.instance.loginByGoogle(context);
            },),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
              onTap: () {
                Get.toNamed(AppRoute.SiginUp);
              },
              child: Center(
                child: Text.rich(TextSpan(children: [
                  TextSpan(text: 'Don\'t have an account? ',style: GoogleFonts.aBeeZee(color: Colors.black)),
                  TextSpan(text: 'Register',style: GoogleFonts.aBeeZee(color: Colors.blue,),onEnter: (event) {Get.toNamed(AppRoute.SiginUp);},),
                ])),
              ),
            )
          ],
        ),
      ),
    );
  }
}
