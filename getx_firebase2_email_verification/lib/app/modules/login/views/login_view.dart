import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:learn_getx_firebase/app/controllers/auth_controller.dart';
import 'package:learn_getx_firebase/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
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
                authC.login(controller.emailC.text, controller.passwordC.text);
              },
              child: Text('LOGIN'),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Belum Punya Akun?',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                TextButton(
                  onPressed: () => Get.toNamed(Routes.SIGNUP),
                  child: Text(
                    'Buat Akun!',
                    style: TextStyle(fontSize: 14),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
