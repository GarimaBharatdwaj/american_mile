import 'dart:convert';

import 'package:get/get.dart';

import '../../../../core/network/api_service.dart';

class HomePolicyController extends GetxController {
  RxInt type = 0.obs;
  @override
  void onInit() {
    homePolicyAPI();
    super.onInit();
  }

  //*********************************************************************//
  //************************* User Profile API **************************//
  //*********************************************************************//

  RxBool isLoading = false.obs;
  Map<String, dynamic>? homeDetails;
  homePolicyAPI() {
    isLoading.value = true;
    API().post(
      "coverage-homeowners",
      data: {
        'user_id': "14",
        'home_policy_id': "85",
      },
    ).then((value) async {
      Get.log("Value  :  $value");
      try {
        Map<String, dynamic>? res = json.decode(value.data);
        if (res != null) {
          if (res['status'].toString() == "1") {
            homeDetails = res['data'];
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
