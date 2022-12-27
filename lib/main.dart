import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_my_class_1/src/app.dart';
import 'package:hive_my_class_1/src/config/config_contorller.dart';

void main() async {
  await Get.put(ConfigController()).initAppConfig();
  runApp(App());
}
