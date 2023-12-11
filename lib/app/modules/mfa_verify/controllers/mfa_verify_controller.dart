import 'dart:convert';

import '../../../../common_lib.dart';
import '../../../../core/helpers/device_helper.dart';
import '../../../../core/network/api_service.dart';
import '../../../ui/widgets/error_dialog.dart';

class MfaVerifyController extends GetxController {
  Map<String, dynamic>? mfaOptions;

  Rx<bool> isLoading = false.obs;

  Rx<bool> isCodeSent = false.obs;

  TextEditingController otpController = TextEditingController();

  Rx<int> verificationMethod = 1.obs;

  @override
  void onInit() {
    super.onInit();

    mfaOptions = Get.arguments;
  }

  submitMfa() async {
    isLoading.value = true;

    try {
      var response = await API().post('submit-mfa', data: {
        'pull_id': mfaOptions!.elementAt(0),
        'pull_jwt': mfaOptions!.elementAt(1),
        'mfaValue': otpController.text,
      });
      Map<String, dynamic>? mapData = jsonDecode(response.data);
      if (mapData != null) {
        if (mapData['status'] == 1) {
          debugPrint(".\n\n\n\n\n\n\n.MFA SUBMITTED.\n\n\n\n\n\n\n\n\n\n.");

          canopyConnectSecondaryFistApi(
              mfaOptions!.elementAt(verificationMethod.value));

          /// canopyConnectApi(mfaOptions!.elementAt(verificationMethod.value));
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


  /// Calling it twice
  canopyConnectSecondaryFistApi(String email) async {
    debugPrint(".\n\n\n\n\n\n\n.Canopy Connect Secondary First Api Called.\n\n\n\n\n\n\n\n\n\n.");
    isLoading.value = true;
    var userId = DeviceHelper.getUserId();
    try {
      var response = await API().post('canopy-connect-secondary', data: {
        'user_id' : userId,
        'pull_id': mfaOptions!.elementAt(0),
      });
      /// Map<String, dynamic>? mapData = jsonDecode(response.data);
      canopyConnectSecondaryApi(email);
    } catch (e) {
      debugPrint(e.toString());
      canopyConnectSecondaryApi(email);
    }
  }

  canopyConnectSecondaryApi(String email) async {
    debugPrint(".\n\n\n\n\n\n\n.Canopy Connect Secondary Twice Api Called.\n\n\n\n\n\n\n\n\n\n.");
    isLoading.value = true;
    var userId = DeviceHelper.getUserId();
    try {
      var response = await API().post('canopy-connect-secondary', data: {
        'user_id' : userId,
        'pull_id': mfaOptions!.elementAt(0),
      });
      Map<String, dynamic>? mapData = jsonDecode(response.data);
      if (mapData != null) {
        if (mapData['status'] == true) {
          if (userId != null) {
            Get.offAllNamed(Routes.HOME);
          } else {
            DeviceHelper.saveUserId(mapData['user_id']);
            await Get.toNamed(
              Routes.SET_MILE_PASSWORD,
              arguments: email,
            );
          }
          isLoading.value = false;
        }else{
          errorDialog("Some Error Occurred");
        }
      } else {
        errorDialog("Some Error Occurred");
        isLoading.value = false;
      }
    } catch (e) {
      debugPrint(e.toString());
      isLoading.value = false;
    }
  }

  canopyConnectApi(String email) async {
    try {
      var response = await API().post('canopy-connect', data: {
        'pull_id': mfaOptions!.elementAt(0),
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
        errorDialog("");
        isLoading.value = false;
      }
    } catch (e) {
      debugPrint(e.toString());
      isLoading.value = false;
    }
  }

  sendVerificationCode(String key) async {
    isLoading.value = true;

    try {
      var response = await API().post('select-id-verification', data: {
        'pull_id': mfaOptions!.elementAt(0),
        'pull_jwt': mfaOptions!.elementAt(1),
        'optionKey': key,
      });
      Map<String, dynamic>? mapData = jsonDecode(response.data);
      if (mapData != null) {
        if (mapData['status'] == 1) {
          isCodeSent.value = true;
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
    isLoading.value = false;
  }
}

extension GetByKeyIndex on Map {
  elementAt(int index) => values.elementAt(index);
}
