import 'dart:convert';
import 'package:american_mile/app/ui/widgets/error_dialog.dart';
import '../../../../common_lib.dart';
import '../../../../core/helpers/device_helper.dart';
import '../../../../core/network/api_service.dart';

class CanopyLoginController extends GetxController {
  var formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;
  String? carrierId;

  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void onInit() {
    carrierId = Get.arguments;
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  void validateMethode() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      canopyLogin();
    }
    formKey.currentState!.save();
  }

  // *********************************************************************** //
  // ******************************* Login ********************************* //
  // *********************************************************************** //

  Map<String, dynamic>? login;
  canopyLogin() async {
    debugPrint("\n\n\n\n$carrierId\n\n\n");

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
          Future.delayed(3000.milliseconds).then((value) {
            pullCanopy();
          });
        } else {
          errorDialog("Something went wrong!");
          isLoading.value = false;
        }
      } else {
        errorDialog("Something went wrong!");
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
    var map = {
      'pull_id': login!['pull_id'],
      'pull_jwt': login!['pull_jwt'],
    };

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
          if (mapData['msg']['mfa_options'] != null) {
            isLoading.value = false;
            map.addAll(mapData['msg']['mfa_options']);
            Get.toNamed(Routes.MFA_VERIFY, arguments: map);
          } else {
            if (mapData['msg']['account_email'] != null &&
                mapData['msg']['account_email'] != "") {
              canopyConnectApi(mapData['msg']['account_email']);
            } else {
              isLoading.value = false;
              errorDialog('Something went wrong, please try again later');
            }
          }
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
  // *********************************************************************** //
  // ************************* Canopy Connect API ************************** //
  // *********************************************************************** //

  canopyConnectApi(String email) async {
    try {
      var response = await API().post('canopy-connect', data: {
        'pull_id': login!['pull_id'],
      });
      Map<String, dynamic>? mapData = jsonDecode(response.data);
      if (mapData != null) {
        if (mapData['status'] == 1) {
          if (DeviceHelper.getUserId() != null) {
            Get.offAllNamed(Routes.HOME);
          } else {
            DeviceHelper.saveUserId(mapData['user_id']);
            await Get.toNamed(
              Routes.SET_MILE_PASSWORD,
              arguments: email,
            );
          }
          isLoading.value = false;
        }
      } else {
        errorDialog("msg");
        isLoading.value = false;
      }
    } catch (e) {
      errorDialog("Some error occurred");
      debugPrint(e.toString());
      isLoading.value = false;
    }
  }
}
