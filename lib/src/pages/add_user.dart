import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_my_class_1/src/config/base.dart';

class AddUser extends StatelessWidget with BaseController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              //Obx(() => Text('${userC.name.value}')),
              TextFormField(
                onChanged: userC.name,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
              TextFormField(
                onChanged: userC.email,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              TextFormField(
                onChanged: userC.username,
                decoration: InputDecoration(
                  labelText: 'UserName',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: Get.width,
                child: ElevatedButton(
                  onPressed: () {
                    userC.addUser();
                  },
                  child: Text(
                    'User Add',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.pink,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
