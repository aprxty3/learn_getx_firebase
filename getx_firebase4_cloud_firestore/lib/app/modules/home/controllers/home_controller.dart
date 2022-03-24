import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference products = firestore.collection("products");

    return products.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference products = firestore.collection("products");

    return products.snapshots();
  }

  deleteProduct(String docID) async {
    DocumentReference docRef = firestore.collection("products").doc(docID);
    try {
      Get.defaultDialog(
        title: "Apakah delete data?",
        middleText: "apakah akan menghapus data ini?",
        onConfirm: () async => await docRef.delete(),
        textConfirm: "OK",
        onCancel: () => Get.back(),
        textCancel: "NOPE",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "terjadi kesalahan",
        middleText: "tidak berhasil menghapus data ini",
      );
    }
  }
}
