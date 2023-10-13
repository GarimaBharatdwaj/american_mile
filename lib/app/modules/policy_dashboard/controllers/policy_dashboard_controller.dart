import 'dart:convert';

import 'package:get/get.dart';

import '../../../../core/network/api_service.dart';

class PolicyDashboardController extends GetxController {
  @override
  void onInit() {
    policiesAPI();
    super.onInit();
  }

  //*********************************************************************//
  //************************* User Profile API **************************//
  //*********************************************************************//

  RxBool isLoading = false.obs;
  Map<String, dynamic>? policies;
  policiesAPI() {
    isLoading.value = true;
    API().post(
      "policy-dashboard",
      data: {
        'user_id': "14",
      },
    ).then((value) async {
      Get.log("Value  :  $value");
      try {
        Map<String, dynamic>? res = json.decode(value.data);
        if (res != null) {
          if (res['status'].toString() == "1") {
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
}
