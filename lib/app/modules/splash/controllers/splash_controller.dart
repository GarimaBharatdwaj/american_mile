import 'dart:async';
import 'package:american_mile/app/routes/app_pages.dart';
import 'package:american_mile/core/helpers/device_helper.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    determinateIndicator();
    super.onInit();
  }

  RxDouble value = 0.0.obs;
  void determinateIndicator() {
    Timer.periodic(150.milliseconds, (Timer timer) {
      if (value.value == 1) {
        timer.cancel();
      } else {
        value.value = value.value + 0.1;
      }
    });
    Future.delayed(1500.milliseconds).then((value) {
      if (DeviceHelper.getOnBoard() == "1") {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.offAllNamed(Routes.ONBOARD);
      }
    });
  }
}
