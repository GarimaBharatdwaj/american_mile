import 'package:get/get.dart';

import '../controllers/canopy_login_controller.dart';

class CanopyLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CanopyLoginController>(
      () => CanopyLoginController(),
    );
  }
}
