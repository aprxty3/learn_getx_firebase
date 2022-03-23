import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  final emailC = TextEditingController(text: "ajicool26@gmail.com");
  final passwordC = TextEditingController(text: "123123");

  @override
  void onClose() {
    emailC.dispose();
    passwordC.dispose();

    super.onClose();
  }
}
