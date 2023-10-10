import 'package:get/get.dart';

import '../controllers/car_dashboard_controller.dart';

class CarDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CarDashboardController>(
      () => CarDashboardController(),
    );
  }
}
