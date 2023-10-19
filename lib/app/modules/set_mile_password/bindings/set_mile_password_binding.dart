import 'package:get/get.dart';

import '../controllers/set_mile_password_controller.dart';

class SetMilePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetMilePasswordController>(
      () => SetMilePasswordController(),
    );
  }
}
