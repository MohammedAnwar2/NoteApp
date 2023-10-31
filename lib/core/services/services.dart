import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SettingServices extends GetxService
{
  static SettingServices instance = Get.find();
  late SharedPreferences sharedPreferences;
  Future<SettingServices> init()async{
    sharedPreferences=await SharedPreferences.getInstance();
    return this;
  }

  void write({required bool isLogin,required String key})
  {
    sharedPreferences.setBool(key, isLogin);
  }
  bool? read({required String key})
  {
    return sharedPreferences.getBool(key);
  }
}