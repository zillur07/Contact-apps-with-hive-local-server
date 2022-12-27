import 'package:get/get.dart';
import 'package:hive_my_class_1/src/controllers/user_controller.dart';

class BaseController {
  // All Controllers
  final userC = Get.put(UserController(), permanent: true);

  //.................................

  // All Services
}
