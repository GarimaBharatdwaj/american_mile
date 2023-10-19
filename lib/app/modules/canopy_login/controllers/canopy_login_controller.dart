import 'dart:convert';

import 'package:american_mile/app/ui/widgets/error_dialog.dart';

import '../../../../common_lib.dart';
import '../../../../core/network/api_service.dart';

class CanopyLoginController extends GetxController {
  RxBool isLoading = false.obs;
  String? carrierId;

  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void onInit() {
    carrierId = Get.arguments;
    emailController = TextEditingController(text: "user_good");
    passwordController = TextEditingController(text: "pass_good");
    super.onInit();
  }

  // *********************************************************************** //
  // ******************************* Login ********************************* //
  // *********************************************************************** //
  Map<String, dynamic>? login;
  canopyLogin() async {
    isLoading.value = true;
    try {
      var response = await API().post('comsumer-login', data: {
        'username': emailController.text.trim(),
        'password': passwordController.text.trim(),
        'insurance': carrierId,
      });
      Map<String, dynamic>? mapData = jsonDecode(response.data);
      if (mapData != null) {
        if (mapData['status'] == 1) {
          login = mapData['msg'];
          Future.delayed(600.milliseconds).then((value) {
            pullCanopy();
          });
        }
      } else {
        errorDialog("");
        isLoading.value = false;
      }
    } catch (e) {
      debugPrint(e.toString());
      isLoading.value = false;
    }
  }

  // *********************************************************************** //
  // ******************************* Login ********************************* //
  // *********************************************************************** //

  pullCanopy() async {
    try {
      var response = await API().post('pull', data: {
        'pull_id': login!['pull_id'],
        'pull_jwt': login!['pull_jwt'],
      });
      Map<String, dynamic>? mapData = jsonDecode(response.data);
      if (mapData != null) {
        if (mapData['status'] == 1) {
          debugPrint(
            mapData['msg']['account_email'],
          );
          await Get.toNamed(
            Routes.SET_MILE_PASSWORD,
            arguments: mapData['msg']['account_email'],
          );
          isLoading.value = false;
        }
      } else {
        errorDialog("");
        isLoading.value = false;
      }
    } catch (e) {
      debugPrint(e.toString());
      isLoading.value = false;
    }
  }
}
