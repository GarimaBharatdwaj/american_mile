import 'package:get/get.dart';

import '../controllers/connect_car_controller.dart';

class ConnectCarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConnectCarController>(
      () => ConnectCarController(),
    );
  }
}
