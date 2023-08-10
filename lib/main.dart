import 'package:auto_login_flutter/controller.dart';
import 'package:auto_login_flutter/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Obx(() => controller.isLoggedIn.value
          ? Home(controller: controller)
          : Login(
              controller: controller,
            )),
    );
  }
}
