import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_my_class_1/src/config/base.dart';

import '../hive_models/user.dart';

class UpdateUser extends StatelessWidget with BaseController {
  final User item;
  UpdateUser({required this.item});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update User',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  initialValue: item.name,
                  onChanged: userC.name,
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                TextFormField(
                  initialValue: item.email,
                  onChanged: userC.email,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                TextFormField(
                  initialValue: item.username,
                  onChanged: userC.username,
                  decoration: InputDecoration(
                    labelText: 'User Name',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: Get.width,
                  child: ElevatedButton(
                    onPressed: () {
                      userC.updateUser(item);
                    },
                    child: Text(
                      'Update',
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
