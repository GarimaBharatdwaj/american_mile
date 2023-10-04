import 'package:get/get.dart';

import '../controllers/home_policy_controller.dart';

class HomePolicyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePolicyController>(
      () => HomePolicyController(),
    );
  }
}
