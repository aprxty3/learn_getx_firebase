import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
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
    );
  }
}
