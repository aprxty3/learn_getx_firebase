import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  final emailC = TextEditingController(text: "ajicool26@gmail.com");

  @override
  void onClose() {
    emailC.dispose();

    super.onClose();
  }
}
