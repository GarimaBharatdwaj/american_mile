import 'dart:convert';

import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/helpers/device_helper.dart';
import 'package:american_mile/core/network/api_service.dart';

class UserProfileController extends GetxController {
  RxBool isLoading = false.obs;
  Map<String, dynamic>? userData;

  @override
  void onInit() {
    super.onInit();
    getUserProfile();
  }

  getUserProfile() async {
    String? id = DeviceHelper.getId();

    debugPrint(id.toString());
    isLoading.value = true;
    try {
      var response = await API().post('get-profile', data: {
        'user_id': int.parse(id!),
      });
      Map<String, dynamic>? mapData = jsonDecode(response.data);
      if (mapData != null) {
        userData = mapData['user_data'];
      }
    } catch (e) {
      debugPrint(e.toString());
      isLoading.value = false;
    }
    isLoading.value = false;
  }
}
