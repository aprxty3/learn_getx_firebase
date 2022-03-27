import 'package:get/get.dart';

import '../controllers/edit_pages_controller.dart';

class EditPagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditPagesController>(
      () => EditPagesController(),
    );
  }
}
