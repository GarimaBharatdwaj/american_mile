import 'dart:convert';
import 'package:american_mile/core/network/api_service.dart';
import '../../../../common_lib.dart';
import '../../../../core/helpers/device_helper.dart';

class DriverLicenceController extends GetxController {
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    /// scanDriverDetails();
  }

  //***********************************************************************//
  //****************** Scan Driver's License ******************************//
  //***********************************************************************//

  Map<String, dynamic>? driverDetails;

  scanDriverDetails() async {
    final userId = DeviceHelper.getUserId();

    debugPrint(userId.toString());
    isLoading.value = true;
    try {
      /// TODO ---------------------
      var response = await API().post('', data: {});
      Map<String, dynamic>? mapData = jsonDecode(response.data);
      if (mapData != null) {
        driverDetails = mapData[''];
        debugPrint(mapData['msg']);
      }
    } catch (e) {
      debugPrint(e.toString());
      isLoading.value = false;
    }
    isLoading.value = false;
  }

  sendArgumentsToDriverDetails({required bool isAddingManually}) {
    Get.toNamed(Routes.DRIVER_DETAILS,
        arguments: !isAddingManually
            ? null
            : {
                'isAddingManually': isAddingManually,
                'name': driverDetails?['name'] ?? '',
                'gender': driverDetails?['gender'] ?? '',
                'dob': driverDetails?['dob'] ?? '',
                'dl': driverDetails?['license_number'] ?? '',
                'address': driverDetails?['address'] ?? ''
              });
  }
}
