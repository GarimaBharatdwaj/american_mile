import '../../../../common_lib.dart';

class SearchByVinController extends GetxController {
  late TextEditingController vinController;
  @override
  void onInit() {
    super.onInit();
    vinController = TextEditingController();
  }

  var formKey = GlobalKey<FormState>();

  validateMethod() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      Get.toNamed(Routes.CAR_DETAILS);
    }
    formKey.currentState!.save();
  }

  sendArgumentsToCarDetails() {
    Get.toNamed(Routes.CAR_DETAILS, arguments: {
      'isAddingManually': true,
      'vinNumber': '',
      'year': '',
      'make': '',
      'model': '',
      'body': ''
    });
  }
}
