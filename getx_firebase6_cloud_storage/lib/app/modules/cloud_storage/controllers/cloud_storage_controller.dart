import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CloudStorageController extends GetxController {
  FirebaseStorage storage = FirebaseStorage.instance;

  void akses() async {
    var myRef = storage.ref("hello.text");

    var myRef2 = storage.ref().child("screen_shot").child('hello.txt');
  }
}
