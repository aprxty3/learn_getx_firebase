import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'dart:io';
import 'package:file_picker/file_picker.dart';

class CloudStorageController extends GetxController {
  void uploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      print(file);

      String fileName = result.files.first.name;
      // String fileExtension = result.files.first.extension!;

      try {
        await firebase_storage.FirebaseStorage.instance
            .ref('${fileName}')
            .putFile(file);
        print("Berhasil upload file");
      } on firebase_storage.FirebaseException catch (e) {
        print(e);
      }
    } else {
      print("Membatalkan File Upload");
    }
  }
}
