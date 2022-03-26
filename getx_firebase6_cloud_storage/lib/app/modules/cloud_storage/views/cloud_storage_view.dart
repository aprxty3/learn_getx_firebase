import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cloud_storage_controller.dart';

class CloudStorageView extends GetView<CloudStorageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CloudStorageView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CloudStorageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.akses(),
      ),
    );
  }
}
