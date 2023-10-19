import 'package:american_mile/common_lib.dart';

class SetMilePasswordController extends GetxController {
  late TextEditingController password;
  late TextEditingController confirmPassword;
  String userEmail = "";
  @override
  void onInit() {
    userEmail = Get.arguments;
    password = TextEditingController();
    confirmPassword = TextEditingController();
    super.onInit();
  }
}
