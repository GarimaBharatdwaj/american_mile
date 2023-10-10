import 'package:get/get.dart';

import '../controllers/insurance_provider_controller.dart';

class InsuranceProviderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InsuranceProviderController>(
      () => InsuranceProviderController(),
    );
  }
}
