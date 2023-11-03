import 'dart:convert';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:intl/intl.dart';
import '../../../../common_lib.dart';
import '../../../../core/helpers/device_helper.dart';
import '../../../../core/network/api_service.dart';
import '../../../../core/utils/index.dart';

class DriverDetailsController extends GetxController {
  RxBool isLoading = false.obs;

  var formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController genderController;
  late TextEditingController dobController;
  late TextEditingController dlController;
  late TextEditingController addressController;

  RxBool isAddingManually = true.obs;
  RxBool isEdit = false.obs;

  Map<String, dynamic>? args;

  @override
  void onInit() {
    super.onInit();
    args = Get.arguments;
    nameController = TextEditingController();
    genderController = TextEditingController();
    dobController = TextEditingController();
    dlController = TextEditingController();
    addressController = TextEditingController();
    setArgumentsValue();
  }

  setArgumentsValue() {
    if (args != null) {
      isAddingManually.value = args!['isAddingManually'];
      isEdit.value = args!['edit'];
      if (isAddingManually.value == false) {
        nameController.text = args!['name'];
        if (args!['gender'] == "M") {
          genderController.text = "Male";
        } else {
          genderController.text = "Female";
        }

        dobController.text = args!['dob'];
        dlController.text = args!['dl'];
        addressController.text = args!['address'];
      }
    }
  }

  //***********************************************************************//
  //****************** Validate Driver's License form *********************//
  //***********************************************************************//

  void validateMethode() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      addUpdateDriverDetails();
    }
    formKey.currentState!.save();
  }

  //***********************************************************************//
  //****************** Add Driver's License *******************************//
  //***********************************************************************//

  addUpdateDriverDetails() async {
    final userId = DeviceHelper.getUserId();

    debugPrint(userId.toString());
    isLoading.value = true;
    try {
      var response = await API().post('add-edit-driver', data: {
        'user_id': DeviceHelper.getUserId() ?? "",
        'name': nameController.text.trim(),
        'gender': genderController.text == "Male" ? "M" : "F",
        'dob': dobController.text.trim(),
        'license_number': dlController.text.trim(),
        'address': addressController.text.trim(),
        'driver_id': args!['driverId'] ?? '',
      });
      Map<String, dynamic>? mapData = jsonDecode(response.data);
      if (mapData != null) {
        if (mapData['status'] == 1) {
          debugPrint(mapData['msg']);
          if (args!['driverId'] != null && args!['driverId'] != '') {
            Get.back(result: true);
          } else {
            Get.back(result: true);
            Get.back(result: true);
          }
        }
      }
    } catch (e) {
      debugPrint(e.toString());
      isLoading.value = false;
    }
    isLoading.value = false;
  }

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
      dateFormat: "yyyy",
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
      String formattedDate = DateFormat('yyyy').format(pickedBirthDate!);
      controller.text = formattedDate;
      Get.log("ALpha Date : $formattedDate");
      update();
    }
  }
}
