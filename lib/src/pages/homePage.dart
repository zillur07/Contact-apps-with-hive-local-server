import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_my_class_1/src/config/base.dart';
import 'package:hive_my_class_1/src/hive_models/user.dart';
import 'package:hive_my_class_1/src/pages/add_user.dart';
import 'package:hive_my_class_1/src/pages/update_user.dart';

class HomePage extends StatelessWidget with BaseController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Get.to(AddUser());
            }),
        appBar: AppBar(
          title: Text('data'),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: ValueListenableBuilder(
              valueListenable: Hive.box<User>('users').listenable(),
              builder: (BuildContext context, usersBox, Widget? _) {
                final items = usersBox.values.toList();
                return usersBox.isEmpty
                    ? Center(
                        child: Text('No User Data'),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: items.length,
                        itemBuilder: (BuildContext context, int index) {
                          final item = items[index];
                          return Padding(
                            padding: EdgeInsets.all(10),
                            child: Card(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                height: 100,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.name!,
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Text(item.email!),
                                        Text(item.username!),
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.edit),
                                          onPressed: () {
                                            Get.to(UpdateUser(
                                              item: item,
                                            ));
                                          },
                                          color: Colors.blueGrey,
                                        ),
                                        Spacer(),
                                        IconButton(
                                          icon: Icon(Icons.delete),
                                          onPressed: () {
                                            userC.deleteUser(item.id!);
                                          },
                                          color: Colors.redAccent,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
              },
            ),
          ),
        ));
  }
}
