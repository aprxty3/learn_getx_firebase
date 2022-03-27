import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as s;

class CloudStorageController extends GetxController {
  s.FirebaseStorage storage = s.FirebaseStorage.instance;

  void akses() async {
    String dataUrl = 'data:text/plain;base64,SGVsbG8sIFdvcmxkIQ==';

    var myRef = storage.ref("helloww.txt");

    myRef.putString(dataUrl, format: s.PutStringFormat.dataUrl);

//UNTUK BACA FILE STORAGE
    // var myList = await myRef.listAll();

    // print("Banyak data : ${myList.items.length}");

    // myList.items.forEach(
    //   (element) async {
    //     final url = await storage.ref(element.name).getDownloadURL();

    //     print(url);
    //   },
    // );

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
