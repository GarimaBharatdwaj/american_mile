import 'dart:convert';

import 'package:get/get.dart';

import '../../../../common_lib.dart';
import '../../../../core/helpers/device_helper.dart';
import '../../../../core/network/api_service.dart';

class MyFamilyController extends GetxController
    with GetTickerProviderStateMixin {
  @override
  void onInit() {
    tabCotroller = TabController(
      vsync: this,
      length: 3,
    );
    myFamilyAPI();
    super.onInit();
  }

  late TabController tabCotroller;

  //*********************************************************************//
  //************************** Auto Policy API **************************//
  //*********************************************************************//

  RxBool isLoading = false.obs;
  Map<String, dynamic>? familyDetails;
  myFamilyAPI() {
    isLoading.value = true;
    API().post(
      "my-family",
      data: {
        'user_id': DeviceHelper.getUserId(),
      },
    ).then((value) async {
      Get.log("Value  :  $value");
      try {
        Map<String, dynamic>? res = json.decode(value.data);
        if (res != null) {
          if (res['status'].toString() == "1") {
            familyDetails = res['details'];
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

  //*********************************************************************//
  //************************** Delete Driver API ************************//
  //*********************************************************************//

  deleteDriverAPI(String driverId) {
    isLoading.value = true;
    API().post(
      "delete-driver",
      data: {
        'user_id': DeviceHelper.getUserId(),
        "driver_id": driverId,
      },
    ).then((value) async {
      Get.log("Value  :  $value");
      try {
        Map<String, dynamic>? res = json.decode(value.data);
        if (res != null) {
          if (res['status'].toString() == "1") {
            myFamilyAPI();
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

  //*********************************************************************//
  //************************** Auto Policy API **************************//
  //*********************************************************************//

  deleteVehicalAPI(String vehicleId) {
    isLoading.value = true;
    API().post(
      "delete-vehicle",
      data: {
        'user_id': DeviceHelper.getUserId(),
        "vehicle_id": vehicleId,
      },
    ).then((value) async {
      Get.log("Value  :  $value");
      try {
        Map<String, dynamic>? res = json.decode(value.data);
        if (res != null) {
          if (res['status'].toString() == "1") {
            myFamilyAPI();
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
