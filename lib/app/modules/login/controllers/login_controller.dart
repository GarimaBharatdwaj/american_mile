import 'dart:convert';
import 'package:american_mile/app/ui/widgets/error_dialog.dart';
import 'package:american_mile/core/helpers/device_helper.dart';
import 'package:american_mile/core/network/api_service.dart';
import 'package:flutter/foundation.dart';
import '../../../../common_lib.dart';

enum LoginViaEmailOrPhone { email, phone }

class LoginController extends GetxController {

  var formKey = GlobalKey<FormState>();

  final count = 0.obs;
  RxBool isLoading = false.obs;

  RxBool isLoginTypeEmail = true.obs;
  Rx<LoginViaEmailOrPhone> loginViaEmailOrPhone =
      LoginViaEmailOrPhone.email.obs;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void validateMethode() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      login();
    }
    formKey.currentState!.save();
  }

  // *********************************************************************** //
  // ******************************* Login ********************************* //
  // *********************************************************************** //

  login() async {
    isLoading.value = true;
    try {
      var response = await API().post('sign-in', data: {
        'email': emailController.text.trim(),
        'password': passwordController.text.trim(),
        'mobile': mobileController.text.trim(),
        'type': isLoginTypeEmail.value ? 'email' : 'mobile'
      });
      Map<String, dynamic>? mapData = jsonDecode(response.data);
      if (mapData != null) {
        if (mapData['status'] == 1) {
          DeviceHelper.saveUserId(mapData['user_data']['user_id']);
          if (kDebugMode) {
            print(mapData);
          }

          Future.delayed(const Duration(milliseconds: 500), () {
            Get.offAllNamed(Routes.HOME);
          });
        } else {
          errorDialog(mapData['msg']);
          isLoading.value = false;
        }
      } else {
        errorDialog("Something went wrong");
        isLoading.value = false;
      }
    } catch (e) {
      debugPrint(e.toString());
      isLoading.value = false;
    }
  }
}
