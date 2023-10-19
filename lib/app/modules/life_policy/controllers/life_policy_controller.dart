import 'dart:convert';

import 'package:american_mile/core/helpers/device_helper.dart';
import 'package:get/get.dart';

import '../../../../core/network/api_service.dart';

class LifePolicyController extends GetxController {
  String policyId = "";
  @override
  void onInit() {
    policyId = Get.arguments;
    homePolicyAPI();
    super.onInit();
  }

  //*********************************************************************//
  //************************* User Profile API **************************//
  //*********************************************************************//

  RxBool isLoading = false.obs;
  Map<String, dynamic>? lifeDetails;
  homePolicyAPI() {
    isLoading.value = true;
    API().post(
      "coverage-life",
      data: {
        'user_id': DeviceHelper.getUserId(),
        'life_policy_id': policyId,
      },
    ).then((value) async {
      Get.log("Value  :  $value");
      try {
        Map<String, dynamic>? res = json.decode(value.data);
        if (res != null) {
          if (res['status'].toString() == "1") {
            lifeDetails = res['data'];
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
