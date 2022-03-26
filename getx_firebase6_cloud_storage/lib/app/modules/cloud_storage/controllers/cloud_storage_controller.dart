import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CloudStorageController extends GetxController {
  FirebaseStorage storage = FirebaseStorage.instance;

  void akses() async {
    var myRef = storage.ref();

    var myList = await myRef.list(ListOptions(maxResults: 1));

    print("Banyak data : ${myList.items.length}");

    myList.items.forEach(
      (element) {
        print(element.name);
      },
    );

    // print('-------------------------');

    // print("Banyak folder : ${myList.prefixes.length}");

    // // myList.prefixes.forEach(
    // //   (element) {
    // //     print(element.name);
    // //   },
    // // );

    // print('-------------------------');

    // myList.prefixes.forEach(
    //   (element) async {
    //     var myFolderList = await storage.ref(element.name).listAll();

    //     print(
    //         "Banyak data pada folder ${element.name}: ${myFolderList.items.length}");

    //     myFolderList.items.forEach(
    //       (element) {
    //         print(element.name);
    //       },
    //     );
    //   },
    // );
  }
}
