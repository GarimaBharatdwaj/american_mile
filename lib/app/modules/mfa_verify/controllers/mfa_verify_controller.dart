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
          canopyConnectApi(mfaOptions!.elementAt(verificationMethod.value));
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

  sendVerificationCode() async {
    isLoading.value = true;

    try {
      var response = await API().post('select-id-verification', data: {
        'pull_id': mfaOptions!.elementAt(0),
        'pull_jwt': mfaOptions!.elementAt(1),
        'optionKey': 'email',
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
