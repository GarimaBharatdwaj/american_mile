import 'package:get/get.dart';

import '../controllers/mfa_verify_controller.dart';

class MfaVerifyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MfaVerifyController>(
      () => MfaVerifyController(),
    );
  }
}
