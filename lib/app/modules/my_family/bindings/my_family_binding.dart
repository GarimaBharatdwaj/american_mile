import 'package:get/get.dart';

import '../controllers/my_family_controller.dart';

class MyFamilyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyFamilyController>(
      () => MyFamilyController(),
    );
  }
}
