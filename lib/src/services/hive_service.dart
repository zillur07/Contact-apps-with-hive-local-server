import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_my_class_1/src/hive_models/user.dart';
import 'package:path_provider/path_provider.dart';

class HiveService extends GetxService {
  // Init hive and Path
  Future<void> initHive() async {
    final appDir = await getApplicationDocumentsDirectory();
    Hive.init(appDir.path);

    regAdapters();
    await openBoxes();

    print('hive Init');
  }
//...............................

// Registered all Adapters.
  void regAdapters() {
    Hive.registerAdapter(UserAdapter());
    print('Register all Adapters ');
  }
  //--------------------------------

  // Open all Boxes.

  Future<void> openBoxes() async {
    await Hive.openBox<User>('users');
    print('Open all Boxes');
  }
  //..................................
}
