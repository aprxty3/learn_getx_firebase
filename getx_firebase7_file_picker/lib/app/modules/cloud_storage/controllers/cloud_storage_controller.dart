import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'dart:convert' show utf8;
import 'dart:typed_data' show Uint8List;

class CloudStorageController extends GetxController {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  void akses() async {
    // //UNTUK UPLOAD FILE BENTUK RAW
    // String text = 'Hello World!';
    // List<int> encoded = utf8.encode(text);

    // print(encoded);

    // // Uint8List data = Uint8List.fromList(encoded);

    // // s.Reference ref =
    // //     s.FirebaseStorage.instance.ref('uploads/hello-world.text');

    // // // try {
    // // //   // Upload raw data.
    // // //   await ref.putData(data);
    // // //   // Get raw data.
    // // //   Uint8List downloadedData = await ref.getData();
    // // //   // prints -> Hello World!
    // // //   print(utf8.decode(downloadedData));
    // // // } on s.FirebaseException catch (e) {
    // // //   // e.g, e.code == 'canceled'
    // // // }

    // UNTUK UPLOAD FILE BENTUK STRING
    // String dataUrl = 'data:text/plain;base64,SGVsbG8sIFdvcmxkIQ==';

    var myRef = storage.ref("dataWithMetaData.txt");

    // Create your custom metadata.
    firebase_storage.SettableMetadata metadata =
        firebase_storage.SettableMetadata(
      cacheControl: 'max-age=60',
      customMetadata: <String, String>{
        'userId': 'ABC123',
      },
    );
    myRef.putString("Hellow Worlds");

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
