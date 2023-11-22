import 'dart:convert';
import 'package:american_mile/app/ui/widgets/error_dialog.dart';
import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/helpers/device_helper.dart';
import 'package:american_mile/core/network/api_service.dart';
import 'package:american_mile/core/utils/index.dart';

class CarDashboardController extends GetxController {
  RxBool isLoading = false.obs;
  Map<String, dynamic>? carDashBoardData;
  String? webUrl;

  String? vehicleId;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

    vehicleId = Get.arguments;
    getCarDashBoardData();
  }

  List<Map<String, dynamic>> dataList = [
    {
      "image": ImagePaths.carWhite,
      "text": "Door\nLocking",
    },
    {
      "image": ImagePaths.carWhite,
      "text": "Vehicle\nHood",
    },
    {
      "image": ImagePaths.sunroof,
      "text": "Vehicle\nSunroof",
    },
    {
      "image": ImagePaths.trunck,
      "text": "Vehicle\nTrunk",
    },
    {
      "image": ImagePaths.carDoor,
      "text": "Vehicle\nWindows",
    },
    {
      "image": ImagePaths.battery,
      "text": "EV\nBattery",
    },
  ];

  getCarDashBoardData() async {
    isLoading.value = true;

    try {
      var response = await API().post('get-vehicle-info-batch',
          data: {'user_id': DeviceHelper.getUserId(), 'vehicle_id': vehicleId});
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
          errorDialog("Something went wrong!");
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
