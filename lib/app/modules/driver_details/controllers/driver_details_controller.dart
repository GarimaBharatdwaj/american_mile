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

  RxBool isAddingManually = false.obs;

  Map<String, dynamic>? args;

  @override
  void onInit() {
    super.onInit();
    args = Get.arguments;
    setArgumentsValue();
  }

  setArgumentsValue() {
    if (args != null) {
      isAddingManually.value = args!['isAddingManually'];
      nameController = TextEditingController(text: args!['name']);
      genderController = TextEditingController(text: args!['gender']);
      dobController = TextEditingController(text: args!['dob']);
      dlController = TextEditingController(text: args!['dl']);
      addressController = TextEditingController(text: args!['address']);
    } else {
      nameController = TextEditingController(text: 'SALWR2REXKA826211');
      genderController = TextEditingController(text: '2019');
      dobController = TextEditingController(text: 'Land Rover');
      dlController = TextEditingController(text: 'Range Rover Sports');
      addressController =
          TextEditingController(text: 'Sport Utility Vehicle (SUV)');
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
