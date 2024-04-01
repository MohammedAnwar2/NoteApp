import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppppppp/components/auth_widget/AwesomeDialog.dart';
import 'package:ppppppp/core/API/RequestApi.dart';
import 'package:ppppppp/core/controllers/FirebaseFireStorage.dart';
import 'package:ppppppp/core/controllers/notificationController.dart';
import 'package:ppppppp/screens/chatPage.dart';

import 'core/services/services.dart';

//FireStorageController
class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  void getToken() async {
    var token = await FirebaseMessaging.instance.getToken();
    print("--------------------------");
    print(token);
    print("-------------------------");
  }

  void myPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else
    if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  Future<void> setupInteractedMessage() async {
    RemoteMessage? initialMessage = await FirebaseMessaging.instance
        .getInitialMessage();
    if (initialMessage != null) {
      if (initialMessage.data["type"] == "chat") {
        Get.to(() => ChatPage());
      }
    }
  }

/*  initialization()async{

    if(SettingServices.instance.sharedPreferences?.getBool("q")==null)
    {
      print("-------------a--------------");
      SettingServices.instance.sharedPreferences?.setBool("q", true);
      //write(key: "a",isLogin: true);
      print("----------------------------");
    }
    else{
      print("-------------hhhhhhhhhhh--------------");
      print("--------yes yes----->>>>>>> ${SettingServices.instance.sharedPreferences?.getBool("q")}");
      print("----------------------------");
    }
  }*/

  @override
  void initState() {
    NotificationController.instance.initNotifications();
    //  StorageService.instance.initNotifications();
    //initialization();
    super.initState();
    // SettingServices.instance.write(key: "b",isLogin: true);
    //  print("${SettingServices.instance.read(key: "b")??""}");
    setupInteractedMessage();
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage event) {
      if (event.data["type"] == "chat") {
        Get.to(() => ChatPage());
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        print("--------------onMessage--------------------");
        print(message.notification!.title.toString());
        print(message.notification!.body.toString());
        print(message.data);
        print("---------------onMessage-------------------");
        Get.snackbar(message.notification!.title.toString(),
            message.notification!.body.toString());
      }
    });
    myPermission();
    getToken();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image'),
      ),
      body: ListView(
        children: [
          GetBuilder<NotificationController>(builder: (logic) {
            return Checkbox(
              value: NotificationController.instance.getIsSelected,
              onChanged: (value) {
                NotificationController.instance.setIsSelected = value!;
              },);
          }),

          ElevatedButton(onPressed: () async {
            print("------------->>>>>>> ${StorageService.instance.read("t")}");
            await RequestNotificationsTopic(
                title: "See the Error", body: "Mohammed Anwar", topic: 'b');
          }, child: const Text("Send Notification")),
        ],
      ),
    );
  }

}
