import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'dart:io';
import 'package:file_picker/file_picker.dart';

class CloudStorageController extends GetxController {
  void uploadFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      result.files.forEach((element) async {
        String name = element.name;

        File file = File(element.path!);

        try {
          await firebase_storage.FirebaseStorage.instance
              .ref(name)
              .putFile(file);
          print("Berhasil Upload Multiple File");
        } on firebase_storage.FirebaseException catch (e) {
          print("Error Upload");
        }
      });
    } else {
      print("Membatalkan File Upload");
    }
  }
}
