import 'dart:convert';

import 'package:american_mile/app/ui/widgets/error_dialog.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:intl/intl.dart';

import '../../../../common_lib.dart';
import '../../../../core/network/api_service.dart';
import '../../../../core/utils/app_colors.dart';

class CarDetailsController extends GetxController {
  late TextEditingController vinController;
  late TextEditingController yearController;
  late TextEditingController makeController;
  late TextEditingController modelController;
  late TextEditingController bodyController;
  late TextEditingController otpController;

  var formKey = GlobalKey<FormState>();

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

      vinController = TextEditingController(text: args!['vinNumber']);
      yearController = TextEditingController(text: args!['year']);
      makeController = TextEditingController(text: args!['make']);
      modelController = TextEditingController(text: args!['model']);
      bodyController = TextEditingController(text: args!['body']);
      otpController = TextEditingController(text: '');
    } else {
      vinController = TextEditingController(text: 'SALWR2REXKA826211');
      yearController = TextEditingController(text: '2019');
      makeController = TextEditingController(text: 'Land Rover');
      modelController = TextEditingController(text: 'Range Rover Sports');
      bodyController =
          TextEditingController(text: 'Sport Utility Vehicle (SUV)');
      otpController = TextEditingController(text: '9000000002');
    }
  }

  //***********************************************************************//
  //****************** Validate VIN form *********************//
  //***********************************************************************//

  void validateMethode() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      addVinDetails();
    }
    formKey.currentState!.save();
  }

  //***********************************************************************//
  //****************** Add Vin ********************************************//
  //***********************************************************************//

  RxBool isLoading = false.obs;
  addVinDetails() async {
    isLoading.value = true;
    try {
      var response = await API().post('add-vehicle', data: {
        'user_id': "14",
        'vin_number': vinController.text.trim(),
        'year': yearController.text.trim(),
        'make': makeController.text.trim(),
        'model': modelController.text.trim(),
        'body': bodyController.text.trim()
      });
      Map<String, dynamic>? mapData = jsonDecode(response.data);
      if (mapData != null) {
        if (mapData['status'] == 1) {
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
