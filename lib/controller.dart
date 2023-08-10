import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Controller extends GetxController {
  //Here i am using predefined username and password to match you can use
  //api or local database password for authentication.
  String username = "codebychance";
  String password = "codebychance";
  String errorMsg = "";

  var isLoggedIn = false.obs;
  var showError = false.obs;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('username')) {
      if (prefs.getString('username') == username &&
          prefs.getString('password') == password) {
        isLoggedIn(true);
      } else {
        isLoggedIn(false);
      }
    }
  }

  //Do login method to submit data
  Future<void> doLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (validateLoginCredentials()) {
      if (usernameController.text.trim() == username &&
          passwordController.text.trim() == password) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('username', usernameController.text.trim().toString());
        prefs.setString('password', passwordController.text.trim().toString());
        emptyController();
        showError(false);
        isLoggedIn(true);
      } else {
        errorMsg = "Incorrect Username or Password!";
        showError(false);
        showError(true);
        isLoggedIn(false);
      }
    } else {
      errorMsg = "*Fields cannot be empty!";
      showError(false);
      showError(true);
      isLoggedIn(false);
    }
  }

  bool validateLoginCredentials() {
    if (usernameController.text.trim().isNotEmpty &&
        passwordController.text.trim().isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void emptyController() {
    usernameController.text = "";
    passwordController.text = "";
  }

  Future<void> emptyPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('username');
    prefs.remove('password');
  }
}
