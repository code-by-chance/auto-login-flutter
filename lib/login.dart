import 'package:auto_login_flutter/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  Controller controller;
  Login({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Login',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent),
            ),
            SizedBox(
              height: 10,
            ),
            customInput(
                controller: controller.usernameController,
                hintText: "Enter Username",
                isPassword: false),
            customInput(
                controller: controller.passwordController,
                hintText: "Enter Password",
                isPassword: true),
            SizedBox(
              height: 10,
            ),
            Obx(() => controller.showError.value
                ? Text(
                    controller.errorMsg,
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  )
                : SizedBox.shrink()),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: Get.width / 2,
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  await controller.doLogin();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget customInput(
    {required TextEditingController controller,
    required String hintText,
    required bool isPassword}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black, width: 0.5)),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration:
            InputDecoration(hintText: hintText, border: InputBorder.none),
      ),
    ),
  );
}
