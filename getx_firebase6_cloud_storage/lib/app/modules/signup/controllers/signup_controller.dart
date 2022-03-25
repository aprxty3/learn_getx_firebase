import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignupController extends GetxController {
  final emailC = TextEditingController(text: "ajicool26@gmail.com");
  final passwordC = TextEditingController(text: "123123");

  @override
  void onClose() {
    emailC.dispose();
    passwordC.dispose();

    super.onClose();
  }
}
