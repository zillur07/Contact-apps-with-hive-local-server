import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_my_class_1/src/services/hive_service.dart';

class ConfigController extends GetxController {
  Future<void> initAppConfig() async {
    // Deafult config for the App!

    WidgetsFlutterBinding.ensureInitialized();
    await Get.put(HiveService()).initHive();
  }
}
