import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class QueryController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void filter(int age) async {
    final result = await firestore
        .collection("users")
        .where('motor', arrayContainsAny: ["jupiter", "supra"]).get();

    if (result.docs.length > 0) {
      print("Total data filter : ${result.docs.length}");
      result.docs.forEach((element) {
        var id = element.id;
        var data = element.data();

        print("ID : $id");
        print("Data : $data");
      });
    } else {
      print("tidak ada data filter : ${result.docs.length}");
    }
  }
}
