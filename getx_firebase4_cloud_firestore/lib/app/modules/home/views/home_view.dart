import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:learn_getx_firebase/app/controllers/auth_controller.dart';
import 'package:learn_getx_firebase/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              authC.logOut();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      // ONE TIME READ

      // body: FutureBuilder<QuerySnapshot<Object?>>(
      //   future: controller.getData(),
      // builder: (context, snapshot) {
      //   if (snapshot.connectionState == ConnectionState.done) {
      //     var listAllDocs = snapshot.data!.docs;
      //     return ListView.builder(
      //       itemCount: listAllDocs.length,
      //       itemBuilder: (context, index) => ListTile(
      //         title: Text(
      //             "${(listAllDocs[index].data() as Map<String, dynamic>)["nama"]}"),
      //         subtitle: Text(
      //             "Rp. ${(listAllDocs[index].data() as Map<String, dynamic>)["harga"]}"),
      //       ),
      //     );
      //   }
      //   return Center(
      //     child: CircularProgressIndicator(),
      //   );
      // },
      // ),

      //REALTIME READ

      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: controller.streamData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            var listAllDocs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: listAllDocs.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () => Get.toNamed(
                  Routes.EDIT_PAGES,
                  arguments: listAllDocs[index].id,
                ),
                title: Text(
                  "${(listAllDocs[index].data() as Map<String, dynamic>)["nama"]}",
                ),
                subtitle: Text(
                  "Rp. ${(listAllDocs[index].data() as Map<String, dynamic>)["harga"]}",
                ),
                trailing: IconButton(
                  onPressed: () =>
                      controller.deleteProduct(listAllDocs[index].id),
                  icon: Icon(Icons.delete),
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.PRODUCT),
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
