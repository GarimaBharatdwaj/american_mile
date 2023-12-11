import 'dart:convert';

import 'package:american_mile/app/ui/widgets/error_dialog.dart';
import 'package:get/get.dart';

import '../../../../common_lib.dart';
import '../../../../core/helpers/device_helper.dart';
import '../../../../core/network/api_service.dart';

class MyFamilyController extends GetxController
    with GetTickerProviderStateMixin {
  @override
  void onInit() async {
    tabController = TabController(
      vsync: this,
      length: 3,
    );
    await getData();
    super.onInit();
  }

  Future<void> getData() async {
    isLoading.value = true;
    await myFamilyAPI();
    await getRestoreVehicleListAPI();

    debugPrint("DATA NOT FOUND");
  }

  late TabController tabController;

  //*********************************************************************//
  //************************** My Family API ****************************//
  //*********************************************************************//

  RxBool isLoading = true.obs;
  Map<String, dynamic>? familyDetails;
  Future<void> myFamilyAPI() async {
    isLoading.value = true;
    try {
      var response = await API().post(
        "my-family",
        data: {'user_id': DeviceHelper.getUserId()},
      );

      Get.log("Value  :  ${response.data}");

      Map<String, dynamic>? res = json.decode(response.data);

      if (res != null) {
        if (res['status'].toString() == "1") {
          familyDetails = res['details'];
        } else {
          errorDialog(res['msg']);
        }
      } else {
        errorDialog("Some error occurred");
      }
    } catch (e) {
      errorDialog("Some error occurred");
    } finally {
      isLoading.value = false;
    }
  }
  // Future<void> myFamilyAPI() async {
  //   isLoading.value = true;
  //   API().post(
  //     "my-family",
  //     data: {
  //       'user_id': DeviceHelper.getUserId(),
  //     },
  //   ).then((value) async {
  //     Get.log("Value  :  $value");
  //     try {
  //       Map<String, dynamic>? res = json.decode(value.data);
  //       if (res != null) {
  //         if (res['status'].toString() == "1") {
  //           familyDetails = res['details'];
  //         } else {
  //           errorDialog(res['msg']);
  //         }
  //       } else {
  //         errorDialog("Some error occurred");
  //       }
  //     } catch (e) {
  //       errorDialog("Some error occurred");
  //     }
  //   });
  // }

  //*********************************************************************//
  //************************** Restore Vehicle API **********************//
  //*********************************************************************//

  Future<void> restoreVehicleAPI(String id) async {
    isLoading.value = true;
    try {
      var response = await API().post(
        "add-unlisted-vehicle",
        data: {'user_id': DeviceHelper.getUserId(), 'id': id},
      );

      Get.log("Value  :  ${response.data}");

      Map<String, dynamic>? res = json.decode(response.data);

      if (res != null) {
        if (res['status'] == 1) {
          await getData();
        } else {
          errorDialog(res['msg']);
        }
      }
    } catch (e) {
      errorDialog("Some error occurred");
    } finally {
      isLoading.value = false;
    }
  }

  // restoreVehicleAPI(String id) async {
  //   isLoading.value = true;
  //   API().post(
  //     "add-unlisted-vehicle",
  //     data: {'user_id': DeviceHelper.getUserId(), 'id': id},
  //   ).then((value) async {
  //     Get.log("Value  :  $value");
  //     try {
  //       Map<String, dynamic>? res = json.decode(value.data);
  //       if (res != null) {
  //         if (res['status'] == 1) {
  //           getData();
  //         } else {
  //           errorDialog(res['msg']);
  //         }
  //       }
  //     } catch (e) {
  //       errorDialog("Some error occurred");
  //     }
  //   });
  // }

  //*********************************************************************//
  //************************** Get Restore List Vehicle API *************//
  //*********************************************************************//

  // Future<void> getRestoreVehicleListAPI() async {
  //   restoreVehicleList = [];
  //   API().post(
  //     "get-driver-package",
  //     data: {
  //       'user_id': DeviceHelper.getUserId(),
  //     },
  //   ).then((value) async {
  //     Get.log("Value  :  $value");
  //     try {
  //       Map<String, dynamic>? res = json.decode(value.data);
  //       if (res != null) {
  //         restoreVehicleList = res['unlisted_vehicles'];
  //       }
  //       isLoading.value = false;
  //     } catch (e) {
  //       errorDialog("Some error occurred");
  //       isLoading.value = false;
  //     }
  //   });
  // }
  var restoreVehicleList = [].obs;
  Future<void> getRestoreVehicleListAPI() async {
    isLoading.value = true;
    restoreVehicleList.clear();
    try {
      var response = await API().post(
        "get-driver-package",
        data: {'user_id': DeviceHelper.getUserId()},
      );

      Get.log("Value  :  ${response.data}");

      Map<String, dynamic>? res = json.decode(response.data);

      if (res != null) {
        restoreVehicleList.value = res['unlisted_vehicles'];
        isLoading.value = false;
      }
      isLoading.value = false;
    } catch (e) {
      errorDialog("Some error occurred");
      isLoading.value = false;
    }
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
            isLoading.value = false;
          }
        } else {
          isLoading.value = false;
        }
      } catch (e) {
        isLoading.value = false;
      }
    });
  }

  //*********************************************************************//
  //************************** Delete Vehical API ***********************//
  //*********************************************************************//

  Future<void> deleteVehicleAPI(String vehicleId) async {
    isLoading.value = true;
    try {
      var response = await API().post(
        "delete-vehicle",
        data: {
          'user_id': DeviceHelper.getUserId(),
          'vehicle_id': vehicleId,
        },
      );

      Get.log("Value  :  ${response.data}");

      Map<String, dynamic>? res = json.decode(response.data);

      if (res != null) {
        if (res['status'].toString() == "1") {
          await getData();
        }
      }
    } catch (e) {
      debugPrint("Error in deleteVehicleAPI: $e");
    }
  }

  // deleteVehicalAPI(String vehicleId) {
  //   API().post(
  //     "delete-vehicle",
  //     data: {
  //       'user_id': DeviceHelper.getUserId(),
  //       "vehicle_id": vehicleId,
  //     },
  //   ).then((value) async {
  //     Get.log("Value  :  $value");
  //     try {
  //       Map<String, dynamic>? res = json.decode(value.data);
  //       if (res != null) {
  //         if (res['status'].toString() == "1") {
  //           getData();
  //         }
  //       }
  //     } catch (e) {
  //       isLoading.value = false;
  //     }
  //   });
  // }
}
