import 'package:get/get.dart';

import '../controllers/cloud_storage_controller.dart';

class CloudStorageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CloudStorageController>(
      () => CloudStorageController(),
    );
  }
}
