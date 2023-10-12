import 'dart:convert';

import 'package:get/get.dart';

import '../../../../core/network/api_service.dart';

class PolicyDashboardController extends GetxController {
  //TODO: Implement PolicyDashboardController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //*********************************************************************//
  //************************* User Profile API **************************//
  //*********************************************************************//

  RxBool isLoading = false.obs;
  Map<String, dynamic>? policies;
  userProfileAPI() {
    isLoading.value = true;
    API().get(
      "policy-dashboard",
      queryParameters: {
        'userid': "14",
      },
    ).then((value) async {
      Get.log("Value  :  $value");
      try {
        Map<String, dynamic>? res = json.decode(value.data);
        if (res != null) {
          if (res['flag'] == "1") {
            policies = res;
          } else {
            // Constants.showErrorDialogRevise();
          }
        } else {
          // Constants.showErrorDialogRevise();
        }
      } catch (e) {
        // Constants.showErrorDialogRevise();
      }
      isLoading.value = false;
    });
  }

  void increment() => count.value++;
}
