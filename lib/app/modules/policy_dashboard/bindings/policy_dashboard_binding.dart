import 'package:get/get.dart';

import '../controllers/policy_dashboard_controller.dart';

class PolicyDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PolicyDashboardController>(
      () => PolicyDashboardController(),
    );
  }
}
