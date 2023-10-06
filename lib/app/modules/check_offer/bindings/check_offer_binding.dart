import 'package:get/get.dart';

import '../controllers/check_offer_controller.dart';

class CheckOfferBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckOfferController>(
      () => CheckOfferController(),
    );
  }
}
