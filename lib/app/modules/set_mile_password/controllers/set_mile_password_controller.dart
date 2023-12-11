import 'dart:convert';

import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/helpers/device_helper.dart';

import '../../../../core/network/api_service.dart';
import '../../../ui/widgets/error_dialog.dart';

class SetMilePasswordController extends GetxController {
  var formKey = GlobalKey<FormState>();

  late TextEditingController password;
  late TextEditingController confirmPassword;
  String userEmail = "";
  @override
  void onInit() {
    userEmail = Get.arguments;
    password = TextEditingController();
    confirmPassword = TextEditingController();
    super.onInit();
  }

  void validateMethode() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      setPasswordApi();
    }
    formKey.currentState!.save();
  }

  // *********************************************************************** //
  // ************************* Canopy Connect API ************************** //
  // *********************************************************************** //

  RxBool isLoading = false.obs;
  setPasswordApi() async {
    isLoading.value = true;
    try {
      var response = await API().post('set-password', data: {
        'user_id': userEmail != "" ? userEmail : DeviceHelper.getUserId(),
        'password': password.text.trim(),
        'confirmpassword': confirmPassword.text.trim(),
      });
      Map<String, dynamic>? mapData = jsonDecode(response.data);
      if (mapData != null) {
        if (mapData['status'] == 1) {
          Get.offAllNamed(Routes.HOME);
        }
      } else {
        isLoading.value = false;
        errorDialog(mapData?['msg']);
      }
    } catch (e) {
      debugPrint(e.toString());
      isLoading.value = false;
      errorDialog("Some error occurred");
    }
  }
}
