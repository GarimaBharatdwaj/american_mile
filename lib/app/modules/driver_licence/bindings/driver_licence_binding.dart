import 'package:get/get.dart';

import '../controllers/driver_licence_controller.dart';

class DriverLicenceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DriverLicenceController>(
      () => DriverLicenceController(),
    );
  }
}
