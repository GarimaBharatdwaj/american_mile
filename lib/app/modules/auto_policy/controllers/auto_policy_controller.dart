import 'dart:convert';

import 'package:get/get.dart';

import '../../../../core/network/api_service.dart';

class AutoPolicyController extends GetxController {
  //TODO: Implement AutoPolicyController

  @override
  void onInit() {
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
        'user_id': "14",
        'auto_policy_id': "163",
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
