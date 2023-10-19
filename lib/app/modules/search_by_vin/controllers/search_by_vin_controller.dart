import 'dart:convert';

import '../../../../common_lib.dart';
import '../../../../core/helpers/device_helper.dart';
import '../../../../core/network/api_service.dart';
import '../../../ui/widgets/error_dialog.dart';

class SearchByVinController extends GetxController {
  late TextEditingController vinController;
  @override
  void onInit() {
    super.onInit();
    vinController = TextEditingController(text: '1C4RJFBT4GC312961');
  }

  var formKey = GlobalKey<FormState>();

  validateMethod() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      vehicalDetailsByVIN();
    }
    formKey.currentState!.save();
  }

  RxBool isLoading = false.obs;
  vehicalDetailsByVIN() async {
    isLoading.value = true;
    try {
      var response = await API().post('vin-lookup', data: {
        'user_id': DeviceHelper.getUserId(),
        'vin': vinController.text.trim(),
      });
      Map<String, dynamic>? mapData = jsonDecode(response.data);
      if (mapData != null) {
        if (mapData['status'] == 1) {
          Get.toNamed(
            Routes.CAR_DETAILS,
            arguments: {
              'isAddingManually': false,
              'vinNumber': mapData['msg']['vehicle_details']['vin_number'],
              'year': mapData['msg']['vehicle_details']['year'],
              'make': mapData['msg']['vehicle_details']['make'],
              'model': mapData['msg']['vehicle_details']['model'],
              'body': mapData['msg']['vehicle_details']['body'],
              'type': '',
              'vehical_id': '',
            },
          );
          print(mapData['msg']['vehicle_details']['vin_number']);
        } else {
          errorDialog(mapData['msg']);
        }
      } else {
        errorDialog('some error occurred');
      }
    } catch (e) {
      debugPrint(e.toString());
      isLoading.value = false;
      errorDialog('some error occurred');
    }
    isLoading.value = false;
  }

  sendArgumentsToCarDetails() {
    Get.toNamed(Routes.CAR_DETAILS, arguments: {
      'isAddingManually': true,
      'vinNumber': '',
      'year': '',
      'make': '',
      'model': '',
      'body': '',
      'type': ''
    });
  }
}
