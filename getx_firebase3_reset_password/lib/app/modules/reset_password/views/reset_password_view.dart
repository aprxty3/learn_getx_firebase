import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:learn_getx_firebase/app/controllers/auth_controller.dart';

import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ResetPasswordView'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller.emailC,
                decoration: InputDecoration(labelText: "Email"),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: controller.passwordC,
                decoration: InputDecoration(labelText: "Password"),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  authC.login(
                      controller.emailC.text, controller.passwordC.text);
                },
                child: Text('LOGIN'),
              ),
            ],
          ),
        ));
  }
}
