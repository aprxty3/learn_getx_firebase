import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx_firebase/app/routes/app_pages.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  void login(String email, String password) async {
    try {
      UserCredential myUser = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (myUser.user!.emailVerified) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.defaultDialog(
          title: "Verificatioon Email",
          middleText:
              "Kamu Perlu Verifikasi Email. apakah kamu ingin dikirimkan verifikasi ulang?",
          onConfirm: () async {
            await myUser.user!.sendEmailVerification();
            Get.back();
          },
          textConfirm: "Kirim Ulang",
          textCancel: "Kembali",
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.defaultDialog(
          title: "Verificatioon Email",
          middleText: "No user found for that email.",
        );
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        Get.defaultDialog(
          title: "Verificatioon Email",
          middleText: "Wrong password provided for that user.",
        );
      }
    } catch (e) {
      Get.defaultDialog(
        title: "Verificatioon Email",
        middleText: "Tidak dapat login pakai akun ini",
      );
    }
  }

  void signUp(String email, String password) async {
    try {
      UserCredential myUser =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await myUser.user!.sendEmailVerification();
      Get.defaultDialog(
        title: "Verificatioon Email",
        middleText: "Kami telah mengirim Verifikasi Email ke $email",
        onConfirm: () {
          Get.back(); // to close dialog
          Get.back(); // go to login
        },
        textConfirm: "Ya, Saya akan cek Email",
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Get.defaultDialog(
          title: "Verificatioon Email",
          middleText: 'The password provided is too weak.',
        );
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.defaultDialog(
          title: "Verificatioon Email",
          middleText: 'The account already exists for that email.',
        );
      }
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Verificatioon Email",
        middleText: 'Tidak dapat mendaftarkan akun ini',
      );
    }
  }

  void resetPassword(String email) async {
    if (email != "" && GetUtils.isEmail(email)) {
      try {
        await auth.sendPasswordResetEmail(email: email);
        Get.defaultDialog(
          title: "berhasil mengirim reset email",
          middleText: "kami telah  mengirimkan reset password ke email $email ",
          onConfirm: () {
            Get.back();
            Get.back();
          },
          textConfirm: "Ya, Aku Mengerti",
        );
      } catch (e) {
        Get.defaultDialog(
          title: "terjadi kesalahan",
          middleText: "Tidak dapat mengirimkan reset password",
        );
      }
    } else {
      Get.defaultDialog(
        title: "terjadi kesalahan",
        middleText: "Email tidak valid",
      );
    }
  }

  void logOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
