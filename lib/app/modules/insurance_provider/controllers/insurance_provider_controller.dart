import 'dart:convert';

import 'package:american_mile/app/ui/widgets/error_dialog.dart';
import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/network/api_service.dart';

class InsuranceProviderController extends GetxController {
  late TextEditingController searchController;

  bool isLoading = false;
  String? carrierId;

  @override
  void onInit() {
    searchController = TextEditingController();
    super.onInit();
    getInsuranceProviderData();
  }

  List<Map<String, dynamic>> insuranceProviderList = [];
  List<Map<String, dynamic>> tempProviderList = [];

  //***********************************************************************//
  //****************** Get Insurance provider list ************************//
  //***********************************************************************//

  getInsuranceProviderData() async {
    isLoading = true;
    update();
    try {
      var response = await API().get('insurance-list');
      Map<String, dynamic>? mapData = jsonDecode(response.data);

      if (mapData != null) {
        mapData['msg'].forEach((item) {
          insuranceProviderList.add(item);
          tempProviderList.add(item);
        });
      }
    } catch (e) {
      errorDialog("Some error occurred");
      debugPrint(e.toString());
    }
    isLoading = false;
    update();
  }

  void searchListing(String query) {
    final suggestion = tempProviderList.where((item) {
      final itemTitle = item['name']!.toString().toLowerCase();
      final input = query.toLowerCase();
      return itemTitle.contains(input);
    }).toList();
    insuranceProviderList = suggestion;
    update();
  }
}
