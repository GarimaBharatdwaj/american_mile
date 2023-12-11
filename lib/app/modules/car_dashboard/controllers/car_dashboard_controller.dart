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

  final thankYouUrl = 'https://pyot.co.in/thankyou';
  final thankYouUrlTwo = 'https://pyot.co.in/Smartcar_api/browser_callback';

  // String? vehicleId;

  final count = 0.obs;
  late Map<String, dynamic> argumentsMap;
  @override
  void onInit() {
    super.onInit();

    argumentsMap = Get.arguments;
    getCarDashBoardData();
  }

  toggleCar(index) {
    isLocked.value = isLocked.value;
    dataList[index]['isLock'] = isLocked.value;

    /// lockUnlockVehicleAPI(isLocked.value);
    update();
  }

  var isLockList = [false, false, false, false, false, false, false].obs;

  var dataList = [
    {
      "image": ImagePaths.lock,
      "text": "lock\nVehicle",
      "isLock": false,
    },
    {
      "image": ImagePaths.carWhite,
      "text": "Door\nLocking",
      "isLock": false,
    },
    {
      "image": ImagePaths.carWhite,
      "text": "Vehicle\nHood",
      "isLock": false,
    },
    {
      "image": ImagePaths.sunroof,
      "text": "Vehicle\nSunroof",
      "isLock": false,
    },
    {
      "image": ImagePaths.trunck,
      "text": "Vehicle\nTrunk",
      "isLock": false,
    },
    {
      "image": ImagePaths.carDoor,
      "text": "Vehicle\nWindows",
      "isLock": false,
    },
    {
      "image": ImagePaths.battery,
      "text": "EV\nBattery",
      "isLock": false,
    },
  ].obs;

  var isLocked = false.obs;
  Future<void> lockUnlockVehicleAPI(bool lockUnlock, index) async {
    debugPrint(lockUnlock.toString());

    try {
      var response = await API().post(
        "send-access-control-instruction",
        data: {
          'user_id': DeviceHelper.getUserId(),
          'vehicle_id': argumentsMap['id'],
          'do_lock': lockUnlock
        },
      );

      Get.log("Value  :  ${response.data}");

      Map<String, dynamic>? res = json.decode(response.data);

      if (res != null) {
        if (res['status'] == 1) {
        } else {
          errorDialog('Some error occurred');
        }
        isLoading.value = false;
      }
      isLoading.value = false;
    } catch (e) {
      errorDialog("Some error occurred");
      isLoading.value = false;
    }
  }

  getCarDashBoardData() async {
    isLoading.value = true;

    try {
      var response = await API().post('get-vehicle-info-batch', data: {
        'user_id': DeviceHelper.getUserId(),
        'vehicle_id': argumentsMap['id'],
      });
      Map<String, dynamic>? mapData = jsonDecode(response.data);
      if (mapData != null) {
        if (mapData['status'] == 1) {
          webUrl = mapData['url'];

          if (mapData['url'] != null) {
            debugPrint(mapData['url']);
          }

          carDashBoardData = mapData['msg'];
          isLoading.value = false;
        } else {
          errorDialog(mapData['msg']);
          isLoading.value = false;
        }
      } else {
        errorDialog("Something went wrong!");
        isLoading.value = false;
      }
    } catch (e) {
      debugPrint(e.toString());
      isLoading.value = false;
    }
  }
}
