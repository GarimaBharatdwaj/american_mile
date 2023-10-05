import 'package:get/get.dart';

import '../controllers/search_by_vin_controller.dart';

class SearchByVinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchByVinController>(
      () => SearchByVinController(),
    );
  }
}
