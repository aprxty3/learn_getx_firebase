import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CloudStorageController extends GetxController {
  FirebaseStorage storage = FirebaseStorage.instance;

  void akses() async {
    var myRef = storage.ref();

    var myList = await myRef.listAll();

    print("Banyak data : ${myList.items.length}");

    myList.items.forEach(
      (element) {
        print(element.name);
      },
    );

    print('-------------------------');

    print("Banyak folder : ${myList.prefixes.length}");

    myList.prefixes.forEach(
      (element) {
        print(element.name);
      },
    );
  }
}
