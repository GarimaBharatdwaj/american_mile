import 'dart:convert';
import 'package:american_mile/app/ui/widgets/error_dialog.dart';
import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/helpers/device_helper.dart';
import 'package:american_mile/core/network/api_service.dart';
import 'package:american_mile/core/utils/index.dart';
import 'package:get_storage/get_storage.dart';

class CarDashboardController extends GetxController {
  RxBool isLoading = false.obs;
  Map<String, dynamic>? carDashBoardData;
  String? webUrl;

  var isActive = false.obs;
  RxInt selectedIndex = 120.obs;

  final thankYouUrl = 'https://pyot.co.in/thankyou';
  final thankYouUrlTwo = 'https://pyot.co.in/Smartcar_api/browser_callback';

  // String? vehicleId;

  final count = 0.obs;
  late Map<String, dynamic>? argumentsMap;
  @override
  void onInit() async {
    super.onInit();

    argumentsMap = Get.arguments;
    await getData();

    /// need to change
    /// getCarDashBoardData();
  }

  Future<void> getData() async {
    isLoading.value = true;
    await myFamilyAPI();
    await getCarDashBoardData();
    isLoading.value = false;
    debugPrint("DATA NOT FOUND");
  }

  Map<String, dynamic>? familyDetails;
  Future<void> myFamilyAPI() async {
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
    }
  }

  /// ==================================
  toggleCar(index) {
    isLocked.value = isLocked.value;
    dataList[index]['isLock'] = isLocked.value;

    /// lockUnlockVehicleAPI(isLocked.value);
    update();
  }

  var isLockList = [
    false,

    false,

    ///false, false, false, false, false
  ].obs;

  var dataList = [
    {
      "image": ImagePaths.lock,
      "text": "lock\nVehicle",
      "isLock": false,
    },
    // {
    //   "image": ImagePaths.carWhite,
    //   "text": "Door\nLocking",
    //   "isLock": false,
    // },
    // {
    //   "image": ImagePaths.carWhite,
    //   "text": "Vehicle\nHood",
    //   "isLock": false,
    // },
    // {
    //   "image": ImagePaths.sunroof,
    //   "text": "Vehicle\nSunroof",
    //   "isLock": false,
    // },
    // {
    //   "image": ImagePaths.trunck,
    //   "text": "Vehicle\nTrunk",
    //   "isLock": false,
    // },
    // {
    //   "image": ImagePaths.carDoor,
    //   "text": "Vehicle\nWindows",
    //   "isLock": false,
    // },
    {
      "image": ImagePaths.battery,
      "text": "EV\nBattery",
      "isLock": false,
    },
  ].obs;

  var tempId;
  var isLocked = false.obs;
  Future<void> lockUnlockVehicleAPI(bool lockUnlock, index, id) async {
    debugPrint(lockUnlock.toString());

    try {
      var response = await API().post(
        "send-access-control-instruction",
        data: {
          'user_id': DeviceHelper.getUserId(),
          'vehicle_id': id,
          'do_lock': lockUnlock
        },
      );

      Get.log("Value  :  ${response.data}");

      Map<String, dynamic>? res = json.decode(response.data);

      if (res != null) {
        if (res['status'] == 1) {
          isLoading.value = false;
        } else {
          Get.back();
          errorDialog('Some error occurred');
        }
        isLoading.value = false;
      } else {
        Get.back();
        errorDialog('Some error occurred');
        isLoading.value = false;
      }
    } catch (e) {
      Get.back();
      errorDialog("Some error occurred");
      isLoading.value = false;
    }
  }

  getCarDashBoardData({id}) async {
    isLoading.value = true;

    tempId = argumentsMap?['id'] ?? familyDetails!['vehicles'][0]['id'];
    try {
      var response = await API().post('get-vehicle-info-batch', data: {
        'user_id': DeviceHelper.getUserId(),
        'vehicle_id':
            id ?? argumentsMap?['id'] ?? familyDetails!['vehicles'][0]['id'],
      });
      Map<String, dynamic>? mapData = jsonDecode(response.data);

      if (mapData != null) {
        if (mapData['status'] == 1) {
          if (mapData['url'] != null) {
            webUrl = mapData['url'];
            debugPrint(mapData['url']);
          } else {
            carDashBoardData = mapData['msg'];
          }
          isLoading.value = false;
        } else {
          isLoading.value = false;
          errorDialog(mapData['msg'], onTap: () {
            Get.back();

            ///Get.back();
          });
        }
      } else {
        isLoading.value = false;
        errorDialog("Something went wrong!", onTap: () {
          Get.back();

          /// Get.back();
        });
      }
    } catch (e) {
      debugPrint(e.toString());
      isLoading.value = false;
    }
  }
}
