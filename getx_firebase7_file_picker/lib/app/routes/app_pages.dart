import 'package:get/get.dart';

import '../modules/cloud_storage/bindings/cloud_storage_binding.dart';
import '../modules/cloud_storage/views/cloud_storage_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CLOUD_STORAGE,
      page: () => CloudStorageView(),
      binding: CloudStorageBinding(),
    ),
  ];
}
