import 'dart:convert';
import 'package:american_mile/app/ui/widgets/error_dialog.dart';

import '../../../../common_lib.dart';
import '../../../../core/helpers/device_helper.dart';
import '../../../../core/network/api_service.dart';

class PolicyDashboardController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  void onInit() {
    policiesAPI();
    getUserProfile();
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
            errorDialog(res['msg']);
          }
        } else {
          errorDialog("Some error occurred");
        }
      } catch (e) {
        errorDialog("Some error occurred");
      }
      isLoading.value = false;
    });
  }
  //*********************************************************************//
  //************************* User Profile API **************************//
  //*********************************************************************//

  RxBool isProfileLoading = false.obs;
  Map<String, dynamic>? userData;
  getUserProfile() {
    isProfileLoading.value = true;
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
            isProfileLoading.value = false;
          } else {
            isProfileLoading.value = false;
            errorDialog(res['msg']);
          }
        } else {
          isProfileLoading.value = false;
          errorDialog("Some error occurred");
        }
      } catch (e) {
        isProfileLoading.value = false;
        errorDialog("Some error occurred");
      }
    });
  }
}
