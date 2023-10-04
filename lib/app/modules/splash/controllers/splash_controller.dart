import 'dart:async';

import 'package:american_mile/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    determinateIndicator();
    super.onInit();
  }

  RxDouble value = 0.0.obs;
  void determinateIndicator() {
    Timer.periodic(300.milliseconds, (Timer timer) {
      if (value.value == 1) {
        timer.cancel();
      } else {
        value.value = value.value + 0.1;
      }
    });
    Future.delayed(2200.milliseconds).then((value) {
      Get.toNamed(Routes.HOME);
    });
  }
}
