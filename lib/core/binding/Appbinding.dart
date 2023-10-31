import 'package:get/get.dart';
import 'package:ppppppp/core/controllers/FirebaseFireStorage.dart';
import 'package:ppppppp/core/controllers/auth/logingController.dart';
import 'package:ppppppp/core/controllers/auth/singUpController.dart';
import 'package:ppppppp/core/controllers/firebaseFirestore/categories/categoryController.dart';
import 'package:ppppppp/core/controllers/firebaseFirestore/notes/notesController.dart';
import 'package:ppppppp/core/services/services.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController(),);
    Get.put(SiginUpController(),);
    Get.put(SettingServices(),);
    Get.put(CategoryController(),);
    Get.put(NoteController(),);
    Get.put(FireStorageController());
  }
}