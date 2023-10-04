import 'package:get/get.dart';

import '../controllers/life_policy_controller.dart';

class LifePolicyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LifePolicyController>(
      () => LifePolicyController(),
    );
  }
}
