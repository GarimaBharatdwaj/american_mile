import 'dart:convert';

import 'package:get/get.dart';

import '../../../../common_lib.dart';
import '../../../../core/helpers/device_helper.dart';
import '../../../../core/network/api_service.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  void onInit() {
    if (DeviceHelper.getUserId() != null) {
      // getUserProfile();
    }
    super.onInit();
  }

  //*********************************************************************//
  //************************* User Profile API **************************//
  //*********************************************************************//

  RxBool isLoading = false.obs;
  Map<String, dynamic>? userData;
  getUserProfile() {
    isLoading.value = true;
    API().post(
      "get-profile",
      data: {
        'user_id': DeviceHelper.getUserId(), //DeviceHelper.getId()
      },
    ).then((value) async {
      Get.log("Value  :  $value");
      try {
        Map<String, dynamic>? res = json.decode(value.data);
        if (res != null) {
          if (res['status'].toString() == "1") {
            userData = res['user_data'];
            isLoading.value = false;
          } else {
            // Constants.showErrorDialogRevise();
            isLoading.value = false;
          }
        } else {
          // Constants.showErrorDialogRevise();
          isLoading.value = false;
        }
      } catch (e) {
        // Constants.showErrorDialogRevise();
        isLoading.value = false;
      }
    });
  }
}
