import '../../../../common_lib.dart';

class SearchByVinController extends GetxController {
  @override
  void onInit() {
    super.onInit();
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
