import 'dart:convert';
import 'package:american_mile/core/network/api_service.dart';
import 'package:american_mile/core/utils/index.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:intl/intl.dart';
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
        'user_id': "14",
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

  //******************************************************************//
  //************************* Date Picker ****************************//
  //******************************************************************//

  DateTime? pickedBirthDate;
  showDatePickerMethod(
      BuildContext context, TextEditingController controller) async {
    var picked = await DatePicker.showSimpleDatePicker(
      context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1960),
      lastDate: DateTime.now(),
      dateFormat: "MMMM-dd-yyyy",
      locale: DateTimePickerLocale.en_us,
      looping: true,
      itemTextStyle: Get.textTheme.bodyLarge?.copyWith(
        color: AppColors.primary,
        fontWeight: FontWeight.w600,
      ),
      textColor: AppColors.primary,
    );
    if (picked != null && picked != pickedBirthDate) {
      pickedBirthDate = picked;
      String formattedDate = DateFormat('MM-dd-yyyy').format(pickedBirthDate!);
      controller.text = formattedDate;
      Get.log("ALpha Date : $formattedDate");
      update();
    }
  }
}
