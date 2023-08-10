import 'package:auto_login_flutter/controller.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Controller controller;

  Home({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Home',
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  controller.isLoggedIn(false);
                  await controller.emptyPrefs();
                },
                child: Text('Logout'))
          ],
        )),
      ),
    );
  }
}
