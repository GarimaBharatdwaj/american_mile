import 'dart:convert';

import 'package:american_mile/core/helpers/device_helper.dart';
import 'package:get/get.dart';

import '../../../../core/network/api_service.dart';

class AutoPolicyController extends GetxController {
  String policyId = "";

  @override
  void onInit() {
    policyId = Get.arguments;
    autoPolicyAPI();
    super.onInit();
  }

  RxInt type = 0.obs;
  //*********************************************************************//
  //************************** Auto Policy API **************************//
  //*********************************************************************//

  RxBool isLoading = false.obs;
  Map<String, dynamic>? autoDetails;
  autoPolicyAPI() {
    isLoading.value = true;
    API().post(
      "coverage-vehicle",
      data: {
        'user_id': DeviceHelper.getUserId(),
        'auto_policy_id': policyId,
      },
    ).then((value) async {
      Get.log("Value  :  $value");
      try {
        Map<String, dynamic>? res = json.decode(value.data);
        if (res != null) {
          if (res['status'].toString() == "1") {
            autoDetails = res;
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
}
