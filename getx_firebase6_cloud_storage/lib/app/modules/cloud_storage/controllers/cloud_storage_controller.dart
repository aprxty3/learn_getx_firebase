import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CloudStorageController extends GetxController {
  FirebaseStorage storage = FirebaseStorage.instance;

  void akses() async {
    var myRef = storage.ref("/screen_shot/");

    var myList = await myRef.listAll();

    print(myList.items.length);
  }
}
