import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  final emailC = TextEditingController(text: "test@gmail.com");
  final passwordC = TextEditingController(text: "123123");

  @override
  void onClose() {
    emailC.dispose();
    passwordC.dispose();

    super.onClose();
  }
}
