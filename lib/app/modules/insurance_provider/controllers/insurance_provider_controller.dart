import 'package:get/get.dart';

class InsuranceProviderController extends GetxController {
  //TODO: Implement InsuranceProviderController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
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
