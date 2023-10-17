import 'dart:convert';

import '../../../../common_lib.dart';
import '../../../../core/network/api_service.dart';

class CarDetailsController extends GetxController {
  late TextEditingController vinController;
  late TextEditingController yearController;
  late TextEditingController makeController;
  late TextEditingController modelController;
  late TextEditingController bodyController;
  late TextEditingController otpController;

  final count = 0.obs;
  @override
  void onInit() {
    vinController = TextEditingController(text: 'SALWR2REXKA826211');
    yearController = TextEditingController(text: '2019');
    makeController = TextEditingController(text: 'Land Rover');
    modelController = TextEditingController(text: 'Range Rover Sports');
    bodyController = TextEditingController(text: 'Sport Utility Vehicle (SUV)');
    otpController = TextEditingController(text: '9000000002');
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

  //***********************************************************************//
  //****************** Add Driver's License *******************************//
  //***********************************************************************//
  RxBool isLoading = false.obs;
  addDriverDetails() async {
    isLoading.value = true;
    try {
      var response = await API().post('add-edit-driver', data: {
        'user_id': "14",
        'vin_number': vinController.text.trim(),
        'year': yearController.text.trim(),
        'make': makeController.text.trim(),
        'model': modelController.text.trim(),
        'body': bodyController.text.trim()
      });
      Map<String, dynamic>? mapData = jsonDecode(response.data);
      if (mapData != null) {
        if (mapData['status'] == 1) {}
      } else {}
    } catch (e) {
      debugPrint(e.toString());
      isLoading.value = false;
    }
    isLoading.value = false;
  }
}
