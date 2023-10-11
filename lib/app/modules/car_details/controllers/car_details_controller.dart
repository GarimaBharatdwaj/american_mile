import '../../../../common_lib.dart';

class CarDetailsController extends GetxController {
  late TextEditingController vinController;
  late TextEditingController yearController;
  late TextEditingController makeController;
  late TextEditingController modelController;
  late TextEditingController bodyController;
  late TextEditingController otpController;


  final count = 0.obs;
  @override
  void onInit() {
    vinController = TextEditingController(text: 'SALWR2REXKA826211');
    yearController = TextEditingController(text: '2019');
    makeController = TextEditingController(text: 'Land Rover');
    modelController = TextEditingController(text: 'Range Rover Sports');
    bodyController = TextEditingController(text: 'Sport Utility Vehicle (SUV)');
    otpController = TextEditingController(text: '9000000002');
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

  void increment() => count.value++;
}
