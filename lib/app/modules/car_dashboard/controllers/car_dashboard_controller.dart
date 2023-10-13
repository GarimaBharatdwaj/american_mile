import 'package:american_mile/core/utils/index.dart';
import 'package:get/get.dart';

class CarDashboardController extends GetxController {
  //TODO: Implement CarDashboardController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

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
}
