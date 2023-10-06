import 'package:get/get.dart';

import '../controllers/manual_vehical_details_controller.dart';

class ManualVehicalDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManualVehicalDetailsController>(
      () => ManualVehicalDetailsController(),
    );
  }
}
