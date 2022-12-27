import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_my_class_1/src/hive_models/user.dart';
import 'package:uuid/uuid.dart';

class UserController extends GetxController {
  final name = RxString('');
  final username = RxString('');
  final email = RxString('');

  void addUser() async {
    try {
      // Use the User Box
      final userBox = Hive.box<User>('users');
      var id = Uuid().v1();

      //.............................

      if (name.value.isNotEmpty &&
          email.value.contains('@') &&
          username.value.isNotEmpty) {
        //Add user data textfild
        final userData = User(
          id: id,
          name: name.value,
          email: email.value,
          username: username.value,
        );

        await userBox.put(id, userData);

        print('User added');
        Get.back();

        Get.snackbar(
          'Attention!!',
          'User is add ',
          backgroundColor: Colors.yellow,
          snackPosition: SnackPosition.BOTTOM,
        );

        //.............................

        // print(name.value);
        // print(email.value);
        // print(username.value);
      } else {
        Get.snackbar(
          'Attention!!',
          'Please validate the form before submit',
          backgroundColor: Colors.yellow,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print(e);
    }
  }

  void deleteUser(String id) {
    try {
      //print(id);

      Get.defaultDialog(
        middleText: 'Are you sure',
        actions: [
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.teal)),
            onPressed: () {
              Get.back();
            },
            child: Text(
              'Cencal',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red)),
            onPressed: () {
              final userBox = Hive.box<User>('users');
              userBox.delete(id);
              Get.back();

              Get.snackbar(
                'Successfully',
                'Item is Delete',
                backgroundColor: Colors.yellow,
                icon: Icon(
                  Icons.done,
                ),
                colorText: Colors.black,
                snackPosition: SnackPosition.TOP,
              );
            },
            child: Text(
              'Confirm',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      );
    } catch (e) {
      print(e);
    }
  }

  void updateUser(User user) async {
    try {
      final userBox = Hive.box<User>('users');

      user.email = email.value;
      user.name = name.value;
      user.username = username.value;
      await userBox.put(user.id, user);
      Get.back();

      Get.snackbar(
        'Successfully',
        'Item is Update',
        backgroundColor: Colors.yellow,
        icon: Icon(
          Icons.done,
        ),
        colorText: Colors.black,
        snackPosition: SnackPosition.TOP,
      );
    } catch (e) {
      print(e);
    }
  }
}
