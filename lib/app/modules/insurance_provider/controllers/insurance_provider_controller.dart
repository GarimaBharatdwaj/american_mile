import 'dart:convert';

import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/network/api_service.dart';
import 'package:dio/dio.dart';

class InsuranceProviderController extends GetxController {
  final count = 0.obs;

  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    getInsuranceProviderData();
  }

  List<Map<String, dynamic>> insuranceProviderListNew = [];

  //***********************************************************************//
  //****************** Get Insurance provider list ************************//
  //***********************************************************************//

  getInsuranceProviderData() async {
    isLoading = true;

    try {
      var response =
          await API().get('http://137.184.181.160/api/v3/insurance-list');

      Map<String, dynamic>? mapData = jsonDecode(response.data);

      if (mapData != null) {
        mapData['msg'].forEach((item) {
          insuranceProviderListNew.add(item);
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    isLoading = false;

    update();
  }

  List<Map<String, dynamic>> insuranceProviderList = [
    {'name': '21st Century Insurance', 'website': 'www.21st.com'},
    {'name': 'AAA Insurance', 'website': 'www.aaa.com'},
    {'name': 'American Integrity', 'website': 'www.aiicfl.com'},
    {'name': 'American Modern', 'website': 'www.amig.com'},
    {'name': 'America Mutual', 'website': 'www.amica.com'},
    {'name': 'Assurant', 'website': 'www.assurant.com'},
  ];

  void increment() => count.value++;
}
