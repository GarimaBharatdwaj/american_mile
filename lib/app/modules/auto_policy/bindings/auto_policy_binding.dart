import 'package:get/get.dart';

import '../controllers/auto_policy_controller.dart';

class AutoPolicyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AutoPolicyController>(
      () => AutoPolicyController(),
    );
  }
}
