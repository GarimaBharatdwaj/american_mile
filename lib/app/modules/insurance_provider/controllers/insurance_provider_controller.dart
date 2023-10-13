import 'dart:convert';

import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/network/api_service.dart';

class InsuranceProviderController extends GetxController {
  final count = 0.obs;

  RxBool isLoading = false.obs;
  String? carrierId;

  @override
  void onInit() {
    super.onInit();
    getInsuranceProviderData();
  }

  List<Map<String, dynamic>> insuranceProviderList = [];

  //***********************************************************************//
  //****************** Get Insurance provider list ************************//
  //***********************************************************************//

  getInsuranceProviderData() async {
    isLoading.value = true;
    try {
      var response = await API().get('insurance-list');
      Map<String, dynamic>? mapData = jsonDecode(response.data);

      if (mapData != null) {
        mapData['msg'].forEach((item) {
          insuranceProviderList.add(item);
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    isLoading.value = false;
  }
}
