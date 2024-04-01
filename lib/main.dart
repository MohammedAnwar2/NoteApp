import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ppppppp/core/binding/Appbinding.dart';
import 'package:ppppppp/core/services/services.dart';
import 'package:ppppppp/routes/AppRoutes.dart';
import 'package:ppppppp/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';

SharedPreferences? sp;
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("--------------onBackgroundMessage--------------------");
  print(message.notification!.title.toString());
  print(message.notification!.body.toString());
  print(message.data);
  print("---------------onBackgroundMessage-------------------");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Get.putAsync(() => StorageService().init());
  sp = await SharedPreferences.getInstance();
  AppBinding().dependencies();
  // await Get.putAsync(() async => SettingServices().init());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(NoteAPP());
}

class NoteAPP extends StatefulWidget {
  const NoteAPP({Key? key}) : super(key: key);

  @override
  State<NoteAPP> createState() => _NoteAPPState();
}

class _NoteAPPState extends State<NoteAPP> {
  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            useMaterial3: true,
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: child,
          initialBinding: AppBinding(),
          //initialRoute:(FirebaseAuth.instance.currentUser != null&&FirebaseAuth.instance.currentUser!.emailVerified)? AppRoute.EntryPage:AppRoute.SingIn,
          initialRoute: AppRoute.SingIn,
          getPages: route,
        );
      },
      //child: SplashScreen(),
    );
  }

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }
}
