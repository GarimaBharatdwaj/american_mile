import 'dart:convert';
import 'package:american_mile/core/network/api_service.dart';
import '../../../../common_lib.dart';
import '../../../../core/helpers/device_helper.dart';

class DriverLicenceController extends GetxController {
  RxBool isLoading = false.obs;

  var formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController dlController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getDriverLicense();
  }

  //***********************************************************************//
  //****************** Get Driver's License by Scanning *******************//
  //***********************************************************************//

  getDriverLicense() async {
    isLoading.value = true;
    try {
      var response = await API().get('');
      Map<String, dynamic>? mapData = jsonDecode(response.data);

      if (mapData != null) {}
    } catch (e) {
      debugPrint(e.toString());
    }
    isLoading.value = false;
  }

  //***********************************************************************//
  //****************** Validate Driver's License form *********************//
  //***********************************************************************//

  void validateMethode() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      addDriverDetails();
    }
    formKey.currentState!.save();
  }

  //***********************************************************************//
  //****************** Add Driver's License *******************************//
  //***********************************************************************//

  addDriverDetails() async {
    final userId = DeviceHelper.getUserId();

    debugPrint(userId.toString());
    isLoading.value = true;
    try {
      var response = await API().post('add-edit-driver', data: {
        'user_id': int.parse(userId!),
        'name': nameController.text.trim(),
        'gender': genderController.text.trim(),
        'dob': dobController.text.trim(),
        'license_number': dlController.text.trim(),
        'address': addressController.text.trim()
      });
      Map<String, dynamic>? mapData = jsonDecode(response.data);
      if (mapData != null) {
        if (mapData['status'] == 1) {
          debugPrint(mapData['msg']);
        }
      }
    } catch (e) {
      debugPrint(e.toString());
      isLoading.value = false;
    }
    isLoading.value = false;
  }

  RxBool isAddingManually = false.obs;

  makeFormEditable() {
    isAddingManually.value = true;
  }
}
